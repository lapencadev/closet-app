# Closet Micro Server

Backend project for managing personal closets, garments, and accessories, developed with **Java 23**, **Spring Boot 3.4.2**, and **Maven**.

## Features

- User management and authentication
- Management of garments and accessories (create, delete, update, retrieve)
- Organization by closets
- Lending of garments and accessories
- Support for item images
- Database version control with Flyway

## Technologies

- **Java 23**
- **Maven 3.9+**
- **PostgreSQL 15+**
- **Spring Boot 3.4.2**
- **Spring Data JPA / Hibernate**
- **Lombok**
- **Flyway** (Database migrations)
- **SpringDoc OpenAPI** (Swagger UI)

## Project Structure

- `src/main/java`: Main source code
- `src/main/resources`: Configuration files
  - `application.properties`: General configuration.
  - `application-local.properties`: Local environment overrides (ignored by Git).
  - `db/migration/`: Flyway SQL migration scripts.
- `src/test/java`: Unit and integration tests.

```
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com.closet/ (base package)
│   │   │        ├── admin/
│   │   │        ├── login/
│   │   │        ├── user/
│   │   │        └── wardrobeManager/
│   │   │             ├── accessories/
│   │   │             ├── clothes/
│   │   │             ├── item/
│   │   │             ├── loan/
│   │   │             ├── wardrobe/
│   │   │             └── util/
│   │   └── resources/
│   │        ├── application.properties
│   │        ├── application-local.properties
│   │        └── db/
│   │             └── migration/
│   │                  └── (V1.X.X__*.sql scripts)
│   └── test/
├── pom.xml
└── README.md
```

## Setup & Execution

### Prerequisites
- Docker (optional, for PostgreSQL) or a local PostgreSQL instance.
- JDK 23.
- Maven 3.9+.

### Database Setup
1. Create a database named `closet_db` in your PostgreSQL instance.
2. Configure your local database connection in `src/main/resources/application-local.properties` (this file is ignored by Git, you may need to create it):
   ```properties
   spring.datasource.url=jdbc:postgresql://localhost:5432/closet_db
   spring.datasource.username=your_user
   spring.datasource.password=your_password
   spring.jpa.hibernate.ddl-auto=update
   ```

### Run the project
1. Clone the repository:
   ```bash
   git clone https://github.com/lapencadev/closet-micro-server.git
   ```
2. Build the project:
   ```bash
   mvn clean install
   ```
3. Run with the local profile:
   ```bash
   mvn spring-boot:run -Dspring-boot.run.profiles=local
   ```

## Documentation
Once the application is running, you can access the Swagger UI at:
`http://localhost:8080/swagger-ui/index.html`
