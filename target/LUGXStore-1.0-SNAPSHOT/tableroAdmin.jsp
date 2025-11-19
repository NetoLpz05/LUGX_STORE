<%-- 
    Document   : tableroAdmin
    Created on : 18 nov 2025, 8:52:17 p.m.
    Author     : Usuario
--%>

<%-- 
    Document   : tableroAdmin
    Created on : 18 nov 2025, 8:48:54 p.m.
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
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        .img-thumb { width: 50px; height: auto; }
    </style>
</head>
<body>
    <h1>🎮 Administración de Videojuegos</h1>
    
    <p><a href="JuegoServlet?accion=nuevo" style="padding: 10px; background-color: #4CAF50; color: white; text-decoration: none;">+ Añadir Nuevo Videojuego</a></p>
    
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
                <td><c:out value="${juego.precio}"/></td>
                <td><c:out value="${juego.stock}"/></td>
                <td><img src="<c:out value="${juego.imagen}"/>" alt="Portada" class="img-thumb"></td>
                <td>
                    <a href="JuegoServlet?accion=editar&id=${juego.idJuego}">Editar</a> |
                    
                    <a href="JuegoServlet?accion=eliminar&id=${juego.idJuego}" 
                       onclick="return confirm('¿Estás seguro de que quieres eliminar ${juego.nombre}?');"
                       style="color: red;">
                        Eliminar
                    </a>
                </td>
            </tr>
            </c:forEach>
            
            <c:if test="${empty listaJuegos}">
                <tr><td colspan="8">No hay videojuegos en el catálogo.</td></tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>