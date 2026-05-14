# Error Handling Strategy – Backend API

**Status:** Design document (implementation in Phase 2)  
**Purpose:** Define consistent error handling across all REST endpoints

---

## 📋 HTTP Status Codes

| Code | Usage | Example |
|------|-------|---------|
| **200 OK** | Success | GET item, successful update |
| **201 Created** | Resource created | POST new item |
| **204 No Content** | Success, no body | DELETE item |
| **400 Bad Request** | Validation error | Invalid colour enum, missing required field |
| **401 Unauthorized** | No Firebase token | Missing `Authorization` header |
| **403 Forbidden** | Access denied | User trying to delete another user's item |
| **404 Not Found** | Resource doesn't exist | GET /api/items/999 |
| **409 Conflict** | Business logic violation | Create duplicate Wardrobe, loan item already borrowed |
| **500 Internal Server Error** | Server error | Database connection failure |
| **503 Service Unavailable** | Maintenance | Firebase service down |

---

## 🎯 Custom Exceptions (to create)

### Base Exception
```java
public class ClosetApiException extends RuntimeException {
    private final HttpStatus status;
    private final String errorCode;
    
    public ClosetApiException(HttpStatus status, String errorCode, String message) {
        super(message);
        this.status = status;
        this.errorCode = errorCode;
    }
}
```

### Specific Exceptions
```java
// 400 Bad Request
class ValidationException extends ClosetApiException {
    public ValidationException(String field, String message) {
        super(HttpStatus.BAD_REQUEST, "VALIDATION_ERROR", field + ": " + message);
    }
}

// 401 Unauthorized
class UnauthorizedException extends ClosetApiException {
    public UnauthorizedException(String message) {
        super(HttpStatus.UNAUTHORIZED, "UNAUTHORIZED", message);
    }
}

// 403 Forbidden
class AccessDeniedException extends ClosetApiException {
    public AccessDeniedException(String message) {
        super(HttpStatus.FORBIDDEN, "ACCESS_DENIED", message);
    }
}

// 404 Not Found
class ResourceNotFoundException extends ClosetApiException {
    public ResourceNotFoundException(String resource, Long id) {
        super(HttpStatus.NOT_FOUND, "NOT_FOUND", 
              resource + " with id " + id + " not found");
    }
}

// 409 Conflict
class ConflictException extends ClosetApiException {
    public ConflictException(String message) {
        super(HttpStatus.CONFLICT, "CONFLICT", message);
    }
}
```

---

## 🛡️ Global Error Handler (@ControllerAdvice)

```java
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    
    @ExceptionHandler(ClosetApiException.class)
    public ResponseEntity<ErrorResponse> handleClosetException(ClosetApiException ex) {
        log.warn("API error: {} - {}", ex.getErrorCode(), ex.getMessage());
        return ResponseEntity
            .status(ex.getStatus())
            .body(new ErrorResponse(
                ex.getErrorCode(),
                ex.getMessage(),
                Instant.now()
            ));
    }
    
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponse> handleValidationException(
            MethodArgumentNotValidException ex) {
        String message = ex.getBindingResult()
            .getFieldErrors()
            .stream()
            .map(e -> e.getField() + ": " + e.getDefaultMessage())
            .collect(Collectors.joining("; "));
        
        log.warn("Validation error: {}", message);
        return ResponseEntity
            .status(HttpStatus.BAD_REQUEST)
            .body(new ErrorResponse(
                "VALIDATION_ERROR",
                message,
                Instant.now()
            ));
    }
    
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleGenericException(Exception ex) {
        log.error("Unexpected error", ex);
        return ResponseEntity
            .status(HttpStatus.INTERNAL_SERVER_ERROR)
            .body(new ErrorResponse(
                "INTERNAL_ERROR",
                "An unexpected error occurred",
                Instant.now()
            ));
    }
}

@Data
class ErrorResponse {
    private String errorCode;
    private String message;
    private Instant timestamp;
    
    public ErrorResponse(String errorCode, String message, Instant timestamp) {
        this.errorCode = errorCode;
        this.message = message;
        this.timestamp = timestamp;
    }
}
```

---

## ✅ Validation Strategy

### DTO Level (@Validated)
```java
@Data
public class CreateItemRequest {
    @NotBlank(message = "Name is required")
    @Size(max = 150, message = "Name too long")
    private String name;
    
    @NotNull(message = "Colour is required")
    private Colours colour;
    
    @NotNull(message = "Wardrobe ID is required")
    @Positive(message = "Wardrobe ID must be positive")
    private Long wardrobeId;
}
```

### Service Level
```java
public class ItemService {
    public ItemDTO createItem(Long userId, CreateItemRequest request) {
        // 1. Check wardrobe exists and belongs to user
        Wardrobe wardrobe = wardrobeRepository.findById(request.getWardrobeId())
            .orElseThrow(() -> new ResourceNotFoundException("Wardrobe", request.getWardrobeId()));
        
        if (!wardrobe.getUser().getId().equals(userId)) {
            throw new AccessDeniedException("You don't have permission to access this wardrobe");
        }
        
        // 2. Check for duplicates (if applicable)
        if (clothesRepository.existsByNameAndWardrobe(request.getName(), wardrobe)) {
            throw new ConflictException("Item with name '" + request.getName() + "' already exists in this wardrobe");
        }
        
        // 3. Create and save
        Item item = new Item();
        // ... map fields ...
        return itemMapper.toDTO(itemRepository.save(item));
    }
}
```

### Controller Level
```java
@RestController
@RequestMapping("/api/items")
public class ItemController {
    
    @PostMapping
    public ResponseEntity<ItemDTO> createItem(
            @AuthenticationPrincipal User user,
            @Valid @RequestBody CreateItemRequest request) {
        ItemDTO item = itemService.createItem(user.getId(), request);
        return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(item);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<ItemDTO> getItem(
            @AuthenticationPrincipal User user,
            @PathVariable Long id) {
        ItemDTO item = itemService.getItem(user.getId(), id);
        return ResponseEntity.ok(item);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteItem(
            @AuthenticationPrincipal User user,
            @PathVariable Long id) {
        itemService.deleteItem(user.getId(), id);
        return ResponseEntity.noContent().build();
    }
}
```

---

## 🧪 Test Examples

### Happy Path
```java
@Test
void createItem_validRequest_returns201() {
    CreateItemRequest request = new CreateItemRequest();
    request.setName("Blue Shirt");
    request.setColour(Colours.BLUE);
    request.setWardrobeId(1L);
    
    MvcResult result = mockMvc.perform(post("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(objectMapper.writeValueAsString(request))
            .header("Authorization", "Bearer valid-token"))
        .andExpect(status().isCreated())
        .andExpect(jsonPath("$.id").exists())
        .andReturn();
}
```

### Validation Error
```java
@Test
void createItem_missingName_returns400() {
    CreateItemRequest request = new CreateItemRequest();
    request.setColour(Colours.BLUE);
    request.setWardrobeId(1L);
    // name is missing
    
    mockMvc.perform(post("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(objectMapper.writeValueAsString(request))
            .header("Authorization", "Bearer valid-token"))
        .andExpect(status().isBadRequest())
        .andExpect(jsonPath("$.errorCode").value("VALIDATION_ERROR"));
}
```

### Not Found
```java
@Test
void getItem_notFound_returns404() {
    mockMvc.perform(get("/api/items/999")
            .header("Authorization", "Bearer valid-token"))
        .andExpect(status().isNotFound())
        .andExpect(jsonPath("$.errorCode").value("NOT_FOUND"));
}
```

### Access Denied
```java
@Test
void deleteItem_notOwner_returns403() {
    // user1 trying to delete user2's item
    mockMvc.perform(delete("/api/items/123")
            .header("Authorization", "Bearer user1-token"))
        .andExpect(status().isForbidden())
        .andExpect(jsonPath("$.errorCode").value("ACCESS_DENIED"));
}
```

### Conflict
```java
@Test
void createItem_duplicate_returns409() {
    // Try to create item with same name in same wardrobe
    mockMvc.perform(post("/api/items")
            .contentType(MediaType.APPLICATION_JSON)
            .content(objectMapper.writeValueAsString(duplicateRequest))
            .header("Authorization", "Bearer valid-token"))
        .andExpect(status().isConflict())
        .andExpect(jsonPath("$.errorCode").value("CONFLICT"));
}
```

---

## 📋 Checklist for Each Endpoint

When implementing REST endpoints, ensure:

- [ ] DTO has `@Validated` annotations
- [ ] Service validates business logic and throws appropriate exceptions
- [ ] Controller catches exceptions via @ControllerAdvice
- [ ] Returns correct HTTP status code (200, 201, 400, 404, 403, 409, 500)
- [ ] All endpoints require authentication (`@AuthenticationPrincipal User user`)
- [ ] User can only access their own data (wardrobe, items, loans)
- [ ] Tests cover happy path + all error scenarios
- [ ] Error response includes `errorCode`, `message`, `timestamp`
- [ ] Logging includes user ID and operation for debugging
- [ ] No sensitive data (passwords, tokens) in error messages

---

**Next:** Apply this strategy when implementing Phase 2 endpoints (ItemController, LoanController, WardrobeController).

