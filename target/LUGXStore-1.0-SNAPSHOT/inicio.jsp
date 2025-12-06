<%-- 
    Document   : menu
    Created on : 18 nov 2025, 3:09:45 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        #search {
            position: relative;
        }

        /* La caja de resultados flotante */
        #resultadosBusqueda {
            position: absolute;
            top: 50px; /* Justo debajo del input */
            left: 0;
            width: 100%;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            z-index: 9999;
            overflow: hidden;
            display: none; /* Oculto por defecto */
        }

        /* Lista limpia */
        .search-results-list {
            list-style: none;
            margin: 0;
            padding: 0;
            text-align: left;
        }

        /* Cada elemento de la lista */
        .search-results-list li {
            border-bottom: 1px solid #eee;
        }

        .search-results-list li:last-child {
            border-bottom: none;
        }

        /* Enlaces */
        .search-results-list a {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            text-decoration: none;
            transition: background 0.2s;
        }

        .search-results-list a:hover {
            background-color: #f0f8ff; /* Azul muy claro al pasar el mouse */
        }

        /* Imagen pequeña */
        .search-results-list img {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
        }

        /* Info del juego */
        .search-results-list .info {
            display: flex;
            flex-direction: column;
        }

        .search-results-list .name {
            font-weight: bold;
            color: #333;
            font-size: 14px;
        }

        .search-results-list .price {
            font-size: 12px;
            color: #ee626b; /* Rojo LUGX */
            font-weight: 700;
        }

        .no-results {
            padding: 15px;
            color: #666;
            font-style: italic;
            font-size: 14px;
        }
    </style>
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
            <p>Explora un universo de entretenimiento <strong>sin límites!</strong> Desde los RPGs más inmersivos 
                hasta la acción frenética de los shooters competitivos, tenemos el catálogo definitivo 
                para llevar tu experiencia de juego al <strong>siguiente nivel</strong>. ¿Estás listo para jugar?</p>
            <div class="search-input">
                <form id="search" action="#" onsubmit="return false;"> <input type="text" 
                                placeholder="Busca tu juego favorito (ej. Pokémon)" id="searchText" 
                                name="searchKeyword" autocomplete="off" />
                    <button role="button">Buscar</button>
                    <div id="resultadosBusqueda"></div>
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
            <a href="shop.jsp">Ver Todo</a>
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
                  <a href="shop.jsp">Compra Ahora!</a>
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
    <script>
        // Esperar a que el HTML cargue completamente
        document.addEventListener("DOMContentLoaded", function() {

            const inputBusqueda = document.getElementById("searchText");
            const divResultados = document.getElementById("resultadosBusqueda");

            // Escuchar cuando el usuario suelta una tecla
            inputBusqueda.addEventListener("keyup", function() {
                let texto = this.value.trim();

                // Si el campo está vacío, ocultamos la caja
                if (texto === "") {
                    divResultados.style.display = "none";
                    return;
                }

                fetch("buscarTiempoReal?q=" + encodeURIComponent(texto))
                    .then(response => {
                        if (response.ok) {
                            return response.text(); // Convertimos la respuesta del Servlet a texto HTML
                        }
                        throw new Error("Error en la red");
                    })
                    .then(html => {
                        // Ponemos el HTML recibido dentro del div y lo mostramos
                        divResultados.innerHTML = html;
                        divResultados.style.display = "block";
                    })
                    .catch(error => {
                        console.error("Hubo un problema con la búsqueda:", error);
                    });
            });

            // Ocultar resultados si haces clic fuera del buscador
            document.addEventListener("click", function(event) {
                const formulario = document.getElementById("search");
                // Si el clic NO fue dentro del formulario, oculta los resultados
                if (!formulario.contains(event.target)) {
                    divResultados.style.display = "none";
                }
            });
        });
    </script>
  </body>
</html>