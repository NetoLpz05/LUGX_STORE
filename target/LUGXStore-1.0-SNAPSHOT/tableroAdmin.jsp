<%-- 
    Document   : tableroAdmin
    Created on : 18 nov 2025, 8:52:17 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tablero de Administración | LUGXStore</title>
    <style>
        /* Variables de color */
        :root {
            --color-principal: #3a7bd5; /* Azul primario */
            --color-secundario: #00bcd4; /* Cian para acento */
            --color-exito: #4CAF50; /* Verde */
            --color-alerta: #FF9800; /* Naranja */
            --color-peligro: #f44336; /* Rojo */
            --color-fondo: #f4f7f6; /* Gris claro para fondo */
            --color-texto-oscuro: #333;
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
        }

        /* --- Estilo del Botón de Añadir Nuevo Videojuego --- */
        .btn-nuevo {
            display: inline-block;
            padding: 12px 25px;
            background-color: var(--color-exito);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-nuevo:hover {
            background-color: #43A047; /* Verde más oscuro al pasar el ratón */
        }

        /* --- Estilos de la Tabla --- */
        table { 
            width: 100%; 
            border-collapse: separate; /* Cambiado a separate para bordes redondeados */
            border-spacing: 0;
            background-color: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            overflow: hidden; /* Asegura que los bordes redondeados se apliquen */
        }

        /* Encabezados de tabla */
        thead tr {
            background-color: var(--color-principal);
            color: white;
            font-size: 14px;
            text-transform: uppercase;
        }

        th, td { 
            padding: 15px; 
            text-align: left; 
            border-bottom: 1px solid #ddd;
            vertical-align: middle;
        }

        /* Filas de la tabla */
        tbody tr:nth-child(even) {
            background-color: #f9f9f9; /* Rayas para facilitar la lectura */
        }
        
        tbody tr:hover {
            background-color: #e8e8e8; /* Efecto hover en las filas */
        }

        /* Estilo para la columna de imagen */
        .img-thumb { 
            width: 70px; /* Tamaño de imagen ligeramente más grande */
            height: auto; 
            border-radius: 4px;
            object-fit: cover;
        }
        
        /* Mensaje de no hay juegos */
        .no-data {
            text-align: center;
            padding: 30px;
            font-style: italic;
            color: #666;
        }

        /* --- Estilos de las Acciones (Editar | Eliminar) --- */
        .action-links a {
            text-decoration: none;
            font-weight: 500;
            padding: 5px 8px;
            border-radius: 4px;
            transition: background-color 0.2s ease;
            margin: 0 2px;
        }
        
        .action-links .btn-editar {
            color: var(--color-secundario);
        }
        
        .action-links .btn-editar:hover {
            background-color: #e0f7fa;
        }

        .action-links .btn-eliminar {
            color: var(--color-peligro);
        }
        
        .action-links .btn-eliminar:hover {
            background-color: #ffebee;
        }
    </style>
</head>
<body>
    <h1>Administración de Videojuegos</h1>
    
    <p>
        <a href="JuegoServlet?accion=nuevo" class="btn-nuevo">+ Añadir Nuevo Videojuego</a>
    </p>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Género</th>
                <th>Plataforma</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="juego" items="${listaJuegos}">
            <tr>
                <td><c:out value="${juego.idJuego}"/></td>
                <td><c:out value="${juego.nombre}"/></td>
                <td><c:out value="${juego.genero}"/></td>
                <td><c:out value="${juego.plataforma}"/></td>
                <td>$<c:out value="${juego.precio}"/></td>
                <td><c:out value="${juego.stock}"/></td>
                <td><img src="<c:out value="${juego.imagen}"/>" alt="Portada" class="img-thumb"></td>
                <td class="action-links">
                    <a href="JuegoServlet?accion=editar&id=${juego.idJuego}" class="btn-editar">Editar</a> 
                    <span>|</span>
                    <a href="JuegoServlet?accion=eliminar&id=${juego.idJuego}" 
                       onclick="return confirm('¿Estás seguro de que quieres eliminar ${juego.nombre}?');"
                       class="btn-eliminar">
                        Eliminar
                    </a>
                </td>
            </tr>
            </c:forEach>
            
            <c:if test="${empty listaJuegos}">
                <tr><td colspan="8" class="no-data">No hay videojuegos en el catálogo.</td></tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>