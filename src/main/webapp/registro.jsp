<%-- 
    Document   : registro
    Created on : 30 oct 2025, 7:12:42 p.m.
    Author     : Laboratorios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuario | LUGXStore</title>
        <style>
            /* Variables de color (Consistencia con el resto de la app) */
            :root {
                --color-principal: #3a7bd5; /* Azul primario */
                --color-secundario: #00bcd4; /* Cian para acento */
                --color-registro: #FF9800; /* Naranja/Alerta para acción secundaria */
                --color-fondo: #f4f7f6; /* Gris claro para fondo */
                --color-texto-oscuro: #333;
                --color-borde: #ccc;
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

            /* --- Contenedor Principal (Tarjeta de Registro) --- */
            .registro-container {
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
                border-bottom: 2px solid var(--color-secundario);
                padding-bottom: 10px;
            }

            /* --- Estilos del Formulario --- */
            form {
                display: flex;
                flex-direction: column;
                gap: 15px; /* Espacio entre los campos */
            }

            input[type="text"], 
            input[type="email"], 
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
                background-color: var(--color-registro);
                color: white;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 15px;
                font-size: 16px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            
            input[type="submit"]:hover {
                background-color: #f58900; /* Naranja más oscuro al pasar el ratón */
            }
            
            /* --- Enlace de Retorno a Login --- */
            .login-link {
                margin-top: 25px;
                font-size: 15px;
                color: #666;
            }
            
            .login-link a {
                color: var(--color-principal);
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s ease;
            }
            
            .login-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="registro-container">
            <h1>Registrar Usuario</h1>
            <form action="nuevousuario" method="post">
                <input type="text" name="usuario" placeholder="Nombre de usuario" required>
                <input type="email" name="correo" placeholder="Correo electrónico" required>
                <input type="password" name="pass" placeholder="Contraseña" required>
                <input type="text" name="direccion" placeholder="Dirección"><br>
                <input type="text" name="telefono" placeholder="Teléfono"><br>
                <input type="submit" value="Registrar Usuario">
            </form>
            
            <div class="login-link">
                ¿Ya tienes una cuenta? <a href="index.jsp">Iniciar Sesión</a>
            </div>
        </div>
    </body>
</html>