# Closet App – Backend

Optional REST API for the Closet App. The Flutter mobile app is fully functional without this service — the backend provides **sync, backup, and export** capabilities when the user opts in.

## Role in the hybrid architecture

```
Flutter (local SQLite)  ──→  Spring Boot API  ──→  PostgreSQL
        ↑ default                  ↑ optional sync
   always available           user-triggered
```

The backend exposes endpoints for:
- Receiving item and wardrobe data from the mobile app (sync)
- Storing uploaded item images
- Serving data for multi-device access or web access (future)

## Tech Stack

- **Java 23**
- **Spring Boot 3.4.2**
- **Maven 3.9+**
- **PostgreSQL 15+**
- **Spring Data JPA / Hibernate**
- **Lombok**
- **Flyway** – database migrations
- **SpringDoc OpenAPI** – Swagger UI

## Project Structure

```
backend/
 └── src/
      ├── main/
      │    ├── java/com.closet/
      │    │    ├── admin/
      │    │    ├── login/
      │    │    ├── user/
      │    │    └── wardrobeManager/
      │    │         ├── accessories/
      │    │         ├── clothes/
      │    │         ├── item/
      │    │         ├── loan/
      │    │         ├── wardrobe/
      │    │         └── util/
      │    └── resources/
      │         ├── application.properties
      │         ├── application-local.properties  ← git-ignored
      │         └── db/migration/                 ← Flyway scripts
      └── test/
```

## Setup

### Prerequisites

- JDK 23
- Maven 3.9+
- PostgreSQL 15+ (or Docker)

### Database

Create a local database and configure `src/main/resources/application-local.properties` (this file is git-ignored — create it if it doesn't exist):

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/closet_db
spring.datasource.username=your_user
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

### Run

```bash
mvn clean install
mvn spring-boot:run -Dspring-boot.run.profiles=local
```

## API Docs

Swagger UI is available at `http://localhost:8080/swagger-ui/index.html` once the app is running.
