# Closet App – Documento de Requisitos Completo

> **Versión:** 2.0 · **Fecha:** Mayo 2026  
> **Propósito:** Referencia completa de requisitos, modelos de datos y funcionalidades para diseño UI/UX (Gemini Canvas u otras herramientas).

---

## 1. Visión General

**Closet App** es una aplicación móvil personal de gestión de armario. Permite al usuario catalogar sus prendas, organizarlas en uno o varios armarios virtuales, filtrarlas por atributos, compartir vistas y gestionar préstamos a otras personas.

### Principios clave

- **Local-first**: la app funciona 100% offline. Los datos se almacenan en SQLite local (Drift). El backend en la nube es opcional (sincronización).
- **Multiplataforma**: Flutter con soporte nativo iOS y Android mediante `flutter_platform_widgets`. Los componentes son adaptativos: Cupertino en iOS, Material en Android, siempre homogéneo y coherente con el estándar de cada plataforma.
- **IA integrada**: análisis automático de imágenes con Gemini API para auto-rellenar el formulario de nueva prenda.
- **Internacionalización**: soporte de español e inglés, seleccionable por el usuario.
- **Tema adaptativo**: modo claro y oscuro, con opción de seguir automáticamente la configuración del sistema.
- **Feedback siempre**: el usuario siempre recibe feedback visual (éxito o error) ante cualquier acción, mediante un widget reutilizable centralizado.
- **Componentes reutilizables**: colores, tipografía, espaciado y widgets centralizados para facilitar cambios globales futuros.

---

## 2. Stack Tecnológico

| Capa | Tecnología | Notas |
|------|-----------|-------|
| Mobile | Flutter / Dart | App principal |
| Diseño adaptativo | `flutter_platform_widgets` | Cupertino (iOS) + Material (Android) |
| Base de datos local | SQLite con **Drift** | Local-first, 100% offline |
| Autenticación | Firebase Auth | Email/password + Google Sign-In |
| Backend (sync) | Spring Boot + REST API | Solo para sincronización cloud |
| Base de datos backend | PostgreSQL | Gestionada por Spring Boot vía Flyway. El móvil NO habla con Postgres directamente |
| IA | **Gemini API** | Análisis de imagen de prendas |
| Infraestructura | Docker / Docker Compose | Stack completo local |
| Backup | Google Drive API / iCloud | A implementar en fase 5 |

### Aclaración sobre Postgres
El móvil **nunca accede directamente a PostgreSQL**. El flujo es: `Móvil ↔ API REST (Spring Boot) ↔ PostgreSQL`. Sin conexión, el móvil usa su SQLite local. Con conexión y usuario autenticado, sincroniza vía API.

---

## 3. Identidad Visual (Design System)

### Paleta de colores de la app (por definir / en revisión)
La paleta definitiva está **pendiente de decisión** basada en los logos/referencias visuales de la propietaria. Se evaluarán opciones de logo e imagen de marca antes de fijar los colores definitivos.

**Colores actuales (provisionales):**

| Token | Hex | Uso |
|-------|-----|-----|
| `primary` | `#6C63FF` | Color principal, botones, chips seleccionados |
| `primaryLight` | `#9E9AFF` | Estados hover, chips activos |
| `primaryDark` | `#4B44D1` | Pressed states |
| `accent` | `#FF7675` | Color de acento / secundario |
| `success` | `#55E6C1` | Confirmaciones, guardado exitoso |
| `error` | `#FF4757` | Errores, alertas |
| `background` | `#F8F9FA` | Fondo modo claro |
| `backgroundDark` | `#121212` | Fondo modo oscuro |
| `surface` | `#FFFFFF` | Cards, modales (claro) |
| `surfaceDark` | `#1E1E1E` | Cards, modales (oscuro) |
| `textPrimary` | `#2D3436` | Texto principal |
| `textSecondary` | `#636E72` | Labels, subtítulos |
| `greyLight` | `#DFE6E9` | Fondos de inputs vacíos |
| `greyMedium` | `#B2BEC3` | Bordes, iconos secundarios |

### Modo oscuro / claro
- El usuario puede elegir: **Claro**, **Oscuro**, o **Automático** (sigue config del sistema).
- Todos los tokens de color deben tener su variante dark.
- Preferencia guardada en storage local.

### Tipografía
- Material 3 con `ColorScheme.fromSeed`.
- Headlines: bold.
- Cards: border-radius `12px`, elevation `2`.

### Internacionalización (i18n)
- Idiomas soportados: **Español** e **Inglés**.
- Selector de idioma en ajustes de la app.
- Usar `flutter_localizations` + `intl` package.
- Todos los textos de la app deben estar externalizados (sin strings hardcoded en widgets).

---

## 4. Arquitectura de Datos

La app usa **herencia por tabla unida (JOINED inheritance)** en el backend. En local (Drift) los campos se aplanan en una tabla `items` con campos opcionales.

```
User
 └── Wardrobe (1..N)
       └── Item (1..N)
             ├── Clothes (abstracta)
             │     ├── Shirt
             │     ├── Pant
             │     ├── Dress
             │     ├── Jacket
             │     ├── Skirt
             │     ├── Jumper
             │     ├── Swimsuit
             │     └── Footwear
             └── Accessories (concreta)
Loan (referencia a Item + User propietario)
```

---

## 5. Modelos de Datos Detallados

### 5.1 Usuario (`User`)

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id` | Long | Identificador único |
| `name` | String (not null) | Nombre del usuario |
| `email` | String (unique, not null) | Email único |
| `firebaseUid` | String (unique) | UID de Firebase Auth |
| `profilePictureUrl` | String | URL de foto de perfil |
| `isActive` | Boolean | Si la cuenta está activa |
| `preferredLanguage` | String | `es` / `en` |
| `themeMode` | String | `light` / `dark` / `system` |
| `wardrobes` | Set\<Wardrobe\> | Armarios del usuario |
| `loansGiven` | Set\<Loan\> | Préstamos realizados |
| `createdAt` | Timestamp | Auditoría |
| `updatedAt` | Timestamp | Auditoría |

> **Local Drift:** Las preferencias de idioma y tema se guardan localmente (SharedPreferences o tabla settings). Los usuarios no se almacenan en Drift; la identidad local se gestiona vía Firebase Auth token en caché.

---

### 5.2 Armario (`Wardrobe`)

El armario es el contenedor principal. Un usuario puede tener **múltiples armarios**.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id` | Long / int | Identificador único |
| `name` | String (not null) | Nombre del armario |
| `description` | String | Descripción libre |
| `location` | String | Ubicación física (ej: "Habitación principal") |
| `imageUrl` | String | Foto/portada del armario |
| `isFavourite` | Boolean | Marcado como favorito |
| `isVisible` | Boolean | Visibilidad (soft delete) |
| `isAutoFavourites` | Boolean | Indica si es el armario especial de favoritos (auto-gestionado) |
| `userId` | Long (FK) | Propietario |
| `items` | Set\<Item\> | Prendas del armario |
| `createdAt` | Timestamp | Auditoría |

**Armario especial "Favoritos" (comportamiento tipo Spotify):**
- Se crea automáticamente la primera vez que el usuario marca una prenda como favorita.
- Nombre sugerido: "❤️ Mis favoritos" (localizado).
- Las prendas favoritas aparecen en este armario **además de en su armario original** (no se mueven, es una vista virtual o colección paralela).
- Si el usuario desmarca todas las favoritas, el armario de favoritos queda vacío pero no se elimina automáticamente.
- Este armario aparece siempre primero en el home (pinned).
- No se puede eliminar manualmente (solo se oculta si está vacío, según UX a definir).

> **⚠️ Pendiente de decisión:** ¿el armario de favoritos es una copia de la prenda o es una referencia/vista virtual? Recomendación: **referencia virtual** (no duplicar datos). Implementar con una tabla `favourites(userId, itemId)` o con el flag `isFavourite` en Item.

**Comportamiento al eliminar un armario:**
1. El sistema muestra un diálogo de confirmación con las opciones:
   - "Eliminar armario y todas sus prendas" (elimina items en cascada; también elimina préstamos activos de esas prendas)
   - "Eliminar solo el armario" (las prendas quedan sin armario asignado → se puede implementar un armario "Sin clasificar")
   - "Cancelar"
2. Si hay préstamos activos, se muestra advertencia adicional.

**Drift local:** Añadir tabla `Wardrobes` en Drift para soporte offline completo:
```dart
class Wardrobes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
  BoolColumn get isAutoFavourites => boolean().withDefault(const Constant(false))();
}
```

---

### 5.3 Prenda Base (`Item`)

| Campo | Tipo | Valores posibles | Descripción |
|-------|------|-----------------|-------------|
| `id` | Long | — | Identificador único |
| `name` | String (not null) | — | Nombre descriptivo |
| `description` | String | — | Descripción libre |
| `colour` | Enum `Colour` | Ver sección 6.1 (18 colores base) | Color principal |
| `secondaryColour` | Enum `Colour` (nullable) | Mismos valores + MULTICOLOUR | Color secundario (prendas bicolor/estampadas) |
| `season` | Enum `Season` | SPRING, SUMMER, AUTUMN, WINTER, ALL_SEASONS | Temporada |
| `size` | Enum `Size` | Ver sección 6.2 | Talla |
| `imageUrl` | String | — | Ruta local o URL de la imagen |
| `brand` | String | — | Marca (ej: Zara, H&M) |
| `isFavourite` | Boolean | — | Marcada como favorita |
| `isBorrowed` | Boolean | — | Está prestada actualmente |
| `isVisible` | Boolean | — | Soft delete |
| `wardrobeId` | Long (FK) | — | Armario al que pertenece |

#### Campos adicionales (herencia `Clothes`)
| Campo | Tipo | Descripción |
|-------|------|-------------|
| `fabricType` | String | Tipo de tela (ej: algodón, denim, seda, lana, poliéster, lino) |
| `pattern` | String | Patrón (solid, striped, floral, checkered, polka_dots, graphic, animal_print, geometric, abstract) |

---

### 5.4 Subtipos de Prenda

#### 5.4.1 Camiseta / Top (`Shirt`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `sleeveLength` | Enum `Length` | SHORT, MEDIUM, LONG | Largo de manga |
| `fitType` | String | slim, regular, oversized, fitted | Tipo de corte |

#### 5.4.2 Pantalón (`Pant`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `length` | Enum `Length` | SHORT, MEDIUM, LONG | Largo del pantalón |
| `fitType` | String | slim, regular, wide, straight | Tipo de corte |
| `waistSize` | String | — | Talla de cintura |

#### 5.4.3 Vestido (`Dress`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `length` | Enum `Length` | SHORT, MEDIUM, LONG | Largo del vestido |
| `style` | String | casual, formal, cocktail, maxi | Estilo |

#### 5.4.4 Chaqueta / Abrigo (`Jacket`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `type` | String | blazer, trench, bomber, parka, raincoat | Tipo de chaqueta |
| `length` | Enum `Length` | SHORT, MEDIUM, LONG | Largo |

#### 5.4.5 Falda (`Skirt`)
> ⚠️ Bug actual: la entidad Java tiene `sleeveLength` y `fitType` copiados de Shirt. Debe corregirse.

| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `length` | Enum `Length` | SHORT, MEDIUM, LONG | Largo de la falda |
| `style` | String | mini, midi, maxi, pencil, A-line, wrap | Tipo/corte |

#### 5.4.6 Jersey / Sudadera (`Jumper`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `type` | String | pullover, cardigan, hoodie, sweatshirt | Tipo |
| `sleeveLength` | Enum `Length` | SHORT, MEDIUM, LONG | Largo de manga |

#### 5.4.7 Bañador / Bikini (`Swimsuit`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `type` | String | one-piece, bikini, tankini, trunks | Tipo |

#### 5.4.8 Calzado (`Footwear`)
| Campo | Tipo | Valores | Descripción |
|-------|------|---------|-------------|
| `type` | String | sneakers, heels, boots, sandals, flats, loafers | Tipo |

#### 5.4.9 Accesorios (`Accessories`)
> Cambia de `abstract` a **concreta**. No tiene subclases definidas actualmente.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `type` | String | bag, belt, hat, scarf, jewellery, sunglasses, watch... |
| `material` | String | Cuero, tela, metal, plástico... |

---

### 5.5 Préstamo (`Loan`)

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id` | Long | Identificador único |
| `borrowerName` | String (not null) | Nombre de quien tiene la prenda |
| `dateLoaned` | LocalDate (not null) | Fecha de préstamo |
| `dateReturned` | LocalDate (nullable) | Fecha real de devolución |
| `expectedReturnDate` | LocalDate (nullable) | Fecha estimada de devolución |
| `isReturned` | Boolean | Si ya fue devuelta |
| `notes` | String (nullable) | Notas adicionales |
| `loanedItem` | Item (FK, not null) | Prenda prestada |
| `owner` | User (FK, not null) | Propietario de la prenda |
| `createdAt` | Timestamp | Auditoría |

> Añadido `expectedReturnDate` para poder alertar cuando se pasa la fecha y `notes` para contexto adicional.

---

## 6. Enumerados del Sistema

### 6.1 Colores (`Colour`) — Revisados

Se reduce de 43 a **18 colores base** + valor especial `MULTICOLOUR`. Cubre el 95%+ de la ropa real.

| Valor | Color visual | Hex referencia |
|-------|-------------|----------------|
| `BLACK` | Negro | `#212121` |
| `WHITE` | Blanco | `#FAFAFA` |
| `GREY` | Gris | `#9E9E9E` |
| `BEIGE` | Beige / crema | `#F5F5DC` |
| `BROWN` | Marrón | `#795548` |
| `RED` | Rojo | `#E53935` |
| `PINK` | Rosa | `#F48FB1` |
| `ORANGE` | Naranja | `#FF7043` |
| `YELLOW` | Amarillo | `#FFEE58` |
| `GREEN` | Verde | `#43A047` |
| `TEAL` | Verde azulado | `#00897B` |
| `BLUE` | Azul | `#1E88E5` |
| `NAVY_BLUE` | Azul marino | `#1A237E` |
| `PURPLE` | Morado | `#8E24AA` |
| `LAVENDER` | Lavanda | `#E1BEE7` |
| `GOLD` | Dorado | `#FFD700` |
| `SILVER` | Plateado | `#C0C0C0` |
| `MULTICOLOUR` | Multicolor | — (icono degradado) |

**Soporte multi-color en prenda:**
- `colour` → color principal (obligatorio si se especifica)
- `secondaryColour` → color secundario o acento (opcional)
- Si la prenda es estampada/multicolor → seleccionar `MULTICOLOUR` como color principal

---

### 6.2 Tallas (`Size`)

| Tipo | Valores |
|------|---------|
| Alfanuméricas | XS, S, M, L, XL, XXL, XXXL |
| Numéricas | 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60 |
| Especiales | ONE_SIZE, CUSTOM |

### 6.3 Temporada (`Season`)
`SPRING` · `SUMMER` · `AUTUMN` · `WINTER` · `ALL_SEASONS`

### 6.4 Largo (`Length`)
`SHORT` · `MEDIUM` · `LONG`

---

## 7. Funcionalidades — Lista Completa

### 7.1 Autenticación
- [ ] Login con email y contraseña
- [ ] Login con Google (Sign-In)
- [ ] Registro de nueva cuenta
- [ ] Recuperación de contraseña
- [ ] Logout
- [ ] Sincronización de usuario con backend al autenticarse
- [ ] Validaciones: email válido, contraseña mínimo 8 caracteres, campos obligatorios

### 7.2 Gestión de Armarios
- [ ] Crear armario (nombre obligatorio, resto opcional)
- [ ] Editar armario
- [ ] Eliminar armario con diálogo de confirmación (ver comportamiento en sección 5.2)
- [ ] Marcar/desmarcar armario como favorito
- [ ] Armario especial "Favoritos" auto-gestionado (tipo Spotify)
- [ ] Ver contador de prendas en cada armario
- [ ] Imagen de portada del armario (cámara o galería)
- [ ] Ver prendas del armario

### 7.3 Gestión de Prendas
- [ ] Añadir prenda con formulario completo
- [ ] Auto-fill con IA (Gemini) a partir de foto
- [ ] Editar prenda
- [ ] Eliminar prenda (con confirmación; verifica si hay préstamos activos)
- [ ] Marcar/desmarcar como favorita (sincroniza con armario de favoritos)
- [ ] Soft delete (isVisible = false) vs. borrado definitivo
- [ ] Ver detalle completo de prenda
- [ ] Cambiar prenda de armario
- [ ] **Multi-selección de prendas** para:
  - Mover varias prendas a un armario
  - Eliminar varias prendas a la vez
  - Marcar/desmarcar varias como favoritas

### 7.4 Filtros y Búsqueda
- [ ] Filtrar por tipo de prenda (multi-selección)
- [ ] Filtrar por color (con swatches visuales, multi-selección)
- [ ] Filtrar por temporada (chips)
- [ ] Filtrar por talla
- [ ] Filtrar por largo de manga (solo tops)
- [ ] Filtrar por marca (búsqueda de texto)
- [ ] Filtrar por armario
- [ ] Filtrar por favoritas (toggle)
- [ ] Filtrar por prestadas (toggle)
- [ ] Barra de búsqueda por nombre
- [ ] Contador de resultados en tiempo real
- [ ] Limpiar todos los filtros de una vez
- [ ] Guardar filtros frecuentes (fase futura)

### 7.5 Compartir Vista (Opción B — Enlace Web)
- [ ] Generar una URL única que representa la selección/filtros actuales
- [ ] La vista web es responsive — galería de prendas con foto, nombre, tipo y color
- [ ] Al abrir el enlace en navegador: banner de descarga de la app ("¿Te gusta lo que ves? Descárgate la app")
- [ ] Compartir URL mediante el share sheet nativo del sistema (WhatsApp, email, etc.)
- [ ] La URL expira pasado X tiempo (a definir: 7 días, 30 días...)
- [ ] No requiere autenticación para ver el enlace compartido

### 7.6 Préstamos
- [ ] Crear préstamo desde detalle de prenda o desde módulo de préstamos
- [ ] Formulario: prestatario, fecha préstamo, fecha estimada devolución, notas
- [ ] Lista de préstamos activos (isReturned = false)
- [ ] Marcar prenda como devuelta (actualiza isReturned + dateReturned + item.isBorrowed)
- [ ] Historial de préstamos (todos, con filtro activo/devuelto)
- [ ] Indicador visual en prendas prestadas (badge, overlay o borde de color)
- [ ] Alerta cuando se supera la fecha estimada de devolución
- [ ] Filtrar historial por prestatario

### 7.7 Ajustes de la App
- [ ] Cambiar idioma (Español / Inglés)
- [ ] Cambiar tema (Claro / Oscuro / Automático según sistema)
- [ ] Ver información de la cuenta (email, nombre, foto)
- [ ] Cerrar sesión
- [ ] Exportar backup (Google Drive / iCloud)
- [ ] Importar backup
- [ ] Eliminar cuenta y todos los datos

### 7.8 Backup y Export
- [ ] Exportar todos los datos (prendas + armarios + préstamos) a JSON
- [ ] Exportar a Google Drive (Android + iOS)
- [ ] Exportar a iCloud Drive (iOS)
- [ ] Importar/restaurar desde backup
- [ ] Backup automático periódico (configurable)

---

## 8. Pantallas de la App

| # | Pantalla | Descripción |
|---|----------|-------------|
| 1 | **Splash / Loading** | Pantalla de carga inicial |
| 2 | **Login** | Email/pass + Google |
| 3 | **Registro** | Nueva cuenta |
| 4 | **Home — Lista de armarios** | Grid/lista de armarios con portada, nombre y contador |
| 5 | **Crear/Editar armario** | Formulario de armario |
| 6 | **Interior de armario** | Grid de prendas + búsqueda + acceso a filtros |
| 7 | **Filtros** | Panel de filtros (sheet o pantalla completa) |
| 8 | **Resultados filtrados** | Vista de prendas filtradas con opción de compartir |
| 9 | **Añadir prenda** | Formulario completo con IA auto-fill |
| 10 | **Editar prenda** | Igual que añadir, pre-relleno |
| 11 | **Detalle de prenda** | Vista de todos los atributos + acciones |
| 12 | **Multi-selección** | Modo de selección múltiple de prendas |
| 13 | **Préstamos activos** | Lista de préstamos pendientes de devolución |
| 14 | **Historial de préstamos** | Todos los préstamos con filtros |
| 15 | **Crear préstamo** | Formulario/modal de nuevo préstamo |
| 16 | **Ajustes** | Idioma, tema, cuenta, backup |
| 17 | **Vista web compartida** | (Web, no Flutter) Galería pública de la selección |

---

## 9. Comportamientos y Reglas de Negocio

### 9.1 Feedback siempre visible
- **Toda acción del usuario** que tenga un resultado (guardar, eliminar, compartir, error de red...) debe mostrar feedback.
- Implementar un **widget reutilizable `AppFeedback`** (o similar) que centralice:
  - SnackBar de éxito (verde, con icono ✓)
  - SnackBar de error (rojo, con icono ✗ y mensaje descriptivo)
  - Dialog de confirmación para acciones destructivas
- No usar `print()` ni mensajes técnicos al usuario.

### 9.2 Armario de Favoritos (tipo Spotify)
- Se crea automáticamente al marcar la primera prenda como favorita.
- Las prendas favoritas son referencias, no copias (el dato vive en la prenda original).
- El armario de favoritos siempre aparece primero en el home (pinned).
- No se puede eliminar ni editar manualmente.

### 9.3 Eliminación de armario
1. Mostrar diálogo: "¿Qué hacer con las X prendas de este armario?"
   - Opción A: Eliminar armario y todas sus prendas (+ préstamos activos)
   - Opción B: Mover prendas a "Sin clasificar" y eliminar solo el armario
2. Si hay préstamos activos sobre alguna prenda, mostrar advertencia adicional.
3. El armario especial de favoritos **no se puede eliminar**.

### 9.4 Multi-selección
- Se activa con long press sobre una prenda.
- En modo multi-selección: checkbox visible en cada prenda, barra de acciones en la parte inferior.
- Acciones disponibles: mover a armario, marcar/desmarcar favoritas, eliminar.
- Útil especialmente para prendas sin armario asignado (`wardrobeId = null`).

### 9.5 Prendas sin armario
- Las prendas pueden existir sin armario asignado (`wardrobeId = null`).
- Se agrupan en una sección "Sin clasificar" visible desde el home.

### 9.6 Préstamos
- Al crear un préstamo: `item.isBorrowed = true` automáticamente.
- Al marcar como devuelta: `item.isBorrowed = false` + `loan.isReturned = true` + `loan.dateReturned = hoy`.
- Si se elimina una prenda con préstamo activo: mostrar advertencia.
- Alerta visual (badge, color rojo) cuando `dateLoaned` supera `expectedReturnDate` sin devolución.

### 9.7 Soft delete
- Prendas y armarios tienen `isVisible`. El borrado definitivo requiere confirmación explícita.
- Considerar implementar una "papelera" con recuperación en 30 días (fase futura).

### 9.8 Offline vs. Online
- La app funciona **100% offline** con Drift (SQLite).
- Cuando hay conexión y usuario autenticado, se sincroniza con el backend (Spring Boot → PostgreSQL).
- Nunca bloquear la UI por operaciones de red. Usar indicadores sutiles de sync.

---

## 10. Seguridad y Validaciones

### Validaciones de formularios
- **Nombre de prenda**: obligatorio, mín. 1 carácter, máx. 150.
- **Nombre de armario**: obligatorio, mín. 1 carácter, máx. 100.
- **Email**: formato válido.
- **Contraseña**: mínimo 8 caracteres.
- **Nombre de prestatario**: obligatorio, máx. 255 caracteres.
- **Fecha de préstamo**: no puede ser futura.
- **Fecha estimada de devolución**: debe ser posterior a la fecha de préstamo.
- **Imágenes**: validar tipo (jpg/png) y tamaño máximo (10MB).

### Seguridad
- Autenticación con Firebase Auth. El token se renueva automáticamente.
- Las llamadas al backend incluyen el Firebase ID token en el header Authorization.
- El backend valida el token en cada request (FirebaseTokenFilter).
- Los datos de un usuario **nunca son accesibles por otro usuario** (backend filtra siempre por `userId`).
- Las imágenes se guardan en el filesystem local del dispositivo, nunca en la BD.
- Los backups exportados no incluyen el Firebase token ni credenciales.
- En la vista web compartida (enlace): no se expone el ID de usuario ni información de la cuenta, solo las prendas seleccionadas.
- Limitar la longitud de todos los campos de texto tanto en frontend como en backend.

### Privacidad
- Los datos del usuario se almacenan primero localmente.
- Solo se envían al backend cuando el usuario está autenticado.
- El enlace web compartido no requiere login para verlo, pero la URL no debe contener datos sensibles del usuario.

---

## 11. Estándares de Desarrollo Frontend

### Principios
- **Reutilizable siempre**: colores, tipografía, espaciados y widgets deben estar centralizados. Nada hardcoded en los widgets.
- **Consistencia de plataforma**: usar `flutter_platform_widgets` para componentes que difieren entre iOS y Android (AppBar, Switch, Dialog, etc.).
- **Feedback always**: todo flujo de usuario debe tener estado de carga, éxito y error.
- **Strings externalizados**: todos los textos en archivos `.arb` para i18n.

### Estructura de carpetas (mobile)
```
lib/
├── config/         # Secrets, constants, API config
├── models/         # Modelos de datos
├── screens/        # Pantallas (una por feature)
├── widgets/        # Widgets reutilizables (AppFeedback, ItemCard, ColorSwatch...)
├── services/       # Lógica de negocio (DB, API, AI, Auth)
├── providers/      # State management
├── utils/          # AppColors, AppTheme, AppSpacing, helpers
└── l10n/           # Archivos de localización (.arb)
```

### Widgets reutilizables a definir
- `AppFeedbackSnackBar` — éxito / error / info
- `ConfirmDialog` — diálogos de confirmación destructiva
- `ItemCard` — tarjeta de prenda (grid y lista)
- `WardrobeCard` — tarjeta de armario
- `ColourSwatch` — círculo de color
- `EmptyState` — estado vacío con ilustración y CTA
- `LoadingOverlay` — indicador de carga

---

## 12. Roadmap de Desarrollo

### ✅ Fase 1 – Base (Completada)
- Estructura del proyecto, tema, paleta de colores
- Esquema de base de datos local (Drift v2), CI (GitHub Actions)
- Pantalla home básica

### ✅ Fase 2 – IA y Auth (Completada)
- Integración Gemini API (análisis de prendas)
- Firebase Auth (email + Google)
- Formulario de alta con auto-fill IA
- Sincronización de usuario con backend

### ⏳ Fase 3 – Funcionalidad Core (En progreso)
- Tabla `Wardrobes` en Drift para soporte offline completo
- Cargar prendas e items del backend
- Sistema de filtros completo
- Sistema de préstamos (crear, listar, marcar devuelta, historial)
- Pantalla de detalle de prenda
- Multi-selección de prendas
- Widget de feedback reutilizable
- Corrección de modelo `Skirt` (Bug)
- `Accessories` de abstract a concreta

### 🔮 Fase 4 – Compartir
- Generación de enlace web de selección filtrada
- Vista web pública responsive
- Banner de descarga de app en la vista web

### 🔮 Fase 5 – Ajustes y Backup
- Selector de idioma (ES / EN)
- Modo oscuro / claro / automático
- Backup a Google Drive e iCloud
- Exportar/importar datos (JSON)

### 🔮 Fase 6 – Pulido
- Papelera con recuperación en 30 días
- Guardar filtros frecuentes
- Backup automático periódico
- Sincronización bidireccional con backend
- Identidad visual definitiva (logo, paleta de colores final)

---

## 13. Consideraciones de Diseño para Gemini Canvas

1. **Plataforma dual**: componentes Cupertino en iOS (navegación push, switches nativos, SF Pro font) y Material 3 en Android (FAB, SnackBars, Roboto).

2. **Color primario**: `#6C63FF` (violeta/lavanda). PENDIENTE de revisión según logo final. Todos los tokens deben tener variante dark mode.

3. **Cards visuales con foto**: las prendas se muestran por imagen. Cards visuales, poco texto.

4. **Swatches de color**: los 18 colores deben ser visualmente prominentes en filtros y fichas. Círculos de color con nombre.

5. **Chips como patrón**: tipo, temporada, largo de manga, filtros → chips en lugar de dropdowns.

6. **Botón IA especial**: "✨ Auto-fill with AI" debe diferenciarse visualmente. Es la feature estrella.

7. **Indicador de préstamos**: badge o borde visible en prendas prestadas. Módulo de préstamos con diseño de tarjeta tipo "deuda pendiente".

8. **Armario de favoritos pinned**: siempre visible al inicio del home, con icono de corazón especial.

9. **Multi-selección**: modo visual claro con checkboxes y barra de acciones inferior tipo toolbar.

10. **Home de armarios**: tarjetas grandes con imagen de portada, contador de prendas, indicador de favorito.

11. **Vista web compartida**: diseño web responsive tipo lookbook/galería. Banner sticky de descarga de app.

12. **Estados vacíos**: cada pantalla debe tener un estado vacío ilustrado con CTA (ej: "Tu armario está vacío — Añade tu primera prenda").

13. **Feedback visual**: los snackbars de éxito (verde) y error (rojo) deben ser parte del diseño.
