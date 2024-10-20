<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Supplier Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* Centered form container */
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Form heading styling */
        h2 {
            font-size: 2rem;
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Form field styling */
        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease-in-out;
        }

        /* Input focus effect */
        .form-control:focus {
            border-color: #007bff;
            box-shadow: none;
        }

        /* Submit button styling */
        .btn-primary {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        /* Button hover effect */
        .btn-primary:hover {
            background-color: #0056b3;
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
        <h2>${supplier.id == null ? 'Add New Supplier' : 'Edit Supplier'}</h2>
        <form action="/suppliers" method="post">
            <!-- Hidden field for supplier ID -->
            <input type="hidden" name="id" value="${supplier.id}">

            <!-- Supplier Name -->
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${supplier.name}" required>
            </div>

            <!-- Supplier Contact Details -->
            <div class="form-group">
                <label for="contactDetails">Contact Details:</label>
                <input type="text" class="form-control" id="contactDetails" name="contactDetails" value="${supplier.contactDetails}" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Save Supplier</button>
        </form>
    </div>

    <!-- Optional Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
