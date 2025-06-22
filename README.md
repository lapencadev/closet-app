# Closet Micro Server

Backend project for managing personal closets, garments, and accessories, developed with **Java**, **Spring Boot**, and **Maven**.

## Features

- user management and authentication
- Management of garments and accessories (create, delete, update, retrieve)
- Organization by closets
- Lending of garments and accessories
- Support for item images

## Technologies

- Java 23
- Maven 3.9+
- SQL database: PostgreSQL 15+
- Spring Boot 3.3.0
- JPA/Hibernate
- Lombok

## Project Structure

- `src/main/java`: Main source code
- `src/main/resources`: Configuration files (`application.properties`)
  - You need to configure your local application.properties file for database connection:
  - ```properties
    spring.datasource.url=jdbc:postgresql://localhost:5432/closet_db
    spring.datasource.username=your_username
    spring.datasource.password=your_password
    ```
- `src/test/java`: Unit tests

```
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── admin/
│   │   │   └── login/
│   │   │   └── user/
│   │   │      └── User.java
│   │   │   └── wardrobeManager/
│   │   │        ├── accesories/
│   │   │        │    ├── subclases/
│   │   │        │    │    ├── 
│   │   │        │    └── Accessories.java
│   │   │        ├── item/
│   │   │        │    └── Item.java
│   │   │        ├── loan/
│   │   │        │    └── Loan.java
│   │   │        ├── util/
│   │   │        │    └── AuditableEntity.java
│   │   │        │    └── Constants.java
│   │   │        │    └── (Enumerations)
│   │   │        ├── clothes/
│   │   │        │    └── subclases
│   │   │        │         ├── Shirt.java
│   │   │        │         ├── Pants.java
│   │   │        │         ├── Skirt.java
│   │   │        │         ├── Dress.java
│   │   │        │         ├── Jacket.java
│   │   │        │         ├── Jumper.java
│   │   │        │         ├── Footwear.java
│   │   │        │         ├── Swimsuit.java
│   │   │        │    └── Clothes.java
│   │   │        ├── wardrobe/
│   │   │        │    └── Wardrobe.java
│   │   │        └── 
│   │   └── resources/
│   │        ├── application.properties
│   │        └── db.migration/
│   │             └── (database migration scripts)
│   │        └── diagrams/
│   └── test/
│        └── java/
│             └── wardrobeManager/
│                  └── (tests)
│
├── .gitignore
├── pom.xml
└── README.md
```
## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/lapencadev/closet-micro-server.git
    ```
   
2. Configure the database in src/main/resources/application.properties
3. Build the project:
   ```bash
   mvn clean install
   ```
4. Run the application:
   ```bash
   mvn spring-boot:run
   ```