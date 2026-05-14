# Plan de Desarrollo — Fase 2

> Estado: Mayo 2026 · Modelos y tests completados ✅

---

## Próximo paso inmediato — Home real con armarios (Mobile)

El home actual muestra 4 cards hardcodeadas. Hay que convertirlo en una lista/grid real que lea de la tabla `Wardrobes` en SQLite (Drift).

**Qué construir:**
- `WardrobeViewModel` (ChangeNotifier) que expone la lista de armarios desde Drift
- `HomeScreen` rediseñado: lista/grid de armarios reales con nombre e imagen
- Acciones: crear armario nuevo, editar, marcar favorito
- El armario `isAutoFavourites` aparece siempre primero y no se puede borrar

---

## Fase 2A — Controladores REST (Backend)

Los modelos, DTOs y migraciones están listos. Lo que falta es exponer la API.

**Orden sugerido:**

1. **WardrobeController** `GET/POST/PUT/DELETE /api/wardrobes`
   - El más sencillo; no tiene herencia JPA que gestionar
   - Service valida que el usuario solo accede a sus propios armarios

2. **ItemController** `GET/POST/PUT/DELETE /api/items`
   - Crear ítem requiere decidir el tipo (Clothes vs Accessories) y la subclase
   - Consultar por armario: `GET /api/items?wardrobeId=X`

3. **LoanController** `GET/POST /api/loans` · `PUT /api/loans/{id}/return`
   - Lógica de negocio: no se puede prestar un ítem ya prestado
   - Alertas de atraso: `expectedReturnDate` < hoy y `isReturned = false`

**Para cada controlador, aplicar el patrón de `ERROR_HANDLING.md`:**
- Excepciones tipadas (`ResourceNotFoundException`, `AccessDeniedException`, etc.)
- `@RestControllerAdvice` global
- Tests: happy path + 400 + 404 + 403

---

## Fase 2B — Sincronización Mobile ↔ Backend

Una vez los endpoints existen, conectar el móvil.

- `ApiClient` ya está listo con autenticación Firebase
- Estrategia: el móvil es local-first; el backend es la copia en la nube
- Al abrir la app con conexión: pull de datos del backend → merge con Drift local
- Al crear/editar/borrar: escritura local inmediata + POST/PUT/DELETE al backend en background

---

## Backlog (Fase 3+)

- [ ] Filtros y búsqueda (por color, temporada, tipo, etc.) — QueryDSL o Specification
- [ ] Paginación en endpoints de items
- [ ] Subida de imágenes al backend
- [ ] Backup / exportación (Google Drive o iCloud)
- [ ] Internacionalización (ES/EN)
- [ ] Modo oscuro / claro adaptativo
