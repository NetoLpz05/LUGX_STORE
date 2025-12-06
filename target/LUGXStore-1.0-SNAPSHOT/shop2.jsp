<%-- 
    Document   : shop2
    Created on : 18 nov 2025, 7:20:55 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Lugx Gaming - Tienda</title>
    <link rel="icon" href="assets/images/logo.ico" type="image/x-icon">

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.jsp" class="logo">
                        <img src="assets/images/logo.png" alt="" style="width: 158px;">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                      <li><a href="inicio.jsp">Inicio</a></li>
                      <li><a href="shop2.jsp" class="active">Tienda</a></li>
                      <li><a href="contact.jsp">Contactanos</a></li>
                  
                      <c:choose>
                            <%-- CASO 1: Usuario ESTÁ logueado --%>
                            <c:when test="${not empty sessionScope.usuarioLogueado}">
                                <li class="user-dropdown">
                                    <a href="Perfil.jsp" style="color: white; background-color: #ee626b;
                                       font-weight: bold;
                                       border-radius: 50px; text-transform: uppercase;">
                                        Hola, <c:out value="${sessionScope.usuarioLogueado}"/>
                                    </a>
                                </li class="dropdown-content">
                                <li><a href="CerrarSesion" style="color: white; background-color: #ee626b;
                                       font-weight: bold;
                                       border-radius: 50px; text-transform: uppercase;">Salir</a></li>
                            </c:when>

                            <%-- CASO 2: Nadie logueado --%>
                            <c:otherwise>
                                <li><a href="index.jsp">Inicia Sesión</a></li>
                            </c:otherwise>
                        </c:choose> 
                        <li>
                            <a href="cart.jsp" class="${pageContext.request.servletPath.endsWith('cart.jsp') ? 'active' : ''}">
                                <i class="fa fa-shopping-bag"></i> Mi Carrito
                            </a>
                        </li>
                    </ul>      
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h3>Tienda</h3>
          <span class="breadcrumb"><a href="index.jsp">Inicio</a> > Tienda</span>
        </div>
      </div>
    </div>
  </div>

  <div class="section trending">
    <div class="container">
      <ul class="trending-filter">
        <li>
          <a class="is_active" href="#!" data-filter="*">Mostrar Todo</a>
        </li>
        <li>
          <a href="#!" data-filter=".indie">Indie</a>
        </li>
      </ul>

      <div class="row trending-box">
        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 indie">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Celeste.jsp"><img src="assets/images/CelesteShop.jpg" alt=""></a>
              <span class="price">$15</span>
            </div>
            <div class="down-content">
              <span class="category">Indie</span>
              <h4>Celeste</h4>
              <a href="Detalles-Celeste.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 indie">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Balatro.jsp"><img src="assets/images/balatro.jpg" alt=""></a>
              <span class="price">$20</span>
            </div>
            <div class="down-content">
              <span class="category">Indie</span>
              <h4>Balatro</h4>
              <a href="Detalles-Balatro.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>
    </div>
  </div>
  
  <div class="row">
        <div class="col-lg-12">
          <ul class="pagination">
          <li><a href="shop.jsp"> &lt; </a></li>
            <li><a href="shop.jsp">1</a></li>
            <li><a class="is_active"href="#">2</a></li>
            <li><a href="#"> &gt; </a></li>
          </ul>
        </div>
      </div>

  <footer>
    <div class="container">
      <div class="col-lg-12">
        <p>Copyright © 2048 LUGX Gaming Company. All rights reserved. &nbsp;&nbsp; <a rel="nofollow" href="https://templatemo.com" target="_blank">Design: TemplateMo</a></p>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/counter.js"></script>
  <script src="assets/js/custom.js"></script>

  </body>
</html>
