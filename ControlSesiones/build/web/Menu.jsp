<%-- 
    Document   : Menu
    Created on : 6 nov 2024, 2:52:32 p. m.
    Author     : YEIMI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Virtual - Menú</title>
    <!-- Enlace a Bootstrap CSS para estilizar el menú -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Bienvenido al Menú de la Biblioteca Virtual</h1>
        
        <!-- Menú de navegación -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light mt-3">
            <a class="navbar-brand" href="#">Biblioteca Virtual</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="catalogo.jsp">Catálogo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="miBiblioteca.jsp">Mi Biblioteca</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="perfil.jsp">Perfil</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link" href="LogoutServlet">Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Contenido principal -->
        <div class="mt-5">
            <p class="text-center">Selecciona una opción del menú para comenzar a explorar nuestra biblioteca virtual.</p>
        </div>
    </div>

    <!-- Scripts de Bootstrap para funcionalidad del menú -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
