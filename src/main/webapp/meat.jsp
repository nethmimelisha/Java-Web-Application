
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fish/Meat</title>
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/styles.css">

    <!--==Using-Font-Awesome==-->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <!--==Import-Font-Family==-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body class="">

<!--==Navigation==-->
<nav class="navigation">
    <!--logo-->
    <a href="index.jsp" class="logo">
        <img src="img/logo.png" alt="YourLogo" class="logo-img">
    </a>
    <!--menu-btn-->
    <input type="checkbox" class="menu-btn" id="menu-btn">
    <label for="menu-btn" class="menu-icon">
        <span class="nav-icon"></span>
    </label>
    <!--menu-->
    <ul class="menu">
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="fruits.jsp">Fruits</a></li>
        <li><a href="vegetables.jsp">Vegetables</a></li>
        <li><a href="meat.jsp">Fish/Meat</a></li>
        <li><a href="review.jsp">Reviews</a></li>
    </ul>
    <!--right-nav-(cart-like)-->
    <div class="right-nav">
        <!--User-->
        <a href="login.jsp" class="user">
            <i class="far fa-user"></i>
        </a>
        <!--cart----->
        <a class="cart1">
            <div class="shopping">
                <i class="far fa-shopping-cart"></i>
                <span class="quantity">0</span>
            </div>
        </a>
    </div>
</nav>
<!--nav-end-->

<div class="container1">
    <header>
        <h1>Fish/Meat</h1>
    </header>
    <div class="list">
    </div>
</div>
<div class="card">
    <h1>Shopping Cart</h1>
    <ul class="listCard">
    </ul>
    <div class="checkOut">
        <div class="total">0</div>
        <div class="closeShopping">Close</div>
    </div>
</div>

<br><br>  <br><br>
<!--==Footer=============================================-->
<footer>
    <div class="footer-container">
        <!--logo-container------>
        <div class="footer-logo">
            <a href="index.jsp" class="logo">
                <img src="img/logo.png" alt="YourLogo" class="logo-img">
            </a>
            <!--social----->
            <div class="footer-social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
        <!--links------------------------->
        <div class="footer-links">
            <strong>Product</strong>
            <ul>
                <li><a href="#">Fruits</a></li>
                <li><a href="#">Vegetables</a></li>
                <li><a href="#">Fish/Meat</a></li>
            </ul>
        </div>

        <!--links-------------------------->
        <div class="footer-links">
            <strong>Contact</strong>
            <ul>
                <li><a href="#">Phone : +123456789</a></li>
                <li><a href="#">Email : greensupermarket10gmail.com</a></li>
            </ul>
        </div>
    </div>
</footer>

<script src="js/meat.js"></script>
</body>
</html>
