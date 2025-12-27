# Smart Clinic Management System Architecture

## Section 1: Architecture Summary
The Smart Clinic Management System operates on a three-tier architecture leveraging Spring Boot to integrate both server-side rendering and API-based communication. The application utilizes Spring MVC with Thymeleaf templates to render the Admin and Doctor dashboards, while RESTful APIs handle data for appointments, patient records, and other modules to support external clients. The backend connects to a dual-database layer: MySQL is used via Spring Data JPA for structured relational data (Patients, Doctors, Appointments, Admin), and MongoDB is used via Spring Data MongoDB for flexible, document-based storage of Prescriptions. A unified Service Layer manages the business logic, coordinating data flow between the controllers and the repositories.

## Section 2: Data and Control Flow
1. **User Interface Layer:** Users interact with the system either through Thymeleaf-rendered HTML dashboards (Admin/Doctor) or via REST API clients (Patient modules/Mobile apps).
2. **Controller Layer:** Requests are routed to the appropriate backend component—Thymeleaf Controllers for view rendering or REST Controllers for JSON data processing.
3. **Service Layer:** The controllers delegate complex business logic and validation rules to the Service Layer, ensuring separation of concerns.
4. **Repository Layer:** The Service Layer communicates with specific repositories (JPA for MySQL or MongoRepository for MongoDB) to abstract data access.
5. **Database Access:** Repositories execute queries against the underlying databases—MySQL for structured entities and MongoDB for document-based prescription records.
6. **Model Binding:** Retrieved data is mapped to Java objects (JPA Entities for MySQL data and @Document objects for MongoDB data) for internal processing.
7. **Response:** The processed models are returned to the user, either rendered as dynamic HTML views (MVC flow) or serialized into JSON responses (REST flow).
