# Convenciones del proyecto

---

## Migraciones Flyway

**Nombrado:** `V{major}.{minor}.{patch}__{descripcion_en_snake_case}.sql`

```
V1.6.0__add_secondary_colour_to_items.sql   ✅
V1.6.0__AddSecondaryColour.sql              ❌
```

- Las versiones deben ser secuenciales; Flyway falla si hay huecos o repeticiones.
- Usar `IF NOT EXISTS` / `IF EXISTS` para que las migraciones sean seguras de re-ejecutar.
- Una migración publicada (mergeada a main) **nunca se edita**; se corrige con una nueva.

---

## Paquetes Java

```
admin/              ← config de infraestructura (Firebase, Security, Swagger)
user/               ← entidad User y su CRUD básico
wardrobeManager/
  ├── item/         ← entidad Item (base)
  ├── clothes/      ← entidad Clothes + subclases en subclases/
  ├── accesories/   ← entidad Accessories
  ├── loan/         ← entidad Loan
  ├── Wardrobe.java ← entidad Wardrobe (directamente en wardrobeManager/)
  ├── dto/          ← DTOs + Mappers
  └── util/         ← Enums (Colours, Season, Size, Length, AccessoryType)
```

Los controladores, servicios y repositorios van dentro del paquete de su entidad (ej. `clothes/ClothesController.java`).

---

## Herencia JPA

Estrategia **JOINED**: cada subclase tiene su propia tabla con una FK al padre.

- Pros: no hay columnas null en las tablas hoja, BD normalizada.
- Cons: cada consulta hace JOINs. Para listas grandes, usar DTOs proyectados.

Al **añadir un nuevo tipo de prenda** (ej. `Jumpsuit`):

1. Crear clase en `wardrobeManager/clothes/subclases/Jumpsuit.java` extendiendo `Clothes`
2. Anotar con `@Entity`, `@Table(name = "jumpsuits")`, `@PrimaryKeyJoinColumn`
3. Crear migración `V1.x.x__table_jumpsuits.sql` con `id BIGINT PK FK → clothes(id)`
4. Registrar en `@Inheritance` del padre si usa discriminador (actualmente no usa, es JOINED puro)
5. Añadir tests en `src/test/java/wardrobeManager/clothes/subclases/JumpsuitTest.java`

---

## DTOs y Mappers

- Las entidades **nunca** se exponen directamente en la API; siempre a través de DTOs.
- Los mappers son clases `@Component` manuales (no MapStruct) porque la herencia compleja lo hace más legible.
- `ItemDTO` es el DTO general para items; si un endpoint necesita campos específicos de subclase, crear un DTO propio.

---

## Enums

- Viven en `wardrobeManager/util/`.
- Se almacenan como `VARCHAR` en BD (`@Enumerated(EnumType.STRING)`).
- Al añadir un valor nuevo a un enum existente, no hace falta migración (el constraint está en la app, no en la BD). Pero si se cambia el nombre de un valor, sí hay que migrar los datos existentes.

---

## Tests

- Cada entidad/servicio tiene su propio archivo de test en el paquete espejo de `src/test/`.
- Los tests de entidad verifican: instanciación, campos, valores de enum.
- Los tests de controller (cuando existan) usan MockMvc + perfil `test` (Firebase mockeado).
- No se mockea la BD en tests de integración — se usa PostgreSQL real.

---

## Flutter / Mobile

- Los widgets reutilizables van en `lib/widgets/`.
- El feedback al usuario siempre pasa por `AppFeedback.success/error/info(context, msg)` — nunca `ScaffoldMessenger` directo.
- Los diálogos de confirmación usan `ConfirmDialog.show(context, ...)` del mismo widget, que es adaptativo (Cupertino en iOS, Material en Android).
- Los ViewModels extienden `ChangeNotifier` y se proveen con `ChangeNotifierProvider`.
- Las constantes de la app (colores, tipografía, espaciado) viven en `lib/utils/`.
