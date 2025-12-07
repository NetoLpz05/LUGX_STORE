<%-- 
    Document   : registro
    Created on : 30 oct 2025, 7:12:42 p.m.
    Author     : Laboratorios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrar Usuario | LUGXStore</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        
        <style>
            :root {
                --primary-color: #ee626b;
                --primary-dark: #d4535b;
                --accent-color: #0071f8;
                --input-bg: #f3f4f6;
            }

            body {
                font-family: 'Poppins', sans-serif;
                margin: 0; padding: 0; background-color: #111; 
                display: flex; justify-content: center; align-items: center;
                min-height: 100vh; overflow: hidden;
            }

            .background-slider {
                position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: -1;
                list-style: none; margin: 0; padding: 0;
            }

            .background-slider li {
                width: 100%; height: 100%; position: absolute; top: 0; left: 0;
                background-size: cover; background-position: center; background-repeat: no-repeat;
                opacity: 0; z-index: 0; animation: animacionFondo 24s linear infinite;
            }

            .background-slider li:nth-child(1) { background-image: url('https://nintendoeverything.com/wp-content/uploads/pyra-mythra-smash-bros-ultimate.jpg'); animation-delay: 0s; }
            .background-slider li:nth-child(2) { background-image: url('https://images.nintendolife.com/0ddcf590fd507/1280x720.jpg'); animation-delay: 6s; }
            .background-slider li:nth-child(3) { background-image: url('https://nintendoeverything.com/wp-content/uploads/Splatoon-3-art-book-1.jpg'); animation-delay: 12s; }
            .background-slider li:nth-child(4) { background-image: url('https://image.api.playstation.com/vulcan/ap/rnd/202505/2004/c0f03d2dac6dfe541210920708ed0dc9296e7c4ec435952b.png'); animation-delay: 18s; }
            .background-slider li:nth-child(5) { background-image: url('https://64.media.tumblr.com/6da53fef28ef8d895198c18363bb97e5/953be9d03229b09b-0c/s1280x1920/22d62792c7da050f762ac430956004c4b4e0a7e3.jpg'); animation-delay: 24s; }
            .background-slider li:nth-child(6) { background-image: url('https://www.estadogamerla.com/wp-content/uploads/2019/09/Celeste-DEl-fanart.jpg'); animation-delay: 32s; }

            @keyframes animacionFondo {
                0% { opacity: 0; animation-timing-function: ease-in; }
                8% { opacity: 1; animation-timing-function: ease-out; }
                25% { opacity: 1; }
                33% { opacity: 0; }
                100% { opacity: 0; }
            }

            .overlay {
                position: fixed; width: 100%; height: 100%; top: 0; left: 0;
                background: rgba(0, 40, 100, 0.4); z-index: -1; backdrop-filter: blur(3px);
            }

            .registro-container {
                background: rgba(255, 255, 255, 0.95);
                width: 100%;
                max-width: 420px;
                padding: 40px;
                
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

            .registro-container::before {
                content: ""; position: absolute; top: 0; left: 0; width: 100%; height: 6px;
                background: var(--primary-color);
                border-top-left-radius: 50px; border-top-right-radius: 50px;
            }

            .registro-logo {
                width: 120px; height: auto; margin-bottom: 10px; display: block;
                margin-left: auto; margin-right: auto;
            }

            h1 {
                color: #222; margin-bottom: 5px; font-size: 22px;
                font-weight: 800; text-transform: uppercase; letter-spacing: 1px; margin-top: 0;
            }
            
            p.subtitle { color: #666; font-size: 13px; margin-bottom: 25px; margin-top: 0; }

            form { display: flex; flex-direction: column; gap: 15px; }

            input[type="text"], 
            input[type="email"],
            input[type="password"] {
                width: 100%; padding: 12px 20px; border: 2px solid transparent;
                background-color: var(--input-bg);
                border-radius: 30px; /* Redondos */
                box-sizing: border-box; font-size: 14px; font-family: 'Poppins', sans-serif;
                transition: 0.3s; outline: none;
            }
            
            input:focus {
                background-color: #fff; border-color: var(--primary-color);
                box-shadow: 0 4px 10px rgba(238, 98, 107, 0.1);
            }

            input[type="submit"] {
                padding: 15px; background-color: var(--primary-color); color: white;
                border: none; border-radius: 50px; font-weight: 600; cursor: pointer;
                transition: 0.3s; margin-top: 10px; font-size: 15px;
                text-transform: uppercase; letter-spacing: 1px;
                box-shadow: 0 5px 15px rgba(238, 98, 107, 0.4);
            }
            
            input[type="submit"]:hover {
                background-color: var(--primary-dark); transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(238, 98, 107, 0.6);
            }

            .login-link { margin-top: 25px; font-size: 13px; color: #555; }
            .login-link a { color: var(--accent-color); text-decoration: none; font-weight: 600; }
            .login-link a:hover { text-decoration: underline; }

        </style>
    </head>
    <body>
        
        <ul class="background-slider">
            <li></li> <li></li> <li></li> <li></li> <li></li> <li></li>
        </ul>
        <div class="overlay"></div>
        
        <div class="registro-container">
            <img src="assets/images/logoLOGIN-REGISTRO.png" alt="LUGX Gaming" class="registro-logo">
            
            <h1>Crear una Cuenta</h1>
            <p class="subtitle">Únete a la comunidad LUGX hoy mismo!</p>
            
            <form action="nuevousuario" method="post">
                <input type="text" name="usuario" placeholder="Nombre de usuario" required>
                <input type="email" name="correo" placeholder="Correo electrónico" required>
                <input type="password" name="pass" placeholder="Contraseña" required>
                <input type="text" name="direccion" placeholder="Dirección (Opcional)">
                <input type="text" name="telefono" placeholder="Teléfono (Opcional)">
                
                <input type="submit" value="REGISTRARSE">
            </form>
            
            <div class="login-link">
                ¿Ya tienes una cuenta? <a href="index.jsp">Inicia Sesión</a>
            </div>
        </div>
    </body>
</html>