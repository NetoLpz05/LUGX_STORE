<%-- 
    Document   : index
    Created on : 21 oct 2025, 6:39:26 p.m.
    Author     : Laboratorios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión | LUGXStore</title>
        <style>
            /* Variables de color */
            :root {
                --color-principal: #3a7bd5; /* Azul primario */
                --color-secundario: #00bcd4; /* Cian para acento */
                --color-exito: #4CAF50; /* Verde */
                --color-fondo: #f4f7f6; /* Gris claro para fondo */
                --color-texto-oscuro: #333;
                --color-borde: #ccc;
                /* Nuevo color para error */
                --color-error-bg: #f8d7da;
                --color-error-txt: #721c24;
                --color-error-borde: #f5c6cb;
            }

            /* Estilos generales del cuerpo */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: var(--color-fondo);
                color: var(--color-texto-oscuro);
                display: flex; /* Para centrar el contenido */
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            /* --- Contenedor Principal (Tarjeta de Login) --- */
            .login-container {
                max-width: 400px;
                width: 90%;
                padding: 40px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h1 {
                color: var(--color-principal);
                margin-bottom: 30px;
                font-size: 28px;
            }

            /* --- Estilo de la Alerta de Error (NUEVO) --- */
            .alerta-error {
                background-color: var(--color-error-bg);
                color: var(--color-error-txt);
                border: 1px solid var(--color-error-borde);
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 20px;
                font-size: 14px;
                text-align: left; /* O center, como prefieras */
            }

            /* --- Estilos del Formulario --- */
            form {
                display: flex;
                flex-direction: column;
                gap: 15px; /* Espacio entre los campos */
            }

            input[type="text"], 
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid var(--color-borde);
                border-radius: 5px;
                box-sizing: border-box; 
                transition: border-color 0.3s ease;
                font-size: 16px;
            }
            
            input:focus {
                border-color: var(--color-secundario);
                outline: none;
            }

            /* --- Botón de Enviar --- */
            input[type="submit"] {
                padding: 12px 15px;
                background-color: var(--color-principal);
                color: white;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
                font-size: 16px;
            }
            
            input[type="submit"]:hover {
                background-color: #3468b8; /* Azul más oscuro al pasar el ratón */
            }
            
            /* --- Enlace de Registro --- */
            .registro-area {
                margin-top: 25px;
                font-size: 15px;
                color: #666;
            }
            
            .registro-area a {
                color: var(--color-secundario);
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s ease;
            }
            
            .registro-area a:hover {
                color: var(--color-principal);
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Iniciar Sesión</h1>
            
            <c:if test="${not empty mensajeError}">
                <div class="alerta-error">
                    <strong>¡Error!</strong> <c:out value="${mensajeError}"/>
                </div>
            </c:if>
            <form action="iniciar" method="post">
                <input type="text" name="usuario" placeholder="Correo o Nombre de Usuario" required>
                <input type="password" name="pass" placeholder="Contraseña" required>
                <input type="submit" value="Iniciar Sesión">
            </form>
            <div class="registro-area">
                No tienes una cuenta... <a href="registro.jsp">Regístrate aquí</a>
            </div>
        </div>
    </body>
</html>