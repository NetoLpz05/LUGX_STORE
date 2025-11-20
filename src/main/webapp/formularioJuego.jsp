<%-- 
    Document   : formularioJuego
    Created on : 18 nov 2025, 8:52:43 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><c:out value="${juego != null ? 'Editar' : 'Añadir'}"/> Videojuego</title>
    <style>
        /* Variables de color */
        :root {
            --color-principal: #3a7bd5; /* Azul primario */
            --color-secundario: #00bcd4; /* Cian para acento */
            --color-exito: #4CAF50; /* Verde */
            --color-peligro: #f44336; /* Rojo */
            --color-fondo: #f4f7f6; /* Gris claro para fondo */
            --color-texto-oscuro: #333;
            --color-borde: #ccc;
        }

        /* Estilos generales del cuerpo */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: var(--color-fondo);
            color: var(--color-texto-oscuro);
        }

        h1 {
            color: var(--color-principal);
            border-bottom: 3px solid var(--color-secundario);
            padding-bottom: 10px;
            margin-bottom: 25px;
            text-align: center;
        }

        /* --- Estilos del Formulario --- */
        form {
            max-width: 600px;
            margin: 0 auto; /* Centrar el formulario */
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        label {
            display: block; /* Ocupa todo el ancho */
            margin-bottom: 5px;
            font-weight: bold;
            color: var(--color-principal);
        }

        /* Estilo para todos los campos de entrada y textarea */
        input[type="text"], 
        input[type="number"], 
        input[type="url"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid var(--color-borde);
            border-radius: 5px;
            box-sizing: border-box; /* Incluye padding y borde en el ancho */
            transition: border-color 0.3s ease;
            font-size: 16px;
        }
        
        input:focus, textarea:focus {
            border-color: var(--color-secundario);
            outline: none;
            box-shadow: 0 0 5px rgba(0, 188, 212, 0.3);
        }

        textarea {
            resize: vertical; /* Permite redimensionar solo verticalmente */
            min-height: 100px;
        }

        /* --- Estilos de Botones --- */
        button[type="submit"] {
            padding: 12px 25px;
            background-color: var(--color-exito);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }
        
        button[type="submit"]:hover {
            background-color: #43A047;
        }

        /* Botón de Cancelar */
        .cancel-link {
            padding: 12px 25px;
            text-decoration: none;
            color: var(--color-texto-oscuro);
            border: 1px solid var(--color-borde);
            border-radius: 8px;
            transition: background-color 0.3s ease;
            display: inline-block;
            font-weight: bold;
        }
        
        .cancel-link:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <h1><c:out value="${juego != null ? 'Editar' : 'Añadir'}"/> Videojuego</h1>
    
    <form action="JuegoServlet" method="POST">
        
        <c:if test="${juego != null}">
            <input type="hidden" name="idJuego" value="<c:out value="${juego.idJuego}"/>" />
        </c:if>
        
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="<c:out value="${juego.nombre}"/>" required>
        
        <label for="genero">Género:</label>
        <input type="text" id="genero" name="genero" value="<c:out value="${juego.genero}"/>">

        <label for="plataforma">Plataforma:</label>
        <input type="text" id="plataforma" name="plataforma" value="<c:out value="${juego.plataforma}"/>" required>
        
        <label for="precio">Precio ($):</label>
        <input type="number" step="0.01" id="precio" name="precio" value="<c:out value="${juego.precio}"/>" required>
        
        <label for="stock">Stock (Unidades):</label>
        <input type="number" id="stock" name="stock" value="<c:out value="${juego.stock}"/>" required>
        
        <label for="imagen">URL de Imagen:</label>
        <input type="url" id="imagen" name="imagen" value="<c:out value="${juego.imagen}"/>">
        
        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion" rows="4"><c:out value="${juego.descripcion}"/></textarea>
        
        <div style="margin-top: 25px; border-top: 1px solid #eee; padding-top: 20px;">
            <button type="submit" name="accion" value="guardar">
                <c:out value="${juego != null ? 'Guardar Cambios' : 'Añadir Videojuego'}"/>
            </button>
            
            <a href="JuegoServlet" class="cancel-link">Cancelar y Volver al Catálogo</a>
        </div>
    </form>
</body>
</html>