<%-- 
    Document   : menu
    Created on : 18 nov 2025, 3:09:45 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>LUGX - Inicio</title>
    <link rel="icon" href="assets/images/logo.ico" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
  </head>
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
  <!-- Header -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- Logo -->
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="" style="width: 158px;">
                    </a>
                    <!-- Logo -->
                    <!-- Menu -->
                    <ul class="nav">
                      <li><a href="inicio.jsp" class="active">Inicio</a></li>
                      <li><a href="shop.jsp">Tienda</a></li>
                      <li><a href="contact.jsp">Contactanos</a></li>
                      <li><a href="index.jsp">Inicia Sesión</a></li>
                  </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- Menu -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- Header -->

  <div class="main-banner">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="caption header-text">
            <h6>Bienvenido a lugx</h6>
            <h2>LA MEJOR TIENDA DE VIDEOJUEGOS!</h2>
            <p>Somos una tienda jaja</p>
            <div class="search-input">
              <form id="search" action="#">
                <input type="text" placeholder="Escribe algo" id='searchText' name="searchKeyword" onkeypress="handle" />
                <button role="button">Busca Ahora</button>
              </form>
            </div>
          </div>
        </div>
        <div class="col-lg-4 offset-lg-2">
          <div class="right-image">
            <img src="assets/images/RESIDENT9.webp" alt="">
            <span class="price">27/02/26</span>
            <span class="offer">STEAM</span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="features">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-6">
          <a href="#">
            <div class="item">
              <div class="image">
                <img src="assets/images/featured-01.png" alt="" style="max-width: 44px;">
              </div>
              <h4>Ventas 100% Seguras</h4>
            </div>
          </a>
        </div>
        <div class="col-lg-3 col-md-6">
          <a href="#">
            <div class="item">
              <div class="image">
                <img src="assets/images/featured-02.png" alt="" style="max-width: 44px;">
              </div>
              <h4>Seguridad de tus datos</h4>
            </div>
          </a>
        </div>
        <div class="col-lg-3 col-md-6">
          <a href="#">
            <div class="item">
              <div class="image">
                <img src="assets/images/featured-03.png" alt="" style="max-width: 44px;">
              </div>
              <h4>Sistema de Clips en nuestro Launcher</h4>
            </div>
          </a>
        </div>
        <div class="col-lg-3 col-md-6">
          <a href="#">
            <div class="item">
              <div class="image">
                <img src="assets/images/featured-04.png" alt="" style="max-width: 44px;">
              </div>
              <h4>Reseñas Comprobadas</h4>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>

  <div class="section trending">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="section-heading">
            <h6>Tendencia</h6>
            <h2>Juegos en Tendencia</h2>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="main-button">
            <a href="shop.html">Ver Todo</a>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-PokemonZA.jsp"><img src="assets/images/Pokémon ZA.jpg" alt=""></a>
              <span class="price"><em>$80</em>$60</span>
            </div>
            <div class="down-content">
              <span class="category">JRPG/Aventura</span>
              <h4>Leyendas<br>
                Pokémon: Z-A</h4>
              <a href="Detalles-PokemonZA.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Silso.jsp"><img src="assets/images/Silksong.avif" alt=""></a>
              <span class="price">$20</span>
            </div>
            <div class="down-content">
              <span class="category">Metroidvania</span>
              <h4>Hollow Knight: <br>
                Silksong</h4>
              <a href="Detalles-Silso.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-StreetFighter6.jsp"><img src="assets/images/SF6.jpg" alt=""></a>
              <span class="price"><em>$45</em>$30</span>
            </div>
            <div class="down-content">
              <span class="category">Peleas</span>
              <h4>Street <br>
                Fighter 6 </h4>
              <a href="Detalles-StreetFighter6.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="item">
            <div class="thumb">
              <a href="Detalles-Persona5.jsp"><img src="assets/images/Persona5.jpg" alt=""></a>
              <span class="price"><em>$40</em>$30</span>
            </div>
            <div class="down-content">
              <span class="category">JRPG</span>
              <h4>Persona 5:<br>
              Royal<BR>
              </h4>
              <a href="product-details.jsp"><i class="fa fa-shopping-bag"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="section most-played">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="section-heading">
            <h6>JUEGOS TOP</h6>
            <h2>Más Jugados</h2>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="main-button">
            <a href="shop.jsp">Ver Todo</a>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="item">
            <div class="thumb">
              <a href="product-details.jsp"><img src="assets/images/top-game-01.jpg" alt=""></a>
            </div>
            <div class="down-content">
                <h4>Warframe: Veilbreaker</h4>
                <a href="#">Explorar</a>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="item">
            <div class="thumb">
              <a href="product-details.jsp"><img src="assets/images/top-game-02.jpg" alt=""></a>
            </div>
            <div class="down-content">
                <h4>PUBG: Battlegrounds</h4>
                <a href="#">Explorar</a>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="item">
            <div class="thumb">
              <a href="product-details.jsp"><img src="assets/images/top-game-03.jpg" alt=""></a>
            </div>
            <div class="down-content">
                <h4>APEX Legends</h4>
                <a href="#">Explorar</a>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="item">
            <div class="thumb">
              <a href="product-details.jsp"><img src="assets/images/top-game-04.jpg" alt=""></a>
            </div>
            <div class="down-content">
                <h4>Los Sims 4</h4>
                <a href="#">Explorar</a>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="item">
            <div class="thumb">
              <a href="product-details.jsp"><img src="assets/images/top-game-05.jpg" alt=""></a>
            </div>
            <div class="down-content">
                <h4>Lost Ark</h4>
                <a href="#">Explorar</a>
            </div>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-sm-6">
          <div class="item">
            <div class="thumb">
              <a href="product-details.jsp"><img src="assets/images/top-game-06.jpg" alt=""></a>
            </div>
            <div class="down-content">
              <!-- <span class="category">Adventure</span> -->
                <h4>Destiny 2</h4>
                <a href="#">Explorar</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="section categories">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-heading">
            <h6>Categorías</h6>
            <h2>Categorías más jugadas!</h2>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>Acción</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/categories-01.jpg" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>Pelea</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/categories-05.jpg" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>JRPG</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/categories-03.jpg" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>Carreras</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/categories-04.jpg" alt=""></a>
            </div>
          </div>
        </div>
        <div class="col-lg col-sm-6 col-xs-12">
          <div class="item">
            <h4>Familiar</h4>
            <div class="thumb">
              <a href="#"><img src="assets/images/categories-05.jpg" alt=""></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="section cta">
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <div class="shop">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading">
                  <h6>Nuestra Tienda</h6>
                  <h2>Haz tu compra de pre-ordena y consigue los mejores <em>precios</em> para tí!</h2>
                </div>
                <div class="main-button">
                  <a href="shop.html">Compra Ahora!</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 offset-lg-2 align-self-end">
          <div class="subscribe">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading">
                  <h6>Noticiero</h6>
                  <h2>Consigue hasta $100 de descuento solo <em>suscribiendote</em> a nuestro noticiero!</h2>
                </div>
                <div class="search-input">
                  <form id="subscribe" action="#">
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Tu Correo">
                    <button type="submit">Suscríbete ahora!</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="col-lg-12">
        <p>Copyright © 2025 LUGX Gaming Company. Todos los derechos reservados. &nbsp;&nbsp; <a rel="nofollow" href="#" target="_blank"></a></p>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/counter.js"></script>
  <script src="assets/js/custom.js"></script>
  </body>
</html>
