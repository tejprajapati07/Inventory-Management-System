<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.inventory.model.Product, com.inventory.model.Category, com.inventory.model.Supplier" %>
<%
    // Fetch the product from the request scope
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        product = new Product(); // Initialize an empty Product if it's not available
    }

    // Fetch categories and suppliers from the request scope
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= product.getId() == null ? "Add New Product" : "Edit Product" %></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* General container styling */
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        h2 {
            font-size: 2rem;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Input and select field styling */
        .form-control {
            border-radius: 5px;
            box-shadow: none;
            border: 1px solid #ced4da;
            transition: border-color 0.3s;
        }

        /* Hover and focus effects */
        .form-control:focus {
            border-color: #007bff;
            box-shadow: none;
        }

        /* Button styling */
        .btn-primary {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #6c757d;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h2 {
                font-size: 1.75rem;
            }
        }

        @media (max-width: 576px) {
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><%= product.getId() == null ? "Add New Product" : "Edit Product" %></h2>
        <form action="/products" method="post">
            <!-- Hidden field for product ID -->
            <input type="hidden" name="id" value="${product.id != null ? product.id : ''}">

            <!-- Product Name -->
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
            </div>

            <!-- Product Quantity -->
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
            </div>

            <!-- Product Price -->
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required>
            </div>

            <!-- Product Description -->
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="3" required><%= product.getDescription() != null ? product.getDescription() : "" %></textarea>
            </div>

            <!-- Product Image URL -->
            <div class="form-group">
                <label for="imageUrl">Image URL:</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="<%= product.getImageUrl() %>">
            </div>

            <!-- Category Dropdown -->
            <div class="form-group">
                <label for="category">Category:</label>
                <select class="form-control" id="category" name="category.id" required>
                    <option value="" disabled selected>Select a category</option>
                    <% 
                        if (categories != null) {
                            for (Category category : categories) {
                    %>
                        <option value="<%= category.getId() %>" <%= product.getCategory() != null && category.getId().equals(product.getCategory().getId()) ? "selected" : "" %>>
                            <%= category.getName() %>
                        </option>
                    <% 
                            }
                        }
                    %>
                </select>
            </div>

            <!-- Supplier Dropdown -->
            <div class="form-group">
                <label for="supplier">Supplier:</label>
                <select class="form-control" id="supplier" name="supplier.id" required>
                    <option value="" disabled selected>Select a supplier</option>
                    <% 
                        if (suppliers != null) {
                            for (Supplier supplier : suppliers) {
                    %>
                        <option value="<%= supplier.getId() %>" <%= product.getSupplier() != null && supplier.getId().equals(product.getSupplier().getId()) ? "selected" : "" %>>
                            <%= supplier.getName() %>
                        </option>
                    <% 
                            }
                        }
                    %>
                </select>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Save Product</button>
        </form>
        <!-- Back to Home Button -->
        <a href="/home" class="btn btn-secondary mt-3">Back to Home</a>
    </div>
</body>
</html>
