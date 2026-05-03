# Closet App – Backend

REST API for the Closet App. Handles authentication via Firebase tokens and stores user wardrobe data in PostgreSQL.

## Architecture

```
Mobile (Flutter)
  └── Firebase Auth ──→ ID token (JWT)
         │
         ▼
  Spring Boot API  ──→  PostgreSQL
  - validates token locally (no Firebase call)
  - creates user on first login (findOrCreate)
  - protects all endpoints with Spring Security
```

## Tech Stack

- **Java 23**
- **Spring Boot 3.5.14**
- **Maven 3.9+**
- **PostgreSQL 15+**
- **Spring Security** – stateless JWT-based auth
- **Firebase Admin SDK 9.4.3** – ID token validation
- **Spring Data JPA / Hibernate**
- **Flyway** – database migrations
- **Lombok + MapStruct**
- **SpringDoc OpenAPI** – Swagger UI at `/swagger-ui/index.html`

## Project Structure

```
backend/
 └── src/
      ├── main/java/
      │    ├── admin/
      │    │    ├── config/
      │    │    │    ├── FirebaseConfig.java     ← Firebase Admin SDK init
      │    │    │    ├── SecurityConfig.java     ← Spring Security (stateless)
      │    │    │    └── OpenApiConfig.java      ← Swagger Bearer auth
      │    │    └── security/
      │    │         └── FirebaseTokenFilter.java ← validates JWT per request
      │    ├── user/
      │    │    ├── User.java
      │    │    ├── UserRepository.java
      │    │    ├── UserService.java             ← findOrCreate from Firebase token
      │    │    └── UserController.java          ← GET /api/users/me
      │    └── wardrobeManager/
      │         ├── clothes/
      │         ├── item/
      │         ├── loan/
      │         ├── wardrobe/
      │         └── util/
      ├── resources/
      │    ├── application.properties
      │    ├── application-local.properties      ← git-ignored
      │    └── db/migration/                     ← Flyway scripts
      └── test/java/
           ├── admin/
           │    ├── TestFirebaseConfig.java       ← mock FirebaseAuth for tests
           │    └── security/FirebaseTokenFilterTest.java
           └── user/UserServiceTest.java
```

## Setup

### Prerequisites

- JDK 23
- Maven 3.9+
- PostgreSQL 15+ (or Docker — `docker-compose up` in repo root)
- A Firebase project with a service account

### Firebase service account

1. Firebase Console → Project Settings → Service Accounts → **Generate new private key**
2. Save the downloaded JSON somewhere outside the repo

### Local config

Create `src/main/resources/application-local.properties` (git-ignored):

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/closet_db
spring.datasource.username=your_user
spring.datasource.password=your_password

firebase.service-account-path=/absolute/path/to/firebase-service-account.json
```

### Run

```bash
./mvnw spring-boot:run -Dspring-boot.run.profiles=local
```

Swagger UI: `http://localhost:8080/swagger-ui/index.html`

To test authenticated endpoints, click **Authorize** and paste a Firebase ID token (without the `Bearer ` prefix — Swagger adds it automatically).

### Tests

```bash
./mvnw test
```

Tests use a mock `FirebaseAuth` (profile `test`) — no service account needed. A real PostgreSQL instance is required for integration tests.

## Auth flow

```
Mobile ──login──▶ Firebase ──ID token──▶ Mobile
Mobile ──request + token──▶ FirebaseTokenFilter
         ──verifyIdToken() local──▶ ✅ valid
         ──UserService.findOrCreate()──▶ User in DB
         ──SecurityContext──▶ Controller
```

Every protected endpoint receives the authenticated `User` via `@AuthenticationPrincipal`.

## Current endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/users/me` | Returns the authenticated user |

## Planned

- [ ] `GET/POST /api/wardrobes` – wardrobe management
- [ ] `GET/POST /api/items` – item sync from mobile
- [ ] Image upload endpoint