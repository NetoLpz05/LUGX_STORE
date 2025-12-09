<%-- 
    Document   : MisDatos
    Created on : 8 dic 2025, 9:52:08 p.m.
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
    <title>Editar Mis Datos | LUGX Gaming</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">

    <style>
        body { background-color: #f7f7f7; font-family: 'Poppins', sans-serif; }

        /* Banner Superior más compacto */
        .page-heading {
            background-image: url('assets/images/page-heading-bg.jpg');
            background-size: cover;
            background-position: center;
            padding: 60px 0;
            text-align: center;
            color: white;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;
        }

        .page-heading h2 { text-transform: uppercase; font-weight: 800; margin-bottom: 5px; }
        
        /* Contenedor del Formulario */
        .form-container {
            margin-top: -40px;
            padding-bottom: 60px;
        }

        .form-card {
            background: white;
            border-radius: 30px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        /* Estilos de Inputs */
        .form-label { font-weight: 600; color: #333; margin-bottom: 8px; font-size: 14px; }
        
        .form-control {
            background-color: #f7f7f7;
            border: 1px solid #eee;
            border-radius: 25px;
            padding: 12px 20px;
            color: #555;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #0071f8;
            background-color: #fff;
        }

        /* Botones */
        .btn-update {
            background-color: #ee626b;
            color: white;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 600;
            text-transform: uppercase;
            border: none;
            transition: all 0.3s;
        }

        .btn-update:hover { background-color: #0071f8; color: white; }

        .btn-cancel {
            background-color: transparent;
            color: #888;
            font-weight: 500;
            margin-right: 15px;
            text-decoration: none;
        }
        .btn-cancel:hover { color: #333; }

    </style>
</head>
<body>

    <div class="page-heading">
        <div class="container">
            <h2 style="color: white">Editar Perfil</h2>
            <span>Actualiza tu información personal</span>
        </div>
    </div>

    <div class="container form-container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-card">
                    <form action="ActualizarPerfilServlet" method="POST">

                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label">Nombre Completo</label>
                                <input type="text" name="nombre" class="form-control" 
                                       value="${sessionScope.usuarioObj.nombre}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Correo Electrónico</label>
                                <input type="email" name="correo" class="form-control" 
                                       value="${sessionScope.usuarioObj.correo}" 
                                       readonly style="background-color: #eee; cursor: not-allowed;">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label">Teléfono</label>
                                <input type="tel" name="telefono" class="form-control" 
                                       value="${sessionScope.usuarioObj.telefono}">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Dirección</label>
                                <input type="text" name="direccion" class="form-control" 
                                       value="${sessionScope.usuarioObj.direccion}" placeholder="Calle, Número, Colonia...">
                            </div>
                        </div>

                        <div class="mt-2">
                            <label class="form-label">Nueva Contraseña <span style="font-weight:normal; color:#888; font-size:12px">(Dejar vacío para no cambiar)</span></label>
                            <input type="password" name="password" class="form-control" placeholder="********">
                        </div>

                        <hr class="my-4" style="opacity: 0.1">

                        <div class="d-flex justify-content-end align-items-center">
                            <a href="Perfil.jsp" class="btn-cancel">Cancelar</a>
                            <button type="submit" class="btn-update">
                                <i class="fa fa-save me-2"></i> Guardar Cambios
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>

</body>
</html>