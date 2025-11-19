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
</head>
<body>
    <h1><c:out value="${juego != null ? 'Editar' : 'Añadir'}"/> Videojuego</h1>
    
    <form action="JuegoServlet" method="POST">
        
        <c:if test="${juego != null}">
            <input type="hidden" name="idJuego" value="<c:out value="${juego.idJuego}"/>" />
        </c:if>
        
        <label for="nombre">Nombre:</label><br>
        <input type="text" id="nombre" name="nombre" value="<c:out value="${juego.nombre}"/>" required><br><br>
        
        <label for="genero">Género:</label><br>
        <input type="text" id="genero" name="genero" value="<c:out value="${juego.genero}"/>"><br><br>

        <label for="plataforma">Plataforma:</label><br>
        <input type="text" id="plataforma" name="plataforma" value="<c:out value="${juego.plataforma}"/>" required><br><br>
        
        <label for="precio">Precio:</label><br>
        <input type="number" step="0.01" id="precio" name="precio" value="<c:out value="${juego.precio}"/>" required><br><br>
        
        <label for="stock">Stock:</label><br>
        <input type="number" id="stock" name="stock" value="<c:out value="${juego.stock}"/>" required><br><br>
        
        <label for="imagen">URL de Imagen:</label><br>
        <input type="url" id="imagen" name="imagen" value="<c:out value="${juego.imagen}"/>"><br><br>
        
        <label for="descripcion">Descripción:</label><br>
        <textarea id="descripcion" name="descripcion" rows="4" cols="50"><c:out value="${juego.descripcion}"/></textarea><br><br>
        
        <button type="submit" name="accion" value="guardar">
            <c:out value="${juego != null ? 'Guardar Cambios' : 'Añadir Videojuego'}"/>
        </button>
        
        <a href="JuegoServlet">Cancelar y Volver al Catálogo</a>
    </form>
</body>
</html>
