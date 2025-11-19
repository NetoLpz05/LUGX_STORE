<%-- 
    Document   : index
    Created on : 21 oct 2025, 6:39:26 p.m.
    Author     : Laboratorios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar Sesión</h1>
        <form action="iniciar" method="post">
            <input type="text" name="usuario" placeholder="Nombre de Usuario"><br>
            <input type="password" name="pass" placeholder="Contraseña"><br>
            <input type="submit" value="Iniciar Sesión">
        </form>
        <br>
        No tienes una cuenta...<a href="registro.jsp">Registrar</a>
    </body>
</html>
