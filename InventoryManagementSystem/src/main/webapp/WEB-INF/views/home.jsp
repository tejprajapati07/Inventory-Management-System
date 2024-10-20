<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f4f7f6;
        }

        .dashboard {
            margin-top: 50px;
        }

        /* Enhanced heading style */
        h1 {
            font-size: 3rem;
            font-weight: bold;
            color: #007bff;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 50px;
        }

        .card {
            margin-bottom: 30px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            border: none;
            border-radius: 10px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 30px;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #333;
        }

        /* FontAwesome icon styling */
        .card i {
            font-size: 3rem;
            margin-bottom: 15px;
        }

        /* Specific colors for each section */
        .products-icon {
            color: #28a745; /* Green for Products */
        }

        .categories-icon {
            color: #17a2b8; /* Blue for Categories */
        }

        .suppliers-icon {
            color: #fd7e14; /* Orange for Suppliers */
        }

        .orders-icon {
            color: #dc3545; /* Red for Orders */
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 50px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .card {
                margin-bottom: 20px;
            }
        }

        @media (max-width: 576px) {
            .card-body {
                padding: 20px;
            }

            .card-title {
                font-size: 1.25rem;
            }

            .card i {
                font-size: 2.5rem;
            }

            h1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container dashboard">
        <h1 class="text-center">Inventory Management System</h1>

        <div class="row">
            <!-- Suppliers Section -->
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-truck suppliers-icon"></i>
                        <h3 class="card-title">Suppliers</h3>
                        <p class="card-text">Manage the suppliers of your products.</p>
                        <a href="/suppliers" class="btn btn-primary">View Suppliers</a>
                    </div>
                </div>
            </div>

            <!-- Categories Section -->
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-tags categories-icon"></i>
                        <h3 class="card-title">Categories</h3>
                        <p class="card-text">View and manage product categories.</p>
                        <a href="/categories" class="btn btn-primary">View Categories</a>
                    </div>
                </div>
            </div>

            <!-- Products Section -->
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-boxes products-icon"></i>
                        <h3 class="card-title">Products</h3>
                        <p class="card-text">Manage all the products in your inventory.</p>
                        <a href="/products" class="btn btn-primary">View Products</a>
                    </div>
                </div>
            </div>

            <!-- Orders Section -->
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-shopping-cart orders-icon"></i>
                        <h3 class="card-title">Orders</h3>
                        <p class="card-text">View and track customer orders.</p>
                        <a href="/orders" class="btn btn-primary">View Orders</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
