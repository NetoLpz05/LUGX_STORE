<%-- 
    Document   : cart
    Created on : 6 dic 2025, 10:32:48 a.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>LUGX Gaming - Mi Carrito</title>
        <link rel="icon" href="assets/images/logo.ico" type="image/x-icon">

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

        <style>
            /* Ajuste del fondo de la cabecera para que sea azul y texto blanco */
            .page-heading {
                margin-top: 0 !important;
                padding-top: 50px;
                padding-bottom: 50px;
                text-align: center;
                background-image: url('assets/images/page-heading-bg.jpg');
                background-color: #0071f8;
                background-position: center center;
                background-size: cover;
            }

            /* 1. TÍTULO BLANCO */
            .page-heading h2 {
                font-size: 36px;
                font-weight: 800;
                color: #ffffff !important; /* BLANCO PURO IMPORTANTE */
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 10px;
                text-shadow: 0 2px 10px rgba(0,0,0,0.3); /* Sombra para leerse mejor */
            }

            /* 2. ESTILO DEL LOGO EN CABECERA */
            .cart-logo {
                width: 140px; /* Tamaño controlado */
                display: block;
                margin: 0 auto; /* Centrado */
                filter: drop-shadow(0 2px 4px rgba(0,0,0,0.2));
            }

            /* --- CONTENEDOR DE LA TABLA --- */
            .table-wrapper {
                background: white;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
                padding: 30px;
                margin-top: -50px; /* Efecto flotante sobre el azul */
                position: relative;
                z-index: 2;
            }

            /* Estilo de la tabla */
            .custom-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0 15px;
            }

            .custom-table thead th {
                border: none;
                color: #888;
                font-size: 13px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 1px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }

            .custom-table tbody tr td {
                background: #fff;
                padding: 20px;
                vertical-align: middle;
                border-top: 1px solid #f9f9f9;
                border-bottom: 1px solid #f9f9f9;
            }

            /* Bordes redondeados en las filas */
            .custom-table tbody tr td:first-child {
                border-left: 1px solid #f9f9f9;
                border-top-left-radius: 15px;
                border-bottom-left-radius: 15px;
            }
            .custom-table tbody tr td:last-child {
                border-right: 1px solid #f9f9f9;
                border-top-right-radius: 15px;
                border-bottom-right-radius: 15px;
            }

            /* IMAGEN DEL PRODUCTO */
            .img-carrito {
                width: 90px;
                height: auto;
                object-fit: contain;
                margin-right: 20px;
                filter: drop-shadow(0 5px 10px rgba(0, 0, 0, 0.3));
                background-color: transparent;
                border-radius: 0;
                box-shadow: none;
                transition: transform 0.3s ease;
            }

            /* Botón Eliminar */
            .btn-remove {
                width: 35px;
                height: 35px;
                background-color: #ffe5e7;
                color: #ee626b;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                text-decoration: none;
                font-weight: bold;
                transition: 0.3s;
            }
            .btn-remove:hover {
                background-color: #ee626b;
                color: white;
            }

            /* Sección de Total */
            .total-card {
                background: #fdfdfd;
                border: 2px solid #f0f0f0;
                border-radius: 20px;
                padding: 30px;
                text-align: center;
            }
            .total-price {
                font-size: 32px;
                font-weight: 800;
                color: #0071f8;
                display: block;
                margin: 10px 0;
            }

            /* Botones de acción */
            .btn-lugx {
                display: block;
                width: 100%;
                padding: 12px;
                border-radius: 50px;
                text-transform: uppercase;
                font-weight: 700;
                text-decoration: none;
                text-align: center;
                margin-bottom: 10px;
                transition: 0.3s;
            }
            .btn-pagar {
                background-color: #ee626b;
                color: white;
            }
            .btn-pagar:hover {
                background-color: #d4535b;
                color: white;
                transform: translateY(-2px);
            }

            .btn-seguir {
                background-color: #333;
                color: white;
                font-size: 13px;
            }
            .btn-seguir:hover {
                background-color: #555;
                color: white;
            }

            .empty-cart {
                padding: 60px;
                text-align: center;
                color: #999;
            }
            .empty-cart i {
                font-size: 50px;
                margin-bottom: 20px;
                color: #ddd;
            }
        </style>
    </head>

    <body>

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <img src="assets/images/logo.png" alt="LUGX" class="cart-logo">
                        <h2>Tu Carrito de Compras</h2>
                        <span class="breadcrumb"><a href="inicio.jsp">Inicio</a>  >  <a href="JuegoServlet?accion=juegosTienda">Tienda</a>  >  Carrito</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="container">

                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-lg-8">
                            <table class="custom-table">
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th>Precio</th>
                                        <th>Cant.</th>
                                        <th>Subtotal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="totalPagar" value="0" />

                                    <c:forEach var="art" items="${sessionScope.carrito}">
                                        <tr>
                                            <td>
                                                <div style="display: flex; align-items: center;">
                                                    <img src="${art.videojuego.imagen}" class="img-carrito" alt="">
                                                    <span style="font-weight: 700; color: #333;">${art.videojuego.nombre}</span>
                                                </div>
                                            </td>
                                            <td style="color: #666; font-weight: 600;">$${art.videojuego.precio}</td>
                                            <td>
                                                <span style="background: #f0f0f0; padding: 5px 12px; border-radius: 8px; font-weight: bold;">
                                                    ${art.cantidad}
                                                </span>
                                            </td>
                                            <td style="color: #0071f8; font-weight: 800;">$${art.importe}</td>
                                            <td>
                                                <a href="#" class="btn-remove" title="Quitar">✕</a>
                                            </td>
                                        </tr>
                                        <c:set var="totalPagar" value="${totalPagar + art.importe}" />
                                    </c:forEach>

                                    <c:if test="${empty sessionScope.carrito}">
                                        <tr>
                                            <td colspan="5" class="empty-cart">
                                                <i class="fa fa-gamepad" style="font-size: 60px; color: #ddd; margin-bottom: 20px;"></i>

                                                <h4 style="font-weight: 800; color: #333;">¡Tu inventario está vacío!</h4>

                                                <p style="color: #777; max-width: 400px; margin: 10px auto;">
                                                    Parece que aún no has agregado ningún videojuego a tu colección. 
                                                    Ve a la tienda y equípate con los mejores títulos.
                                                </p>

                                                <a href="JuegoServlet?accion=juegosTienda" class="btn-lugx btn-pagar" style="width: 200px; margin: 20px auto;">
                                                    Ir a la Tienda
                                                </a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-lg-4">
                            <div class="total-card">
                                <h4 style="font-weight: 700; color: #333;">Resumen</h4>
                                <hr style="opacity: 0.1; margin: 20px 0;">
                                <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                    <span>Subtotal</span>
                                    <span style="font-weight: bold;">$<c:out value="${totalPagar}"/></span>
                                </div>
                                <div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
                                    <span>Envío</span>
                                    <span style="color: #28a745; font-weight: bold;">Gratis</span>
                                </div>

                                <span class="total-price">$<c:out value="${totalPagar}"/></span>

                                <form action="agregarproducto" method="POST">
                                    <input type="hidden" name="accion" value="comprarJuego">
                                    <button type="submit" class="btn-lugx btn-pagar">Finalizar compra</button>
                                </form>
                                
                                <a href="JuegoServlet?accion=juegosTienda" class="btn-lugx btn-seguir">Seguir Comprando</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <footer>
            <div class="container">
                <div class="col-lg-12">
                    <p>Copyright © 2025 LUGX Gaming Company. Todos los derechos reservados. &nbsp;&nbsp; <a rel="nofollow"</a></p>
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