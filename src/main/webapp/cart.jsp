        <%@ page import="org.example.greensuppermarket.Cart" %>
<%@ page import="org.example.greensuppermarket.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--==Title==-->
    <title>Green Supermarket</title>

    <!--==Stylesheet==-->
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>
    <link rel="stylesheet" type="text/css" href="css/cart.css"/>
    <!--==Fav-icon==-->
    <link rel="shortcut icon" href="img/fav-icon.png"/>

    <!--==Using-Font-Awesome==-->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <!--==Import-Font-Family==-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">

</head>

<body>
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
        <a href="cart.jsp" class="cart1">
            <i class="fas fa-shopping-cart"></i>
            <span>0</span>
        </a>
    </div>
</nav>
<!--nav-end--------------------->
<main class="container1">
    <h1 class="heading">
        <ion-icon name="cart-outline"></ion-icon>
        Shopping Cart
    </h1>
    <div class="item-flex">
        <!--
         - checkout section
        -->
        <section class="checkout">
            <h2 class="section-heading">Payment Details</h2>
            <div class="payment-form">
                <div class="payment-method">
                    <button class="method selected">
                        <ion-icon name="card"></ion-icon>
                        <span>Credit Card</span>
                        <ion-icon class="checkmark fill" name="checkmark-circle"></ion-icon>
                    </button>
                    <button class="method">
                        <ion-icon name="logo-paypal"></ion-icon>
                        <span>PayPal</span>
                        <ion-icon class="checkmark" name="checkmark-circle-outline"></ion-icon>
                    </button>
                </div>
                <form action="placeOrder" method="post">
                    <div class="cardholder-name">
                        <label for="cardholder-name" class="label-default">Cardholder name</label>
                        <input type="text" name="cardholder-name" id="cardholder-name" class="input-default">
                    </div>
                    <div class="card-number">
                        <label for="card-number" class="label-default">Card number</label>
                        <input type="number" name="card-number" id="card-number" class="input-default">
                    </div>
                    <div class="input-flex">
                        <div class="expire-date">
                            <label for="expire-date" class="label-default">Expiration date</label>
                            <div class="input-flex">
                                <input type="number" name="day" id="expire-date" placeholder="31" min="1" max="31"
                                       class="input-default">
                                <input type="number" name="month" id="expire-date" placeholder="12" min="1" max="12"
                                       class="input-default">
                            </div>
                        </div>
                        <div class="cvv">
                            <label for="cvv" class="label-default">CVV</label>
                            <input type="number" name="cvv" id="cvv" class="input-default">
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary" id="paypalSpace">Place Order</button>
                    </div>
                </form>
            </div>
        </section>
        <!--
          - cart section
        -->
        <section class="cart">
            <div class="cart-item-box">
                <h2 class="section-heading">Order Summery</h2>
                <div class="cart-items">
                    <h2>Your Cart</h2>
                    <%
                        double subtotal = 0.0;
                        // Retrieve the cart from the session
                        Cart cart = (Cart) request.getSession().getAttribute("cart");

                        // Check if the cart exists and has items
                        double tax = 0;
                        double shipping = 0;
                        double total = 0;
                        if (cart != null && !cart.getItems().isEmpty()) {
                            List<Product> items = cart.getItems();
                            for (Product product : items) {
                                subtotal += product.getPrice();
                                tax = 0.10;
                                shipping = 0.00;

                                // Calculate total by adding subtotal, tax, and shipping
                                total = subtotal + tax + shipping;
                    %>
                    <!-- Display individual cart item -->
                    <div class="cart-item">
                        <span><%=product.getName()%></span>
                        <span>Price: <%=product.getPrice()%></span>
                        <form action="AddToCartServlet" method="post">
                            <input type="hidden" name="productId" value="<%=product.getId()%>">
                            <button type="submit" style="background-color: #aa0000; color: #ffffff; border: none; padding: 4px 8px; cursor: pointer; round-clip: 3;">Delete</button>
                        </form>
                        <!-- Add more details as needed -->
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <!-- Display a message if the cart is empty -->
                    <p>Your cart is empty</p>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="wrapper">
                <div class="discount-token">
                    <label for="discount-token" class="label-default">Gift card/Discount code</label>
                    <div class="wrapper-flex">
                        <input type="text" name="discount-token" id="discount-token" class="input-default">
                        <button class="btn btn-outline">Apply</button>
                    </div>
                </div>
                <div class="amount">
                    <div class="subtotal">
                        <span>Subtotal</span> <span>$ <%=String.format("%.2f", subtotal)%></span>
                    </div>
                    <div class="tax">
                        <span>Tax</span> <span>$ <%=String.format("%.2f", tax)%></span>
                    </div>
                    <div class="shipping">
                        <span>Shipping</span> <span>$ <%=String.format("%.2f", shipping)%></span>
                    </div>
                    <div class="total">
                        <span>Total</span> <span>$ <%=String.format("%.2f", total)%></span>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
<!--
  - custom js link
-->
<script src="js/script.js"></script>
<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<%--<script src="https://www.paypal.com/sdk/js?client-id=AUO-y1tpAgFBQkQ0S1NJqJ2ThVOAg90_qu2DdWdHR5mqnLeEr5SiMQThFIwMqPBnQOPFaafkUxrAkWBx&currency=USD" data-sdk-integration-source="button-factory"></script>--%>
<%--<script>--%>
<%--    paypal.Buttons({--%>
<%--        createOrder: function(data, actions) {--%>
<%--            return actions.order.create({--%>
<%--                purchase_units: [{--%>
<%--                    amount: {--%>
<%--                        value: '<%=String.format("%.2f", total)%>'--%>
<%--                    }--%>
<%--                }]--%>
<%--            });--%>
<%--        },--%>
<%--        onApprove: function(data, actions) {--%>
<%--            return actions.order.capture().then(function(details) {--%>
<%--                alert('Transaction completed by ' + details.payer.name.given_name + '!');--%>
<%--            });--%>
<%--        }--%>
<%--    }).render('#paypalSpace');--%>
<%--</script>--%>
</body>
</html>
