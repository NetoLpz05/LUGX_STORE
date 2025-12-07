<%-- 
    Document   : index
    Created on : 21 oct 2025, 6:39:26 p.m.
    Author     : Laboratorios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión | LUGXStore</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        
        <style>
            /* --- 1. CONFIGURACIÓN GENERAL --- */
            :root {
                --primary-color: #ee626b;
                --primary-dark: #d4535b;
                --accent-color: #0071f8;
                --input-bg: #f3f4f6;
            }

            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                /* El fondo ya no es un color fijo, es transparente para ver las imágenes */
                background-color: #111; 
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                overflow: hidden; /* Evita scrolls innecesarios */
            }

            /* --- 2. FONDO ANIMADO (SLIDESHOW) --- */
            .background-slider {
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                z-index: -1; /* Detrás de todo */
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .background-slider li {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                opacity: 0; /* Empiezan invisibles */
                z-index: 0;
                animation: animacionFondo 24s linear infinite; /* Ciclo de 24 segundos */
            }

            /* --- DEFINICIÓN DE IMÁGENES (CAMBIA LAS URLs AQUÍ) --- */

            .background-slider li:nth-child(1) { 
                background-image: url('https://nintendoeverything.com/wp-content/uploads/pyra-mythra-smash-bros-ultimate.jpg'); 
                animation-delay: 0s; 
            }

            .background-slider li:nth-child(2) { 
                background-image: url('https://images.nintendolife.com/0ddcf590fd507/1280x720.jpg'); 
                animation-delay: 6s; 
            }

            .background-slider li:nth-child(3) { 
                background-image: url('https://nintendoeverything.com/wp-content/uploads/Splatoon-3-art-book-1.jpg'); 
                animation-delay: 12s; 
            }

            .background-slider li:nth-child(4) { 
                background-image: url('https://image.api.playstation.com/vulcan/ap/rnd/202505/2004/c0f03d2dac6dfe541210920708ed0dc9296e7c4ec435952b.png'); 
                animation-delay: 18s; 
            }
            
            .background-slider li:nth-child(5) { 
                background-image: url('https://64.media.tumblr.com/6da53fef28ef8d895198c18363bb97e5/953be9d03229b09b-0c/s1280x1920/22d62792c7da050f762ac430956004c4b4e0a7e3.jpg'); 
                animation-delay: 24s; 
            }
            
            .background-slider li:nth-child(6) { 
                background-image: url('https://www.estadogamerla.com/wp-content/uploads/2019/09/Celeste-DEl-fanart.jpg'); 
                animation-delay: 32s; 
            }
            
            .background-slider li:nth-child(7) { 
                background-image: url('https://assetsio.gnwcdn.com/Leyendas-Pokemon-ZA_HKgfL7m.jpg?width=690&quality=85&format=jpg&dpr=3&auto=webp'); 
                animation-delay: 38s; 
            }
            

            /* --- LÓGICA DE ANIMACIÓN (Cross-fade) --- */
            @keyframes animacionFondo {
                0% { opacity: 0; animation-timing-function: ease-in; }
                8% { opacity: 1; animation-timing-function: ease-out; }   /* Aparece rápido */
                25% { opacity: 1; }  /* Se mantiene visible */
                33% { opacity: 0; }  /* Desaparece */
                100% { opacity: 0; }
            }

            /* Capa oscura para que el Login resalte sobre las fotos */
            .overlay {
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0; left: 0;
                background: rgba(0, 40, 100, 0.4); /* Filtro azul oscuro semitransparente */
                z-index: -1;
                backdrop-filter: blur(3px); /* Un ligero desenfoque elegante */
            }

            /* --- 3. TARJETA DE LOGIN --- */
            .login-container {
                background: rgba(255, 255, 255, 0.95);
                width: 100%;
                max-width: 380px;
                padding: 45px 40px;
                border-radius: 50px; 
                overflow: hidden; 
                
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
                text-align: center;
                position: relative;
                animation: slideUp 0.8s ease-out;
            }

            @keyframes slideUp {
                from { opacity: 0; transform: translateY(30px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .login-container::before {
                content: "";
                position: absolute;
                top: 0; left: 0;
                width: 100%;
                height: 5px;
                background: var(--primary-color);
            }

            .login-logo {
                width: 140px;
                height: auto;
                margin-bottom: 15px;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            h1 {
                color: #222;
                margin-bottom: 5px;
                font-size: 24px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 0;
            }
            
            p.subtitle {
                color: #666;
                font-size: 13px;
                margin-bottom: 25px;
                margin-top: 0;
            }

            /* --- INPUTS --- */
            form { display: flex; flex-direction: column; gap: 20px; }

            input[type="text"], 
            input[type="password"] {
                width: 100%;
                padding: 15px 20px;
                border: 2px solid transparent;
                background-color: var(--input-bg);
                border-radius: 10px;
                box-sizing: border-box; 
                font-size: 14px;
                font-family: 'Poppins', sans-serif;
                transition: 0.3s;
                outline: none;
            }
            
            input:focus {
                background-color: #fff;
                border-color: var(--primary-color);
                box-shadow: 0 4px 10px rgba(238, 98, 107, 0.1);
            }

            /* --- BOTÓN --- */
            input[type="submit"] {
                padding: 15px;
                background-color: var(--primary-color);
                color: white;
                border: none;
                border-radius: 50px;
                font-weight: 600;
                cursor: pointer;
                transition: 0.3s;
                margin-top: 5px;
                font-size: 15px;
                text-transform: uppercase;
                letter-spacing: 1px;
                box-shadow: 0 5px 15px rgba(238, 98, 107, 0.4);
            }
            
            input[type="submit"]:hover {
                background-color: var(--primary-dark);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(238, 98, 107, 0.6);
            }

            .registro-area { margin-top: 25px; font-size: 13px; color: #555; }
            .registro-area a { color: var(--accent-color); text-decoration: none; font-weight: 600; }
            .registro-area a:hover { text-decoration: underline; }

            .alerta-error {
                background-color: #fff2f3; color: #d63031;
                border-left: 4px solid #d63031; padding: 12px 15px;
                border-radius: 4px; margin-bottom: 20px; font-size: 13px;
                text-align: left; display: flex; align-items: center;
            }
            .alerta-error strong { margin-right: 5px; }
        </style>
    </head>
    <body>
        
        <ul class="background-slider">
            <li></li> <li></li> <li></li> <li></li> <li></li> <li></li> <li></li></ul>
        
        <div class="overlay"></div>
        
        <div class="login-container">
            <img src="assets/images/logoLOGIN-REGISTRO.png" alt="LUGX Gaming" class="login-logo">
            <h1>¡Bienvenido a LUGX, por favor inicia sesión!</h1>
            <p class="subtitle">Ingresa tus credenciales para continuar</p>
            
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
                ¿No tienes una cuenta? <a href="registro.jsp">Regístrate aquí!</a>
            </div>
        </div>
    </body>
</html>