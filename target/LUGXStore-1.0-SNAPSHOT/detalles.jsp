<%-- 
    Document   : detalles
    Created on : 6 dic 2025, 11:50:26 a.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.VideojuegoDAO"%>
<%@page import="Modelo.Videojuego"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    // --- LÓGICA DE JAVA: RECUPERAR EL JUEGO ---
    int id = 0;
    Videojuego juego = null;
    
    try {
        String idStr = request.getParameter("id");
        if(idStr != null && !idStr.isEmpty()) {
            id = Integer.parseInt(idStr);
            
            VideojuegoDAO dao = new VideojuegoDAO();
            juego = dao.obtenerPorId(id);
        }
    } catch(Exception e) {
        System.out.println("Error al cargar detalles: " + e);
    }
    
    if(juego == null) {
        response.sendRedirect("JuegoServlet?accion=juegosTienda");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>LUGX Gaming - <%= juego.getNombre() %></title> 

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
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
                                <li><a href="JuegoServlet?accion=juegosTienda">Tienda</a></li>
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
                                        </li>
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

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3><%= juego.getNombre() %></h3>
                        <span class="breadcrumb"><a href="inicio.jsp">Inicio</a>  >  <a href="JuegoServlet?accion=juegosTienda">Tienda</a>  >  Detalles</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-product section">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6">
                        <div class="left-image">
                            <% 
                                String imagenMostrada = juego.getImagen();
                
                                if (juego.getImagenDetalles()!= null && !juego.getImagenDetalles().isEmpty()) {
                                    imagenMostrada = juego.getImagenDetalles();
                                }
                            %>

                            <img src="<%= imagenMostrada %>" alt="<%= juego.getNombre() %>" 
                                 style="width: 100%; height: auto; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.2);">
                        </div>
                    </div>

                    <div class="col-lg-6 align-self-center">
                        <h4><%= juego.getNombre() %></h4>
                        <span class="price">$<%= juego.getPrecio() %></span>
                        <p><%= juego.getDescripcion() %></p>

                        <p>Stock disponible: <strong><%= juego.getStock() %></strong></p>

                        <form action="agregarproducto" method="POST">
                            <input type="hidden" name="id" value="<%= juego.getIdJuego() %>">
                            <input type="number" 
                                   name="cantidad" 
                                   class="form-control" 
                                   value="1" 
                                   min="1" 
                                   max="<%= juego.getStock() %>" 
                                   style="width: 80px; display: inline-block; margin-right: 10px;">
                            <button type="submit"><i class="fa fa-shopping-bag"></i> Añadir al carrito</button>
                        </form>

                        <ul>
                            <li><span>ID:</span> <%= juego.getIdJuego() %></li>
                            <li><span>Género:</span> <a href="#"><%= juego.getGenero() %></a></li>
                            <li><span>Plataforma:</span> <a href="#"><%= juego.getPlataforma() %></a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <footer>
            <div class="container">
                <div class="col-lg-12">
                    <p>Copyright © 2048 LUGX Gaming Company. Todos los derechos reservados.</p>
                </div>
            </div>
        </footer>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/counter.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>
</html>