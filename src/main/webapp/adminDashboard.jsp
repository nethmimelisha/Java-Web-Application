<%@ page import="org.example.greensuppermarket.Product" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Super Market | Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>
    <link rel="shortcut icon" href="img/fav-icon.png"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">

    <style>
        #addDataForm {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        #addDataForm label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        #addDataForm input[type="text"],
        #addDataForm input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        #addDataForm button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        #addDataForm button[type="submit"]:hover {
            background-color: #3e8e41;
        }
    </style>

</head>
<body style="font-family: 'Poppins', sans-serif;">
<%
    org.example.greensuppermarket.Main main = new org.example.greensuppermarket.Main();
%>
<nav class="navigation">
    <a href="index.jsp" class="logo">
        <img src="img/logo.png" alt="YourLogo" class="logo-img">
    </a>

</nav>

<aside class="side-menu">
    <ul>
        <li><button onclick="showAddDataForm()">Add Data</button></li>
        <br>
        <li><button onclick="showViewDataForm()">View Data</button></li>
    </ul>
</aside>

<main class="main-content">
    <div id="addDataForm" style="display: none;">
        <form action="adminProduct" method="post" enctype="multipart/form-data">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required><br>

            <label for="productPrice">Product Price:</label>
            <input type="text" id="productPrice" name="productPrice" required><br>

            <label for="productDescription">Product Description:</label>
            <input type="text" id="productDescription" name="productDescription" required><br>

            <label for="productCategory">Product Category:</label>
            <input type="text" id="productCategory" name="productCategory" required><br>

            <label for="productQuantity">Product Quantity:</label>
            <input type="text" id="productQuantity" name="productQuantity" required><br>

            <label for="productImage">Product Image:</label>
            <input type="file" id="productImage" name="productImage" required><br>

            <!-- Add more form fields as needed -->
            <br>
            <button type="submit">Submit</button>
            <br>
        </form>
    </div>
    <div class="product-container" id="viewDataForm">
        <% main.loadProductDataFromDatabase(); %>
        <% for (Product product : org.example.greensuppermarket.Main.products) { %>
        <!--box-->
        <div class="product-box">
            <img src="<%= product.getImage() %>" alt="Product Image" class="image">
            <strong><%= product.getName() %></strong>
            <span class="quantity">1 KG</span>
            <span class="quantity"><%= product.getDescription() %></span>
            <span class="price">Rs:<%= product.getPrice() %></span>
            <!--cart-btn-->
            <a href="AddToCartServlet?productId=<%= product.getId() %>" class="cart1-btn">
                <i class="fas fa-shopping-bag"></i> Add Cart
            </a>
            <!--like-btn-->
            <a href="#" class="like-btn">
                <i class="far fa-heart"></i>
            </a>
        </div>
        <% } %>
    </div>
</main>
<br>
<footer>
    <div class="footer-container">
        <div class="footer-logo">
            <a href="index.jsp" class="logo">
                <img src="img/logo.png" alt="YourLogo" class="logo-img">
            </a>
            <div class="footer-social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
        <div class="footer-links">
            <strong>Product</strong>
            <ul>
                <li><a href="#">Fruits</a></li>
                <li><a href="#">Vegetables</a></li>
                <li><a href="#">Fish/Meat</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <strong>Contact</strong>
            <ul>
                <li><a href="#">Phone : +123456789</a></li>
                <li><a href="#">Email : greensupermarket10gmail.com</a></li>
            </ul>
        </div>
    </div>
</footer>

<script>
    function showAddDataForm() {
        var addDataForm = document.getElementById("addDataForm");
        addDataForm.style.display = "block";
    }
    function showViewDataForm() {
        var viewDataForm = document.getElementById("viewDataForm");
        viewDataForm.style.display = "block";
    }
</script>

</body>
</html>