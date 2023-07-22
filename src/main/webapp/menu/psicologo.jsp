<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("usuario") == null) {
        // Redireccionar al usuario a la página de inicio de sesión
        response.sendRedirect("../authentication/loginPsicologo.jsp");
    }
%>


<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Panel del Psicólogo</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">


        <style>

        </style>


    </head>

    <body class="min-vh-100">
        <!-- Barra de navegación -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="#">Panel del Psicólogo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-page="Inicio">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-page="Pacientes">Pacientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-page="Citas">Citas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Contenedor para el contenido dinámico -->
        <div class="container-fluid" id="content-container">
            <!-- Aquí se cargará el contenido dinámico -->
        </div>

        <!-- Scripts de Bootstrap y jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                // Cargar contenido inicial
                loadPage('Inicio');

                // Manejar clics en los enlaces de navegación
                $('.nav-link').click(function (e) {
                    e.preventDefault();
                    var page = $(this).data('page');
                    loadPage(page);
                });

                // Función para cargar el contenido de la página
                function loadPage(page) {
                    $.ajax({
                        url: 'pagespsicologo/' + page + '.jsp', // Ruta del archivo HTML correspondiente a la página
                        dataType: 'html',
                        success: function (data) {
                            $('#content-container').html(data); // Cargar el contenido en el contenedor
                        },
                        error: function (xhr, status, error) {
                            console.log('Error al cargar la página: ' + error);
                        }
                    });
                }
            });
        </script>
    </body>
</html>
