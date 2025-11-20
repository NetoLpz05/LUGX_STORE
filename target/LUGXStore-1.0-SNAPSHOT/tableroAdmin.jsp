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
    <link rel="icon" href="img/logo.ico" type="image/x-icon">
    <title>Tablero de Administración</title>
    <link rel="icon" href="img/logo.ico" type="image/x-icon">
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
        
        .btn-buscar-naranja {
            background-color: #FF9800;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        
        .btn-buscar-naranja:hover {
            background-color: #e65100;
        }
        
        .btn-reset {
        display: inline-block;          /* Para que tenga cuerpo de botón */
        padding: 9px 15px;              /* Relleno igual al de Buscar */
        background-color: #78909c;      /* Gris azulado elegante */
        color: white;
        text-decoration: none;          /* Quita el subrayado */
        border-radius: 5px;
        font-weight: bold;
        font-size: 14px;
        border: none;
        transition: background-color 0.3s ease, transform 0.2s ease;
        cursor: pointer;
        line-height: normal;            /* Asegura alineación vertical */
    }

    .btn-reset:hover {
        background-color: #546e7a;      /* Gris más oscuro al pasar el ratón */
        transform: translateY(-1px);    /* Pequeño efecto de elevación */
        color: white;                   /* Mantiene el texto blanco */
    }

    /* Ajuste para alinear inputs y botones perfectamente */
    .search-form input, .search-form button, .search-form a {
        vertical-align: middle;
    }
    </style>
</head>
<body>
    <h1>Administración de Videojuegos - LUGX</h1> 
    <h2>Tabla de Videojuegos</h2>
    <div class="toolbar" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; background-color: white; padding: 15px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.05);">
        
        <a href="JuegoServlet?accion=nuevo" class="btn-nuevo" style="margin-bottom: 0;">+ Añadir Nuevo Videojuego</a>

        <form action="JuegoServlet" method="GET" style="display: flex; gap: 10px; align-items: center;">
            <input type="hidden" name="accion" value="buscar"> 
            
            <input type="number" name="id" placeholder="ID Juego" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <button type="submit" style="padding: 8px 15px; background-color: #3a7bd5; color: white; border: none; border-radius: 5px; cursor: pointer; font-weight: bold;">
                Buscar Videojuego
            </button>
            <a href="JuegoServlet?accion=listar" class="btn-reset">
            ⟲ Ver Todos
            </a>
        </form>
    </div>
    
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
                <td>
                    <img src="<c:out value="${juego.imagen}"/>" 
                         alt="Portada" 
                         class="img-thumb" 
                         onerror="this.src='https://via.placeholder.com/50x70?text=Sin+Img';"> 
                </td>
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
    
    <h1>Administración de Usuarios - LUGX</h1>
    <div class="toolbar" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; background-color: white; padding: 15px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.05);">
        <form action="JuegoServlet" method="GET" style="display: flex; gap: 10px; align-items: center;">
            <input type="hidden" name="accion" value="buscarUsuario"> 
            
            <input type="number" name="id" placeholder="ID Usuario" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <button type="submit" style="padding: 8px 15px; background-color: #3a7bd5; color: white; border: none; border-radius: 5px; cursor: pointer; font-weight: bold;">
                Buscar Usuario
            </button>
            <a href="JuegoServlet?accion=listar" class="btn-reset">
            ⟲ Ver Todos
            </a>
        </form>
    </div>

    <table>
        </table>
    
    <h2>Tabla de Usuarios</h2>
    <table>
        <thead>
            <tr style="background-color: #FF9800;"> <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Rol</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="usuario" items="${listaUsuarios}">
            <tr>
                <td><c:out value="${usuario.idUsuario}"/></td>
                <td><c:out value="${usuario.nombre}"/></td>
                <td><c:out value="${usuario.correo}"/></td>
                <td><c:out value="${usuario.telefono}"/></td>
                <td>
                    <c:set var="rolStr" value="${usuario.rol.toString()}"/>
                    
                    <span style="font-weight: bold; color: ${rolStr == 'ADMIN' ? 'red' : 'green'};">
                        <c:out value="${usuario.rol}"/>
                    </span>
                </td>
                <td class="action-links">
                    <a href="JuegoServlet?accion=eliminarUsuario&id=${usuario.idUsuario}" 
                       onclick="return confirm('¿Eliminar al usuario ${usuario.nombre}?');"
                       class="btn-eliminar">
                        Eliminar
                    </a>
                </td>
            </tr>
            </c:forEach>
            
            <c:if test="${empty listaUsuarios}">
                <tr><td colspan="5" class="no-data">No hay usuarios registrados.</td></tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>