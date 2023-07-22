
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Managers.PsicologoDAO" %>
<%@ page import="models.InfoBasicaPsicologo" %>

<style>
    .ec-stars-wrapper {
        /* Espacio entre los inline-block (los hijos, los `a`) 
           http://ksesocss.blogspot.com/2012/03/display-inline-block-y-sus-empeno-en.html */
        font-size: 0;
        display: inline-block;
    }
    .ec-stars-wrapper a {
        text-decoration: none;
        display: inline-block;
        /* Volver a dar tamaño al texto */
        font-size: 32px;
        font-size: 2rem;

        color: #888;
    }

    .ec-stars-wrapper a.resaltada {
        color: #ffbf00; /* Color de las estrellas con la calificación inicial */
    }
    
    .card img{
        width: 150px;
    } 
    h5, label{
        color: #0E0E52;
    }
    .card{
        background-color: #0E0E52;
    }
    body {
                        background-image: url("../public/images/fonndos/blurry-gradient-haikei.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: aliceblue;
                    }


</style>
<div class="container">
    <h1>Psicólogos Disponibles</h1>

    <%-- Obtener la lista de psicólogos --%>
    <%
        PsicologoDAO psicologoDAO = new PsicologoDAO();
        List<InfoBasicaPsicologo> psicologos = psicologoDAO.obtenerPsicologos();
        
        if (psicologos != null && !psicologos.isEmpty()) {
    %>

    <%-- Generar la rejilla de tarjetas --%>
    <div class="row">
        <%-- Iterar sobre la lista de psicólogos y generar las tarjetas de visualización --%>
        <% for (InfoBasicaPsicologo psicologo : psicologos) { %>
        <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
            <div class="card align-items-center">
                <img src="<%=psicologo.getDireccionImagen()%>" class="card-img-top" alt="Imagen del psicólogo">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= psicologo.getNombre() %></h5>
                    <div class="ec-stars-wrapper" data-calificacion="<%= psicologo.getCalificacion() %>">
                        <a href="#" data-value="1">&#9733;</a>
                        <a href="#" data-value="2">&#9733;</a>
                        <a href="#" data-value="3">&#9733;</a>
                        <a href="#" data-value="4">&#9733;</a>
                        <a href="#" data-value="5">&#9733;</a>
                    </div>
                    <div class="d-block">
                        <%-- Resto del código --%>
                        <a class="btn btn-primary mb-2 d-block" onclick="solicitarCita(<%= psicologo.getId() %>)">Solicitar Cita</a>
                        <a class="btn btn-secondary d-block" href="../Detalles/MasInformacion.jsp?id=<%= psicologo.getId() %>&nombre=<%= psicologo.getNombre() %>">Más Información</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <div class="alert alert-warning alert-dismissible fade show fixed-top text-center d-none" role="alert" id="myAlert">
        <!-- Contenido de la alerta -->
    </div>
</div>

<%-- Cierre del if --%>
<% } else { %>

<p>No se encontraron psicólogos.</p>
<%-- Cierre del else --%>
<% } %>

<!-- Enlaza los archivos JS de Bootstrap (jQuery es requerido) -->
<script src="ruta-a-tu-archivo/jquery.min.js"></script>
<script src="ruta-a-tu-archivo/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        // Función para resaltar las estrellas según la calificación guardada en data-calificacion
        function resaltarEstrellasInicial(calificacion) {
            var stars = $('.ec-stars-wrapper a');
            stars.each(function (index) {
                if (index < calificacion) {
                    $(this).addClass('resaltada').removeClass('resaltada-mouseover');
                } else {
                    $(this).removeClass('resaltada').removeClass('resaltada-mouseover');
                }
            });
        }

        // Llamar a la función para cada conjunto de estrellas
        $('.ec-stars-wrapper').each(function () {
            var calificacionInicial = $(this).data('calificacion');
            resaltarEstrellasInicial(calificacionInicial);
        });
    });
</script>