# Database Schema

> Última actualización: Mayo 2026 · Flyway hasta V1.6.4

## Visión general

La base de datos usa **herencia JPA con estrategia JOINED**: cada subclase tiene su propia tabla con una FK al padre. Un jersey en BD ocupa una fila en `items`, otra en `clothes` y otra en `jumpers`.

```
users
 └── wardrobes (user_id)
      └── items (wardrobe_id)
           ├── clothes (id → items.id)
           │    ├── shirts
           │    ├── dresses
           │    ├── pants
           │    ├── skirts
           │    ├── swimsuits
           │    ├── jumpers
           │    ├── jackets
           │    └── footwear
           └── accessories (id → items.id)
loans (item_id → items.id, owner_id → users.id)
```

---

## Tablas

### `users`
| Columna | Tipo | Notas |
|---------|------|-------|
| id | BIGSERIAL PK | |
| name | VARCHAR(100) NOT NULL | |
| email | VARCHAR(150) UNIQUE NOT NULL | |
| password | VARCHAR(255) | nullable desde V1.5.0 (Firebase users no tienen password) |
| firebase_uid | VARCHAR(255) UNIQUE | añadido en V1.5.0 |
| profile_picture_url | VARCHAR(255) | |
| is_active | BOOLEAN DEFAULT TRUE | |
| created_at / updated_at | TIMESTAMP | auditoría |
| created_by / updated_by | BIGINT | auditoría |

### `wardrobes`
| Columna | Tipo | Notas |
|---------|------|-------|
| id | BIGSERIAL PK | |
| name | VARCHAR(100) NOT NULL | |
| description | TEXT | |
| image_url | VARCHAR(255) | |
| location | VARCHAR(100) | ej. "Habitación", "Verano" |
| is_favourite | BOOLEAN DEFAULT FALSE | |
| is_auto_favourites | BOOLEAN DEFAULT FALSE | V1.6.1 — armario especial tipo Spotify |
| is_visible | BOOLEAN DEFAULT TRUE | |
| user_id | BIGINT FK → users.id | |
| auditoría | TIMESTAMP / BIGINT | |

### `items`
| Columna | Tipo | Notas |
|---------|------|-------|
| id | BIGSERIAL PK | |
| name | VARCHAR(150) NOT NULL | |
| description | TEXT | |
| colour | VARCHAR(20) | enum Colours |
| secondary_colour | VARCHAR(20) | V1.6.0 — color secundario opcional |
| season | VARCHAR(10) | enum Season |
| size | VARCHAR(10) | enum Size |
| image_url | VARCHAR(255) | |
| brand | VARCHAR(100) | |
| is_favourite | BOOLEAN DEFAULT FALSE | |
| is_borrowed | BOOLEAN DEFAULT FALSE | |
| is_visible | BOOLEAN DEFAULT TRUE | |
| wardrobe_id | BIGINT FK → wardrobes.id | |
| auditoría | TIMESTAMP / BIGINT | |

### `clothes` ← extiende `items`
| Columna | Tipo |
|---------|------|
| id | BIGINT PK FK → items.id |
| fabric_type | VARCHAR(50) |
| pattern | VARCHAR(50) |

### Subtipos de ropa (todos extienden `clothes`)

| Tabla | Columnas propias |
|-------|-----------------|
| `shirts` | sleeve_length, fit_type |
| `dresses` | length, style |
| `pants` | length, fit_type, waist_size |
| `skirts` | length, style |
| `swimsuits` | type |
| `jumpers` | type, sleeve_length (V1.6.3) |
| `jackets` | type, material |
| `footwear` | type |

### `accessories` ← extiende `items`
| Columna | Tipo | Notas |
|---------|------|-------|
| id | BIGINT PK FK → items.id | |
| material | VARCHAR(50) | |
| type | VARCHAR(50) | V1.6.4 — enum AccessoryType |

### `loans`
| Columna | Tipo | Notas |
|---------|------|-------|
| id | BIGSERIAL PK | |
| borrower_name | VARCHAR(255) | |
| date_loaned | DATE | |
| date_returned | DATE | null si no devuelto aún |
| expected_return_date | DATE | V1.6.2 — fecha estimada de devolución |
| is_returned | BOOLEAN | |
| notes | TEXT | V1.6.2 — notas opcionales del préstamo |
| item_id | BIGINT FK → items.id | |
| owner_id | BIGINT FK → users.id | |
| auditoría | TIMESTAMP / BIGINT | |

---

## Enums

| Enum | Valores |
|------|---------|
| **Colours** | BLACK, WHITE, GREY, BEIGE, BROWN, RED, ORANGE, PINK, YELLOW, GREEN, TEAL, BLUE, NAVY_BLUE, PURPLE, LAVENDER, GOLD, SILVER, MULTICOLOUR, PATTERNED, ANIMAL_PRINT |
| **Season** | SPRING, SUMMER, AUTUMN, WINTER |
| **Size** | XS, S, M, L, XL, XXL |
| **Length** | SHORT, MEDIUM, LONG |
| **AccessoryType** | BAG, BELT, HAT, SCARF, JEWELLERY, SUNGLASSES, WATCH, GLOVES, SOCKS, TIGHTS, BOW_TIE, TIE, BROOCH, HAIR_ACCESSORY, BACKPACK, WALLET |

---

## Historial de migraciones

| Versión | Descripción |
|---------|-------------|
| V1.0.0 | Tabla users |
| V1.1.0 | Tabla wardrobes |
| V1.2.0 | Tabla items |
| V1.3.x | Tabla clothes + subtipos (shirts, dresses, pants, skirts, swimsuits, jumpers, jackets) |
| V1.4.0 | Tabla accessories |
| V1.5.0 | Añade firebase_uid a users, password pasa a nullable |
| V1.5.1 | Fix: columna length en jackets |
| V1.5.2 | Fix: crea footwear (V1.3.8 creaba jackets por error); añade waist_size a pants |
| V1.5.3 | Tabla loans |
| V1.6.0 | Añade secondary_colour a items |
| V1.6.1 | Añade is_auto_favourites a wardrobes |
| V1.6.2 | Añade expected_return_date y notes a loans |
| V1.6.3 | Añade sleeve_length a jumpers |
| V1.6.4 | Añade type a accessories |
