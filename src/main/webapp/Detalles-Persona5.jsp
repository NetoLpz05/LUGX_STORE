<%-- 
    Document   : Detalles-Persona5
    Created on : 18 nov 2025, 7:31:14 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Lugx Gaming - Persona 5: Royal</title>
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
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="" style="width: 158px;">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                      <li><a href="menu.jsp">Inicio</a></li>
                      <li><a href="shop.jsp">Tienda</a></li>
                      <li><a href="contact.jsp">Contactanos</a></li>
                      <li><a href="index.jsp">Inicia Sesión</a></li>
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
          <h3>Persona 5: Royal</h3>
          <span class="breadcrumb"><a href="index.html">Inicio</a>  >  <a href="shop.html">Tienda</a>  >  Persona 5: Royal</span>
        </div>
      </div>
    </div>
  </div>

  <div class="single-product section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="left-image">
            <img src="assets/images/Persona5.jpg" alt="">
          </div>
        </div>
        <div class="col-lg-6 align-self-center">
          <h4 style="font-size: medium;">ATLUS / <a href="#">P-Studio</h4>
          <h4>Persona 5: Royal</h4>
          <span class="price"><em>$40</em> $30</span>
          <p>Persona 5 Royal es una versión ampliada del juego de rol Persona 5 que incluye nuevo contenido como personajes, confidentes, una historia extendida. Combina la vida diaria de un estudiante de secundaria con mazmorras de estilo psicodélico para luchar contra las sombras</p>
          <form id="qty" action="#">
            <input type="qty" class="form-control" id="1" aria-describedby="quantity" placeholder="1">
            <button type="submit"><i class="fa fa-shopping-bag"></i> Añadir al carrito</button>
          </form>
          <ul>
            <li><span>Game ID:</span> P5R</li>
            <li><span>Género:</span> <a href="#">JRPG</a>, <a href="#">Singleplayer</a></li>
            <li><span>Multi-tags:</span> <a href="#">Misterio</a>, <a href="#">Persona</a>, <a href="#">Simulación</a>, <a href="#">Juego de Rol</a></li>
          </ul>
          <img src="assets/images/bannerPersona.png" alt="" style="width: 100%; margin-top: 20px; border-radius: 10px; height: auto;">
        </div>
        <div class="col-lg-12">
          <div class="sep"></div>
        </div>
      </div>
    </div>
  </div>

  <div class="more-info">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="tabs-content">
            <div class="row">
              <div class="nav-wrapper ">
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="description-tab" data-bs-toggle="tab" data-bs-target="#description" type="button" role="tab" aria-controls="description" aria-selected="true">Descripción</button>
                  </li>
                </ul>
              </div>              
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                  <p>Persona 5 Royal es una versión ampliada del juego de rol Persona 5 que incluye nuevo contenido como personajes, confidentes, una historia extendida con un nuevo semestre, lugares y mecánicas de juego, como un gancho para explorar mazmorras. Combina la vida diaria de un estudiante de secundaria con mazmorras de estilo psicodélico para luchar contra las sombras. Los jugadores asumen el papel de un estudiante que cambia de vida y se une a otros para formar los Ladrones Fantasma, quienes se adentran en el "Metaverso" para robar los deseos retorcidos de los adultos corruptos y provocar cambios en el mundo real</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="section categories related-games">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="section-heading">
            <h6>JRPG</h6>
            <h2>Juegos Relacionados</h2>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="main-button">
            <a href="shop.html">Ver Todo</a>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>Top #1 Seller</h4>
            <div class="thumb">
              <a href="Detalles-PokemonZA.html"><img src="assets/images/RecomendadosPokemon.avif" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>JGA 2024 Winner</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/Persona3Reload.jpg" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>Mejor RPG de Switch</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/Xenoblade3.jpg" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>RPG GOTY 2024</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/MethaphorReFantazio.png" alt=""></a>
            </div>
          </div>
        </div>
      </div>
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