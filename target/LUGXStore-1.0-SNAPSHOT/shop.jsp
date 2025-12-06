<%-- 
    Document   : shop
    Created on : 18 nov 2025, 7:20:09 p.m.
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
    <link rel="icon" href="img/logo.ico" type="image/x-icon">

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
                      <li><a href="shop.jsp" class="active">Tienda</a></li>
                      <li><a href="contact.jsp">Contactanos</a></li>
                      <c:choose>
                            <%-- CASO 1: Usuario ESTÁ logueado --%>
                            <c:when test="${not empty sessionScope.usuarioLogueado}">
                                <li class="user-dropdown">
                                    <a href="#" style="color: white; background-color: #ee626b;
                                       font-weight: bold; background-color: #ee626b;
                                       border-radius: 50px; text-transform: uppercase;">
                                        Hola, <c:out value="${sessionScope.usuarioLogueado}"/>
                                    </a>
                                </li class="dropdown-content">
                                <li><a href="CerrarSesion">Salir</a></li>
                            </c:when>

                            <%-- CASO 2: Nadie logueado --%>
                            <c:otherwise>
                                <li><a href="index.jsp">Inicia Sesión</a></li>
                            </c:otherwise>
                        </c:choose>
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
          <span class="breadcrumb"><a href="inicio.jsp">Inicio</a> > Tienda</span>
        </div>
      </div>
    </div>
  </div>

  <div class="section trending">
    <div class="container">
      <ul class="trending-filter">
        <li>
          <a class="is_active" href="shop.jsp" data-filter="*">Mostrar Todo</a>
        </li>
        <li>
          <a href="#!" data-filter=".adv">Aventura</a>
        </li>
        <li>
          <a href="#!" data-filter=".str">JRPG/RPG</a>
        </li>
        <li>
          <a href="#!" data-filter=".rac">Carreras</a>
        </li>
        <li>
          <a href="#!" data-filter=".fgc">Peleas</a>
        </li>
      </ul>

      <div class="row trending-box">
        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-ACShadows.jsp"><img src="assets/images/Assassins Creed Shadows.jpg" alt=""></a>
              <span class="price">$80</span>
            </div>
            <div class="down-content">
              <span class="category">Aventura</span>
              <h4>Assassin's Creed <br>
                Shadows</h4>
              <a href="Detalles-ACShadows.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 str">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-PokemonZA.jsp"><img src="assets/images/Poke.avif" alt=""></a>
              <span class="price"><em>$80</em> $60</span>
            </div>
            <div class="down-content">
              <span class="category">JRPG/RPG</span>
              <h4>Leyendas <br>
                Pokémon: Z-A</h4>
              <a href="Detalles-PokemonZA.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 fgc">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-StreetFighter6.jsp"><img src="assets/images/SF6.jpg" alt=""></a>
              <span class="price"><em>$60</em>$30</span>
            </div>
            <div class="down-content">
              <span class="category">Peleas</span>
              <h4>Street Fighter 6</h4>
              <a href="Detalles-StreetFighter6.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Silso.jsp"><img src="assets/images/Silksong.avif" alt=""></a>
              <span class="price">$20</span>
            </div>
            <div class="down-content">
              <span class="category">Aventura/Indie</span>
              <h4>Hollow Knight: <br>
                Silksong</h4>
              <a href="Detalles-Silso.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 str">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Persona5.jsp"><img src="assets/images/Persona5.jpg" alt=""></a>
              <span class="price"><em>$40</em>$30</span>
            </div>
            <div class="down-content">
              <span class="category">JRPG/RPG</span>
              <h4>Persona 5: Royal</h4>
              <a href="Detalles-Persona5.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 fgc">
          <div class="item">
            <div class="thumb">
              <a href="#"><img src="assets/images/TEKKEN8.webp" alt=""></a>
              <span class="price"><em>$30</em>$20</span>
            </div>
            <div class="down-content">
              <span class="category">Peleas</span>
              <h4>TEKKEN 8</h4>
              <a href="#"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 rac">
          <div class="item">
            <div class="thumb">
              <a href="#"><img src="assets/images/MKW.webp" alt=""></a>
              <span class="price"><em>$80</em>$70</span>
            </div>
            <div class="down-content">
              <span class="category">Carreras</span>
              <h4>Mario Kart World</h4>
              <a href="#"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 fgc">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-MK1.jsp"><img src="assets/images/MK12.jpg" alt=""></a>
              <span class="price">$40</span>
            </div>
            <div class="down-content">
              <span class="category">Peleas</span>
              <h4>Mortal Kombat 1</h4>
              <a href="Detalles-MK1.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 fgc">
          <div class="item">
            <div class="thumb">
              <a href="#"><img src="assets/images/skullgirls.jpg" alt=""></a>
              <span class="price"><em>$28</em>$20</span>
            </div>
            <div class="down-content">
              <span class="category">Peleas</span>
              <h4>Skullgirls</h4>
              <a href="#"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 str">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Persona3Reload.jsp"><img src="assets/images/Persona3Banner.jpg" alt=""></a>
              <span class="price"><em>$90</em>$30</span>
            </div>
            <div class="down-content">
              <span class="category">JRPG</span>
              <h4>Persona 3 Reload</h4>
              <a href="Detalles-Persona3Reload.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 rac">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-SRCrossworlds.jsp"><img src="assets/images/SonicRacingCrossworlds.webp" alt=""></a>
              <span class="price">$70</span>
            </div>
            <div class="down-content">
              <span class="category">Carreras</span>
              <h4>Sonic Racing <br>
                Crossworlds</h4>
              <a href="Detalles-SRCrossworlds.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <!-- Por si quieren agregar más juegos lo que está al final de la clase es para el filtro, si lo quieren cambiar agarren los
         que están por la línea 86 a 104 y si quieren agregar uno solo copien y creen el identidicador ahi mismo como str para estrategia
         para las imagenes busquen en google por icono o un banner para su detalle, guiense en como lo hice yo-->

      
    </div>
  </div>
  
  <div class="row">
        <div class="col-lg-12">
          <ul class="pagination">
          <li><a href="#"> &lt; </a></li>
            <li><a class="is_active" href="#">1</a></li>
            <li><a href="shop2.jsp">2</a></li>
            <li><a href="shop2.jsp"> &gt; </a></li>
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