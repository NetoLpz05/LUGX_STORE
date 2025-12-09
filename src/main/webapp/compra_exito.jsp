<%-- 
    Document   : compra_exito
    Created on : 9 dic 2025, 3:44:45 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>¡Compra Exitosa! | LUGX</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <style>
        .success-card {
            background: white; border-radius: 30px; padding: 60px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1); text-align: center; margin-top: 100px;
        }
        .icon-check {
            width: 100px; height: 100px; background: #e6f7ee; color: #28a745;
            border-radius: 50%; display: inline-flex; justify-content: center; align-items: center;
            font-size: 50px; margin-bottom: 30px;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="success-card">
                    <div class="icon-check">
                        <i class="fa fa-check"></i>
                    </div>
                    <h1 class="mb-3" style="font-weight: 800; color: #333;">¡Gracias por tu compra!</h1>
                    <p class="text-muted mb-4">
                        Tu pedido ha sido procesado exitosamente. <br>
                        Hemos descontado los productos del inventario y pronto los enviaremos.
                    </p>
                    
                    <a href="JuegoServlet?accion=juegosTienda" class="btn btn-primary btn-lg rounded-pill px-5">
                        Volver a la Tienda
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
