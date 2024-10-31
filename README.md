# Inventory Management System

## Project Overview
The **Inventory Management System** is a web-based application designed to help manage products, categories, suppliers, and orders. It provides functionalities to create, update, and delete records, as well as track product inventory and manage supplier information. The system also allows the user to view and manage customer orders efficiently.

## Special Features
- **Low Stock Alerts**: Products with quantities below a specified threshold (e.g., 5) are visually highlighted in red, with a tooltip indicating that the product is running low on stock.
- **Out of Stock Label**: If a product's quantity is zero, an "Out of Stock" badge is shown on the product page.
- **Dynamic Status Updates**: Orders have status management where users can update the order status (e.g., Pending, Completed, Canceled) via dropdown selection.
- **Mobile-Responsive Design**: The frontend is fully responsive, ensuring usability across all devices, including mobile, tablet, and desktop views.
- **Tooltip Overlays**: Hovering over low-stock products displays a tooltip indicating that stock is low.
- **Product Image Management**: Each product has an associated image URL for visual representation, along with fields for description, quantity, and price.
- **Supplier Management**: Manage supplier details, including contact information, ensuring an organized supplier relationship.

## Tech Stack

### Backend:
- **Java**: Core programming language used to implement the business logic.
- **Spring Boot**: Backend framework to build a REST API, handle requests, and manage dependencies.
- **Hibernate JPA**: ORM tool used to map Java objects to database tables.
- **MySQL**: Relational database for managing application data.
- **Maven**: Dependency management and build automation tool.

### Frontend:
- **JSP (JavaServer Pages)**: Technology used for displaying dynamic content in the web pages.
- **Bootstrap 4**: CSS framework used to create responsive and mobile-first UI components.
- **Font Awesome**: Icon toolkit for incorporating scalable icons in the frontend.
- **HTML5 & CSS3**: Standard web technologies for structuring and styling the application pages.

### Additional Tools:
- **Tomcat**: Embedded server for running the Spring Boot application.
- **Thymeleaf (optional)**: For rendering the frontend templates (can be used instead of JSP).
- **Spring Data JPA**: For seamless data access operations with the database.
- **Lombok**: Library used to reduce boilerplate code in the Java classes.

## System Requirements
- **JDK**: Java Development Kit (version 8 or later).
- **MySQL**: MySQL database installed and configured.
- **Maven**: Apache Maven installed for project dependency management.
- **IDE**: IntelliJ IDEA, Eclipse, or any IDE with Java and Spring Boot support.

## Screenshts

![Screenshot 2024-10-20 161846](https://github.com/user-attachments/assets/c26cf28f-e257-461e-8360-4fd9724300d1)
![Screenshot 2024-10-20 161855](https://github.com/user-attachments/assets/3014bf48-3fdd-4043-9dd3-037d4795280e)
![Screenshot 2024-10-20 161909](https://github.com/user-attachments/assets/d4ec683e-35b2-437c-9776-4be37214c40d)
![Screenshot 2024-10-20 161922](https://github.com/user-attachments/assets/6cc38c44-acc4-4d02-a5b2-46a5c8f95378)
![Screenshot 2024-10-20 161933](https://github.com/user-attachments/assets/3b5fdd44-d98a-4157-b4ae-c8a8df4c0157)
![Screenshot 2024-10-20 161948](https://github.com/user-attachments/assets/16c22544-3144-47ca-9f0e-3010d87978c4)
![Screenshot 2024-10-20 162004](https://github.com/user-attachments/assets/c727acf1-40c0-4484-99ee-f62d0dc376ba)
![Screenshot 2024-10-20 162017](https://github.com/user-attachments/assets/d0ce4559-027b-4c83-a611-ce8e26ed6e33)

