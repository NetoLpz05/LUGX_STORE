<%-- 
    Document   : registro
    Created on : 30 oct 2025, 7:12:42 p.m.
    Author     : Laboratorios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
    </head>
    <body>
        <h1>Registrar Usuario</h1>
        <<form action="nuevousuario" method="post">
            <input type="text" name="usuario" placeholder="nombre de usuario"><br>
            <input type="password" name="pass"><br>
            <input type="submit" value="Registrar Usuario">
        </form>
    </body>
</html>

