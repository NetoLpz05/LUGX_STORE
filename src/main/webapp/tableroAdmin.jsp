<%-- 
    Document   : tableroAdmin
    Created on : 18 nov 2025, 8:52:17 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tablero de Administración | LUGX</title>
    <link rel="icon" href="assets/images/logo.ico" type="image/x-icon">
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* --- 1. VARIABLES LUGX --- */
        :root {
            --primary-red: #ee626b;
            --primary-blue: #0071f8;
            --dark-text: #1e1e1e;
            --light-bg: #f7f7f7;
            --white: #ffffff;
            --gray-text: #7a7a7a;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0; padding: 0;
            background-color: var(--light-bg);
            color: var(--dark-text);
        }

        /* --- 2. HEADER SUPERIOR --- */
        .admin-header {
            background-color: var(--white);
            padding: 15px 40px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky; top: 0; z-index: 100;
        }

        .brand-logo { display: flex; align-items: center; gap: 15px; }
        .brand-logo img { width: 100px; height: auto; }
        .brand-logo h2 { margin: 0; font-size: 18px; color: var(--gray-text); font-weight: 500; border-left: 2px solid #eee; padding-left: 15px; }

        .user-nav a {
            text-decoration: none; color: var(--primary-red);
            font-weight: 600; padding: 8px 20px;
            border: 2px solid var(--primary-red); border-radius: 50px;
            transition: 0.3s;
        }
        .user-nav a:hover { background-color: var(--primary-red); color: white; }

        /* --- 3. CONTENEDOR PRINCIPAL --- */
        .main-content {
            max-width: 1200px; margin: 40px auto; padding: 0 20px;
        }

        /* --- 4. TARJETAS (SECCIONES) --- */
        .card-panel {
            background: var(--white);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            margin-bottom: 40px;
        }

        .section-header {
            display: flex; justify-content: space-between; align-items: center;
            margin-bottom: 25px; border-bottom: 2px solid #f0f0f0; padding-bottom: 15px;
        }

        .section-header h3 {
            margin: 0; font-size: 24px; color: var(--primary-blue); font-weight: 700; text-transform: uppercase;
        }

        /* --- 5. HERRAMIENTAS Y BÚSQUEDA --- */
        .toolbar {
            display: flex; gap: 15px; align-items: center; flex-wrap: wrap;
        }

        /* Inputs modernos */
        input[type="number"], input[type="text"] {
            padding: 10px 20px; border-radius: 50px; border: 1px solid #ddd;
            background: #f9f9f9; font-family: 'Poppins', sans-serif; outline: none; transition: 0.3s;
        }
        input[type="number"]:focus { border-color: var(--primary-blue); background: white; }

        /* --- 6. BOTONES LUGX --- */
        .btn {
            padding: 10px 25px; border-radius: 50px; text-decoration: none;
            font-weight: 600; font-size: 14px; border: none; cursor: pointer;
            transition: 0.3s; display: inline-flex; align-items: center; gap: 8px;
        }
        
        .btn-add { background-color: var(--primary-red); color: white; box-shadow: 0 5px 15px rgba(238, 98, 107, 0.3); }
        .btn-add:hover { background-color: #d4535b; transform: translateY(-2px); }

        .btn-search { background-color: var(--primary-blue); color: white; }
        .btn-search:hover { background-color: #005bc5; }

        .btn-reset { background-color: #e0e0e0; color: #555; }
        .btn-reset:hover { background-color: #ccc; }

        .btn-small { padding: 6px 15px; font-size: 12px; }
        .btn-edit { background-color: #eef2ff; color: var(--primary-blue); }
        .btn-edit:hover { background-color: var(--primary-blue); color: white; }
        
        .btn-delete { background-color: #fff0f1; color: var(--primary-red); }
        .btn-delete:hover { background-color: var(--primary-red); color: white; }

        /* --- 7. TABLAS MODERNAS --- */
        table { width: 100%; border-collapse: separate; border-spacing: 0 10px; }

        thead th {
            text-align: left; padding: 0 15px 10px 15px;
            color: #999; font-size: 13px; text-transform: uppercase; font-weight: 600;
        }

        tbody tr {
            background-color: white;
            box-shadow: 0 5px 10px rgba(0,0,0,0.02);
            transition: 0.2s;
        }
        
        tbody tr:hover { transform: scale(1.01); box-shadow: 0 5px 15px rgba(0,0,0,0.08); }

        tbody td {
            padding: 15px; vertical-align: middle;
            border-top: 1px solid #f9f9f9; border-bottom: 1px solid #f9f9f9;
        }

        /* Bordes redondos en las filas */
        tbody td:first-child { border-left: 1px solid #f9f9f9; border-top-left-radius: 15px; border-bottom-left-radius: 15px; }
        tbody td:last-child { border-right: 1px solid #f9f9f9; border-top-right-radius: 15px; border-bottom-right-radius: 15px; }

        .img-thumb {
            width: 50px; height: 50px; object-fit: cover; border-radius: 10px;
        }

        /* Badges para Roles */
        .badge { padding: 5px 10px; border-radius: 8px; font-size: 12px; font-weight: 700; }
        .badge-admin { background-color: #fff0f1; color: var(--primary-red); }
        .badge-user { background-color: #e6fffa; color: #00b894; }

        .no-data { text-align: center; color: #999; padding: 40px; font-style: italic; }

    </style>
</head>
<body>

    <header class="admin-header">
        <div class="brand-logo">
            <img src="assets/images/logoLOGIN-REGISTRO.png" alt="LUGX">
            <h2>Panel de Control</h2>
        </div>
        <div class="user-nav">
            <span style="margin-right: 15px; font-weight: 500;">Hola, Admin</span>
            <a href="CerrarSesion"><i class="fa fa-sign-out-alt"></i> Salir</a>
        </div>
    </header>

    <div class="main-content">

        <div class="card-panel">
            <div class="section-header">
                <h3><i class="fa fa-gamepad"></i> Catálogo de Videojuegos</h3>
                <a href="JuegoServlet?accion=nuevo" class="btn btn-add">
                    <i class="fa fa-plus"></i> Nuevo Juego
                </a>
            </div>

            <div style="margin-bottom: 20px;">
                <form action="JuegoServlet" method="GET" class="toolbar">
                    <input type="hidden" name="accion" value="buscar"> 
                    <input type="number" name="id" placeholder="Buscar por ID..." required>
                    
                    <button type="submit" class="btn btn-search">
                        <i class="fa fa-search"></i> Buscar
                    </button>
                    
                    <a href="JuegoServlet?accion=listar" class="btn btn-reset">
                        <i class="fa fa-sync-alt"></i> Ver Todos
                    </a>
                </form>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Género</th>
                        <th>Plataforma</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th style="text-align: right;">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="juego" items="${listaJuegos}">
                    <tr>
                        <td style="font-weight: bold; color: #888;">#<c:out value="${juego.idJuego}"/></td>
                        <td>
                            <img src="<c:out value="${juego.imagen}"/>" class="img-thumb" onerror="this.src='https://via.placeholder.com/50';"> 
                        </td>
                        <td style="font-weight: 600;"><c:out value="${juego.nombre}"/></td>
                        <td><c:out value="${juego.genero}"/></td>
                        <td><c:out value="${juego.plataforma}"/></td>
                        <td style="color: var(--primary-blue); font-weight: 700;">$<c:out value="${juego.precio}"/></td>
                        <td>
                            <span style="background: #eee; padding: 2px 8px; border-radius: 4px; font-size: 12px;">
                                <c:out value="${juego.stock}"/>
                            </span>
                        </td>
                        <td style="text-align: right;">
                            <a href="JuegoServlet?accion=editar&id=${juego.idJuego}" class="btn btn-small btn-edit" title="Editar">
                                <i class="fa fa-pencil-alt"></i>
                            </a>
                            <a href="JuegoServlet?accion=eliminar&id=${juego.idJuego}" 
                               onclick="return confirm('¿Eliminar definitivamente: ${juego.nombre}?');"
                               class="btn btn-small btn-delete" title="Eliminar">
                                <i class="fa fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                    
                    <c:if test="${empty listaJuegos}">
                        <tr><td colspan="8" class="no-data">No se encontraron videojuegos.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>


        <div class="card-panel">
            <div class="section-header">
                <h3 style="color: #444;"><i class="fa fa-users"></i> Gestión de Usuarios</h3>
            </div>

            <div style="margin-bottom: 20px;">
                <form action="JuegoServlet" method="GET" class="toolbar">
                    <input type="hidden" name="accion" value="buscarUsuario"> 
                    <input type="number" name="id" placeholder="Buscar Usuario ID..." required>
                    
                    <button type="submit" class="btn btn-search" style="background-color: #444;">
                        <i class="fa fa-search"></i> Buscar
                    </button>
                    <a href="JuegoServlet?accion=listar" class="btn btn-reset">
                        <i class="fa fa-sync-alt"></i> Restaurar
                    </a>
                </form>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo Electrónico</th>
                        <th>Teléfono</th>
                        <th>Rol</th>
                        <th style="text-align: right;">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="usuario" items="${listaUsuarios}">
                    <tr>
                        <td style="font-weight: bold; color: #888;">#<c:out value="${usuario.idUsuario}"/></td>
                        <td style="font-weight: 600;"><c:out value="${usuario.nombre}"/></td>
                        <td><c:out value="${usuario.correo}"/></td>
                        <td><c:out value="${usuario.telefono}"/></td>
                        <td>
                            <c:set var="rolStr" value="${usuario.rol.toString()}"/>
                            <span class="badge ${rolStr == 'ADMIN' ? 'badge-admin' : 'badge-user'}">
                                <c:out value="${usuario.rol}"/>
                            </span>
                        </td>
                        <td style="text-align: right;">
                            <a href="JuegoServlet?accion=eliminarUsuario&id=${usuario.idUsuario}" 
                               onclick="return confirm('¿Eliminar al usuario ${usuario.nombre}?');"
                               class="btn btn-small btn-delete">
                                <i class="fa fa-trash"></i> Eliminar
                            </a>
                        </td>
                    </tr>
                    </c:forEach>

                    <c:if test="${empty listaUsuarios}">
                        <tr><td colspan="6" class="no-data">No hay usuarios registrados.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>