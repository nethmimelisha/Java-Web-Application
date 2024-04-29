<%@ page import="org.example.greensuppermarket.User" %>
<%@ page import="org.example.greensuppermarket.Main" %>
<%@ page import="org.example.greensuppermarket.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <% Main main = new Main(); %>
    <% User loggedInUser = (User) request.getAttribute("loggedInUser"); %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Super Market</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>
    <link rel="shortcut icon" href="img/fav-icon.png"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
</head>
<body>
<nav class="navigation">
    <a href="index.jsp" class="logo">
        <img src="img/logo.png" alt="YourLogo" class="logo-img">
    </a>
    <input type="checkbox" class="menu-btn" id="menu-btn">
    <label for="menu-btn" class="menu-icon">
        <span class="nav-icon"></span>
    </label>
    <ul class="menu">
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="fruits.jsp">Fruits</a></li>
        <li><a href="vegetables.jsp">Vegetables</a></li>
        <li><a href="meat.jsp">Fish/Meat</a></li>
        <li><a href="review.jsp">Reviews</a></li>
    </ul>
    <div class="right-nav">
        <a href="login.jsp" class="user">
            <i class="far fa-user"></i>
            <span><%= loggedInUser != null ? loggedInUser.getUserName() : "Login" %></span>
        </a>
        <a href="cart.jsp" class="cart1">
            <i class="fas fa-shopping-cart"></i>
            <span>0</span>
        </a>
    </div>
</nav>

<section id="search-banner">
    <img alt="bg" class="bg-1" src="img/bg-1.png">
    <div class="search-banner-text">
        <h1>Order Your daily Groceries</h1>
        <strong>#Free Delivery</strong>
        <form action="" class="search-box">
            <i class="fas fa-search"></i>
            <label>
                <input type="text" class="search-input" placeholder="Search your daily groceries" name="search" required>
            </label>
            <input type="submit" class="search-btn" value="Search">
        </form>
    </div>
</section>

<section id="category">
    <!--heading-->
    <div class="category-heading">
        <h2>Category</h2>
        <span>All</span>
    </div>
    <!--box-container-->
    <div class="category-container">
        <!--box-->
        <a href="meat.jsp" class="category-box">
            <img alt="Fish" src="img/fish.png">
            <span>Fish & Meat</span>
        </a>
        <!--box-->
        <a href="fruits.jsp" class="category-box">
            <img alt="Fish" src="img/Vegetables.png">
            <span>Fruits</span>
        </a>
        <!--box-->
        <a href="vegetables.jsp" class="category-box">
            <img alt="Fish" src="img/broccoli.png">
            <span>Vegitables</span>
        </a>
        <!--box-->
        <a href="#" class="category-box">
            <img alt="Fish" src="img/baby.png">
            <span>Baby</span>
        </a>
        <!--box-->
        <a href="#" class="category-box">
            <img alt="Fish" src="img/office.png">
            <span>Office</span>
        </a>
        <!--box-->
        <a href="#" class="category-box">
            <img alt="Fish" src="img/beauty.png">
            <span>Beauty</span>
        </a>
        <!--box-->
        <a href="#" class="category-box">
            <img alt="Fish" src="img/Gardening.png">
            <span>Gardening</span>
        </a>
    </div>
</section>

<section id="popular-product">
    <!--heading-->
    <div class="product-heading">
        <h3>Popular Product</h3>
        <span>All</span>
    </div>
    <!--box-container-->
    <div class="product-container">
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
</section>

<section id="clients">
    <!--heading---------------->
    <div class="client-heading">
        <h3>What Our Client's Say</h3>
    </div>
    <!--box-container---------->
    <div class="client-box-container">
        <!--box------------->
        <div class="client-box">
            <!--==profile===-->
            <div class="client-profile">
                <!--img--->
                <img alt="client" src="img/client-1.jpg">
                <!--text-->
                <div class="profile-text">
                    <strong>James Mcavoy</strong>
                    <span>CEO</span>
                </div>
            </div>
            <!--==Rating======-->
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <!--==comments===-->
            <p>"Impressed with the range of products and the secure payment process on Green Supermarket. The visualization of customer feedback is a nice touch for transparency. I'd love to see more detailed product descriptions and perhaps a 'recommended for you' section based on past purchases. Keep up the good work, and I'm excited to see how the platform evolves!"</p>
        </div>
        <!--box------------->
        <div class="client-box">
            <!--==profile===-->
            <div class="client-profile">
                <!--img--->
                <img alt="client" src="img/client-2.jpg">
                <!--text-->
                <div class="profile-text">
                    <strong>Adward Mcavoy</strong>
                    <span>Software Developer</span>
                </div>
            </div>
            <!--==Rating======-->
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <p>"I am thoroughly impressed with the Green Supermarket Online System! The user-friendly interface made my shopping experience a breeze. The product variety is fantastic, and the checkout process was smooth. I received timely order notifications, and the secure payment options added an extra layer of confidence. Kudos to the team for creating a platform that truly values customer satisfaction. Will definitely be a returning customer!"</p>
        </div>
        <!--box------------->
        <div class="client-box">
            <!--==profile===-->
            <div class="client-profile">
                <!--img--->
                <img alt="client" src="img/client-3.jpg">
                <!--text-->
                <div class="profile-text">
                    <strong>Ava Alex</strong>
                    <span>Marketer</span>
                </div>
            </div>
            <!--==Rating======-->
            <div class="rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <!--==comments===-->
            <p>"Overall, a good experience with the Green Supermarket Online System. The product selection is great, and the visuals are appealing. However, I encountered a slight delay in receiving order notifications, which could be improved. Also, it would be beneficial to have more filtering options while browsing products. Nonetheless, appreciate the effort in creating a reliable platform. Looking forward to future enhancements!"</p>
        </div>
    </div>
    </div>
</section>

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
                <li><a href="fruits.jsp">Fruits</a></li>
                <li><a href="vegetables.jsp">Vegetables</a></li>
                <li><a href="meat.jsp">Fish/Meat</a></li>
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
</body>
</html>



