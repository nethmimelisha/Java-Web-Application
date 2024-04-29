
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--==Title==-->
  <title>Green Super Market</title>

  <!--==Stylesheet==-->
  <link rel="stylesheet" type="text/css" href="css/styles.css"/>
  <link rel="stylesheet" type="text/css" href="css/review.css"/>
  <script src="js/review.js"></script>

  <!--==Fav-icon==-->
  <link rel="shortcut icon" href="img/fav-icon.png"/>

  <!--==Using-Font-Awesome==-->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
  <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

  <!--==Import-Font-Family==-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

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
<!--nav-end-->

<section id="clients">
  <!--heading---------------->
  <div class="client-heading">
    <h3>Reviews</h3>
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
      <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugiat ea id, itaque architecto atque mollitia aperiam voluptatem consequatur incidunt sed placeat, harum recusandae quaerat at hic labore eius laborum quas!</p>
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
      <!--==comments===-->
      <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugiat ea id, itaque architecto atque mollitia aperiam voluptatem consequatur incidunt sed placeat, harum recusandae quaerat at hic labore eius laborum quas!</p>
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
      <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugiat ea id, itaque architecto atque mollitia aperiam voluptatem consequatur incidunt sed placeat, harum recusandae quaerat at hic labore eius laborum quas!</p>
    </div>
  </div>
</section>
<!--client-section-end---------->
<section>
  <div class="wrapper">
    <h3>Share Your Opinion</h3>
    <form action="#">
      <div class="rating">
        <input type="number" name="rating" hidden>
        <i class='bx bx-star star' style="--i: 0;"></i>
        <i class='bx bx-star star' style="--i: 1;"></i>
        <i class='bx bx-star star' style="--i: 2;"></i>
        <i class='bx bx-star star' style="--i: 3;"></i>
        <i class='bx bx-star star' style="--i: 4;"></i>
      </div>
      <textarea name="opinion" cols="30" rows="5" placeholder="Your opinion..."></textarea>
      <div class="btn-group">
        <button type="submit" class="btn submit">Submit</button>
        <button class="btn cancel">Cancel</button>
      </div>
    </form>
  </div>
</section>

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
        <li><a href="fruits.jsp">Fruits</a></li>
        <li><a href="vegetables.jsp">Vegetables</a></li>
        <li><a href="meat.jsp">Fish/Meat</a></li>

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

</body>
</html>
