<%-- 
    Document   : formularioJuego
    Created on : 18 nov 2025, 8:52:43 p.m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${juego != null ? 'Editar' : 'Añadir'}"/> Videojuego | LUGX Admin</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* --- 1. VARIABLES --- */
        :root {
            --primary-red: #ee626b;
            --primary-blue: #0071f8;
            --light-bg: #f7f7f7;
            --input-bg: #f3f4f6;
            --text-dark: #1e1e1e;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0; padding: 40px 20px;
            background-color: var(--light-bg);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex; justify-content: center; align-items: flex-start;
        }

        /* --- 2. TARJETA DEL FORMULARIO --- */
        .form-card {
            background-color: white;
            width: 100%; max-width: 800px;
            padding: 40px;
            border-radius: 40px; /* Bordes muy redondeados estilo LUGX */
            box-shadow: 0 15px 40px rgba(0,0,0,0.05);
            position: relative;
        }

        /* Cabecera */
        .form-header {
            text-align: center; margin-bottom: 30px; border-bottom: 2px solid #f0f0f0; padding-bottom: 20px;
        }
        
        .form-logo { width: 100px; display: block; margin: 0 auto 10px auto; }

        h1 {
            color: var(--primary-blue); margin: 0; font-size: 24px;
            font-weight: 700; text-transform: uppercase; letter-spacing: 1px;
        }
        
        .subtitle { color: #888; font-size: 14px; margin-top: 5px; }

        /* --- 3. CAMPOS (GRID SYSTEM) --- */
        form { display: flex; flex-direction: column; gap: 20px; }

        .form-row {
            display: grid; grid-template-columns: 1fr 1fr; gap: 20px;
        }

        label {
            display: block; margin-bottom: 8px; font-weight: 600;
            font-size: 13px; color: #555; margin-left: 10px;
        }

        input[type="text"], 
        input[type="number"], 
        input[type="url"],
        textarea {
            width: 100%; padding: 12px 20px;
            background-color: var(--input-bg);
            border: 2px solid transparent;
            border-radius: 20px; /* Inputs redondos */
            font-family: 'Poppins', sans-serif; font-size: 14px; color: #333;
            box-sizing: border-box; transition: 0.3s; outline: none;
        }

        input:focus, textarea:focus {
            background-color: white; border-color: var(--primary-blue);
            box-shadow: 0 4px 10px rgba(0, 113, 248, 0.1);
        }

        textarea { border-radius: 20px; resize: vertical; min-height: 100px; }

        /* --- 4. PREVISUALIZACIÓN DE IMAGEN --- */
        .image-preview-container {
            display: flex; gap: 20px; align-items: center;
        }
        .img-preview {
            width: 80px; height: 80px; border-radius: 15px;
            object-fit: cover; background-color: #eee;
            border: 2px dashed #ccc;
        }

        /* --- 5. BOTONES --- */
        .form-actions {
            margin-top: 20px; padding-top: 20px; border-top: 1px solid #f0f0f0;
            display: flex; align-items: center; justify-content: space-between;
        }

        button[type="submit"] {
            padding: 12px 35px;
            background-color: var(--primary-red); color: white;
            border: none; border-radius: 50px;
            font-weight: 600; font-size: 15px; cursor: pointer;
            transition: 0.3s; text-transform: uppercase; letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(238, 98, 107, 0.4);
        }

        button[type="submit"]:hover {
            background-color: #d4535b; transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(238, 98, 107, 0.6);
        }

        .cancel-link {
            text-decoration: none; color: #777; font-weight: 600; font-size: 14px;
            transition: 0.3s; display: flex; align-items: center; gap: 5px;
        }
        .cancel-link:hover { color: var(--text-dark); }

    </style>
</head>
<body>

    <div class="form-card">
        
        <div class="form-header">
            <img src="assets/images/logo.png" alt="LUGX" class="form-logo">
            <h1><c:out value="${juego != null ? 'Editar Videojuego' : 'Nuevo Videojuego'}"/></h1>
            <div class="subtitle">Complete la información para el catálogo</div>
        </div>

        <form action="JuegoServlet" method="POST">
            
            <c:if test="${juego != null}">
                <input type="hidden" name="idJuego" value="<c:out value="${juego.idJuego}"/>" />
            </c:if>

            <div>
                <label for="nombre">Nombre del Título</label>
                <input type="text" id="nombre" name="nombre" value="<c:out value="${juego.nombre}"/>" required placeholder="Ej. Super Mario Odyssey">
            </div>

            <div class="form-row">
                <div>
                    <label for="genero">Género</label>
                    <input type="text" id="genero" name="genero" value="<c:out value="${juego.genero}"/>" placeholder="Ej. Aventura">
                </div>
                <div>
                    <label for="plataforma">Plataforma</label>
                    <input type="text" id="plataforma" name="plataforma" value="<c:out value="${juego.plataforma}"/>" required placeholder="Ej. Nintendo Switch">
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="precio">Precio ($)</label>
                    <input type="number" step="0.01" id="precio" name="precio" value="<c:out value="${juego.precio}"/>" required placeholder="0.00">
                </div>
                <div>
                    <label for="stock">Stock (Unidades)</label>
                    <input type="number" id="stock" name="stock" value="<c:out value="${juego.stock}"/>" required placeholder="0">
                </div>
            </div>

            <div>
                <label for="imagen">URL de la Portada</label>
                <div class="image-preview-container">
                    <input type="url" id="imagen" name="imagen" value="<c:out value="${juego.imagen}"/>" 
                           placeholder="https://..." oninput="actualizarPreview(this.value)">
                    
                    <img src="<c:out value="${juego.imagen}"/>" id="preview" class="img-preview" 
                         onerror="this.src='https://via.placeholder.com/80?text=IMG'">
                </div>
            </div>
            
            <div>
                <label for="banner">URL del Banner (Opcional)</label>
                <input type="text" id="imagenDetalles" name="imagenDetalles" value="<c:out value="${juego.imagenDetalles}"/>" placeholder="Para el detalle del producto">
            </div>

            <div>
                <label for="descripcion">Descripción</label>
                <textarea id="descripcion" name="descripcion" rows="4" placeholder="Escribe una breve sinopsis..."><c:out value="${juego.descripcion}"/></textarea>
            </div>

            <div class="form-actions">
                <a href="JuegoServlet?accion=listar" class="cancel-link">
                    <i class="fa fa-arrow-left"></i> Cancelar
                </a>
                
                <button type="submit" name="accion" value="guardar">
                    <i class="fa fa-save"></i> <c:out value="${juego != null ? 'Guardar Cambios' : 'Añadir al Catálogo'}"/>
                </button>
            </div>

        </form>
    </div>

    <script>
        function actualizarPreview(url) {
            const img = document.getElementById('preview');
            if (url) {
                img.src = url;
            } else {
                img.src = 'https://via.placeholder.com/80?text=IMG';
            }
        }
    </script>
</body>
</html>