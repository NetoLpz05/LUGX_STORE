<%-- 
    Document   : Perfil
    Created on : 6 dic 2025, 11:24:07 a.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty sessionScope.usuarioLogueado}">
    <c:redirect url="index.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>LUGX Gaming - Mi Perfil</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">

    <style>
        /* --- ESTILOS DEL DASHBOARD --- */
        body { background-color: #f7f7f7; font-family: 'Poppins', sans-serif; }

        /* Cabecera de Bienvenida */
        .profile-header {
            background-image: url('assets/images/page-heading-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 0 120px 0;
            text-align: center;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            margin-bottom: 0;
        }

        .user-avatar {
            width: 100px; height: 100px;
            background: white; border-radius: 50%;
            display: flex; justify-content: center; align-items: center;
            margin: 0 auto 20px auto;
            font-size: 40px; color: #0071f8;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .profile-header h2 { font-weight: 800; text-transform: uppercase; margin: 0; }
        .profile-header p { opacity: 0.8; font-size: 14px; margin-top: 5px; }

        /* Contenedor de Tarjetas */
        .dashboard-container {
            margin-top: -60px;
            padding-bottom: 50px;
        }

        /* --- TARJETAS DE MENÚ --- */
        .menu-card {
            background: white;
            border-radius: 30px;
            padding: 40px 20px;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            border: 2px solid transparent;
            height: 100%;
        }

        .menu-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            border-color: #ee626b;
        }

        .card-icon {
            font-size: 50px;
            margin-bottom: 20px;
            color: #0071f8;
            transition: 0.3s;
        }

        .menu-card:hover .card-icon {
            color: #ee626b;
            transform: scale(1.1);
        }

        .card-title {
            color: #333; font-weight: 700; font-size: 18px; text-transform: uppercase; margin-bottom: 10px;
        }
        
        .card-desc {
            color: #888; font-size: 13px; line-height: 1.5;
        }
        
        /* Botón de Cerrar Sesión*/
        .card-logout {
            background-color: #fff0f1;
        }
        .card-logout .card-icon { color: #ee626b; }
        .card-logout:hover { background-color: #ee626b; }
        .card-logout:hover .card-title, 
        .card-logout:hover .card-desc, 
        .card-logout:hover .card-icon { color: white; }

    </style>
</head>
<body>


    <div class="profile-header">
        <div class="container">
            <div class="user-avatar">
                <i class="fa fa-user"></i>
            </div>
            <h2 style="color: white">Hola, <c:out value="${sessionScope.usuarioLogueado}"/></h2>
            <p style="color: white">Bienvenido a tu panel de control de LUGX</p>
        </div>
    </div>

    <div class="container dashboard-container">
        <div class="row">
            
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="cart.jsp" class="menu-card">
                    <div class="card-icon"><i class="fa fa-shopping-bag"></i></div>
                    <div class="card-title">Mi Carrito</div>
                    <div class="card-desc">Revisa los juegos que has agregado y procede al pago.</div>
                </a>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <a href="JuegoServlet?accion=juegosTienda" class="menu-card">
                    <div class="card-icon"><i class="fa fa-gamepad"></i></div>
                    <div class="card-title">Seguir Comprando</div>
                    <div class="card-desc">Explora el catálogo y encuentra tu próxima aventura.</div>
                </a>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <a href="MisDatos.jsp" class="menu-card">
                    <div class="card-icon"><i class="fa fa-id-card"></i></div>
                    <div class="card-title">Mis Datos</div>
                    <div class="card-desc">Actualiza tu dirección, teléfono o contraseña.</div>
                </a>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <a href="contact.jsp" class="menu-card">
                    <div class="card-icon"><i class="fa fa-headset"></i></div>
                    <div class="card-title">Ayuda</div>
                    <div class="card-desc">¿Tienes problemas? Contacta con soporte técnico.</div>
                </a>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <a href="CerrarSesion" class="menu-card card-logout">
                    <div class="card-icon"><i class="fa fa-sign-out-alt"></i></div>
                    <div class="card-title">Cerrar Sesión</div>
                    <div class="card-desc">Salir de tu cuenta de forma segura.</div>
                </a>
            </div>

        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
    
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');

        if (status === 'updated') {
            alert("¡Tus datos se han actualizado correctamente!");

            window.history.replaceState(null, null, window.location.pathname);
        }
    </script>

</body>
</html>
