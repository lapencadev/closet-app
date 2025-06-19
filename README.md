# Closet Micro Server

Backend project for managing personal closets, garments, and accessories, developed with **Java**, **Spring Boot**, and **Maven**.

## Features

- User management and authentication
- Management of garments and accessories (create, delete, update, retrieve)
- Organization by closets
- Lending of garments and accessories
- Support for item images

## Technologies

- Java 17+
- Spring Boot
- Maven
- JPA/Hibernate
- Lombok
- SQL database

## Project Structure

- `src/main/java`: Main source code
- `src/main/resources`: Configuration files (`application.properties`)
- `src/test/java`: Unit tests

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/lapencadev/closet-micro-server.git
    ```
   
2. Configure the database in src/main/resources/application.properties.
3. Build the project:
   ```bash
   mvn clean install
   ```
4. Run the application:
   ```bash
   mvn spring-boot:run
   ```