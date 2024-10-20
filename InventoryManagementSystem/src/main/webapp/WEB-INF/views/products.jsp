<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.inventory.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f4f7f6;
        }

        /* Heading styling */
        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #007bff;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 50px;
            margin-top: 30px;
            text-align: center;
        }

        /* Low stock style */
        .low-stock {
            background-color: #f8d7da !important; /* Light red background */
            cursor: pointer; /* Show pointer cursor */
        }

        /* Default product card (light gray background) */
        .product-card {
            background-color: #f9f9f9;
            border: none;
            border-radius: 10px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            margin-bottom: 30px;
        }

        /* Hover effect */
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .product-img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }

        .btn-success, .btn-danger, .btn-warning {
            margin-right: 5px;
        }

        .back-button {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Page heading -->
        <h2>Products</h2>

        <!-- Back to Home Button -->
        <a href="/" class="btn btn-secondary back-button"><i class="fas fa-arrow-left"></i> Back to Home</a>

        <!-- Add New Product Button -->
        <a href="/products/form" class="btn btn-primary mb-4"><i class="fas fa-plus"></i> Add New Product</a>

        <div class="row">
            <% 
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) { 
            %>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <!-- Use light gray for normal stock and red for low stock -->
                <div class="card product-card <%= product.getQuantity() < 5 ? "low-stock" : "" %>">
                    <div class="card-body text-center">
                        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" class="product-img">
                        <h5 class="card-title"><%= product.getName() %></h5>
                        <p class="card-text">
                            <strong>Price:</strong> Rs.<%= product.getPrice() %> <br>
                            <strong>Quantity:</strong> <%= product.getQuantity() %> <br>
                            <strong>Description:</strong> <%= product.getDescription() != null ? product.getDescription() : "N/A" %> <br>
                            <strong>Category:</strong> <%= product.getCategory().getName() %> <br>
                            <strong>Supplier:</strong> <%= product.getSupplier().getName() %>
                        </p>
                        <!-- Check if product quantity is 0, display 'Out of Stock' if true -->
                        <% if (product.getQuantity() == 0) { %>
                            <span class="badge badge-danger mb-2">Out of Stock</span>
                        <% } %>
                        <div class="mt-3">
                            <a href="/products/form?id=<%= product.getId() %>" class="btn btn-warning"><i class="fas fa-edit"></i> Edit</a>
                            <a href="/products/delete/<%= product.getId() %>" class="btn btn-danger"><i class="fas fa-trash"></i> Delete</a>
                            <form action="/orders" method="post" style="display:inline;">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-success"><i class="fas fa-shopping-cart"></i> Order</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                    }
                }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
