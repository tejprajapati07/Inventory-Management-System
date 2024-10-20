<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.inventory.model.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* Container styling */
        .container {
            margin-top: 50px;
            max-width: 900px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Heading styling */
        h2 {
            font-size: 2.5rem;
            color: #007bff;
            text-align: center;
            text-transform: uppercase;
            margin-bottom: 30px;
        }

        /* Table styling */
        .table {
            border-radius: 10px;
            overflow: hidden;
        }

        .table thead th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Button styling */
        .btn-primary {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 50px;
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 2rem;
            }

            .btn {
                padding: 8px 15px;
                font-size: 0.875rem;
            }

            table {
                font-size: 0.875rem;
            }
        }

        @media (max-width: 576px) {
            h2 {
                font-size: 1.75rem;
            }

            .table thead th, .table tbody td {
                font-size: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Orders</h2>
        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Order Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null) {
                        for (Order order : orders) { 
                %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getProduct().getName() %></td>
                        <td><%= order.getQuantity() %></td>
                        <td><%= order.getOrderDate() %></td>
                        <td><%= order.getStatus() %></td>
                    </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
        <a href="/products" class="btn btn-primary">Back to Products</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
