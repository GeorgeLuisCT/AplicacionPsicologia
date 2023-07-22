
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Managers.PsicologoDAO"%>
<%@page import="models.PsicologoSobreMi"%>
<% 
  int id = Integer.parseInt(request.getParameter("id"));
  String nombre = request.getParameter("nombre");

  PsicologoDAO psicologoDAO = new PsicologoDAO(); // Instancia la clase PsicologoDAO
  PsicologoSobreMi masInformacion = psicologoDAO.ObtenerMasInformacion(id); // Llama al método ObtenerMasInformacion

  // Verifica si se encontró información para el ID proporcionado
  if (masInformacion != null) {
    // Obtiene los datos de masInformacion
    String sobreElPsicologo = masInformacion.getSobreMi();
    String experiencia = masInformacion.getExperiencia();
    String especialidad = masInformacion.getEspecialidad();
    String consultas = masInformacion.getConsultas();
    String contactar = masInformacion.getContactar();
    float calificaciones = masInformacion.getOpiniones();
       String rutaImgen = masInformacion.getRutaImagen();
    
    // Verifica si los datos son nulos y asigna valores predeterminados si es necesario
    if (sobreElPsicologo == null) {
      sobreElPsicologo = "Aun no tienes información sobre el psicólogo";
    }
    if (experiencia == null) {
      experiencia = "Aun no tienes información sobre la experiencia del psicólogo";
    }
    if (especialidad == null) {
      especialidad = "Aun no tienes información sobre la especialidad del psicólogo";
    }
    if (consultas == null) {
      consultas = "Aun no tienes información sobre las consultas con el psicólogo";
    }
    if (contactar == null) {
      contactar = "Aun no tienes información sobre cómo contactar al psicólogo";
    }
    if (calificaciones == 0.0f) {
      calificaciones =0.0f;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Mas información</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <div class="container">
                <style>
                    .ec-stars-wrapper:hover a {
                        color: #449DD1;
                    }
                    .ec-stars-wrapper > a:hover ~ a {
                        color: #888;
                    }
    
                    .ec-stars-wrapper a.resaltada {
                        color: #0E0E52; /* Color de las estrellas con la calificación inicial */
                    }
    
                    .ec-stars-wrapper a.resaltada-mouseover {
                        color: #150578; /* Color de las estrellas al pasar el mouse por encima */
                    }
    
                    h3 {
                        font-size: 4rem;
                        color: white;
                        -webkit-text-stroke: 2px black;
                    }
    
                    .row {
                        height: 100vh;
                    }
                    .flex-grow-1 {
                        flex-grow: 1;
                    }
    
                    .ec-stars-wrapper {
                        /* Espacio entre los inline-block (los hijos, los `a`) 
                           http://ksesocss.blogspot.com/2012/03/display-inline-block-y-sus-empeno-en.html */
                        font-size: 0;
                        display: flex;
                        flex-direction: row;
                    }
                    .ec-stars-wrapper a {
                        text-decoration: none;
                        display: inline-block;
                        /* Volver a dar tamaño al texto */
                        font-size: 32px;
                        font-size: 4rem;
    
                        color: #888;
                    }
    
                    .tamano {
                        max-width:  100%;
                        max-height: 100%;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }
    
                    img {
                        max-width:  100%;
                        max-height: 100%;
                    }
    
                    body {
                        background-image: url("../public/images/fonndos/fondoinfo.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: aliceblue;
                    }
    
                       h2 {
                        color: white;
                          font-weight: 900; /* Valor más alto para hacer la fuente más gruesa */
                font-size: 3vw; /* Tamaño de fuente relativo al ancho de la pantalla */
                    }
    
                    .margenarrba {
                        margin-top: 20px;
                    }
    
                    .morado li {
                        font-weight: bold;
                        color: white !important;
                    }
                    .rosa li {
                        color: white !important;
                    }
                    .rosa, .morado {
                        display: flex;
                        flex-direction: column;
                        padding:  0;
                    }
    
                    ul li {
                        color: #000000;
                    }
    
                    .rosa li, .morado li {
                        display: flex;
                        align-items: center;
                        margin: 10px;
                    }
    
                    .rosa li span {
                        background-color: #449DD1;
                        border-radius: 10px;
                        padding: 5px;
                    }
    
                    .morado li span {
                        background-color: #78C0E0;
                        border-radius: 10px;
                        padding: 5px;
                    }
    
                    .expercia {
                        list-style-type: none;
                        padding-left: 20px;
                    }
    
                    .expercia li {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-bottom: 5px;
                    }
    
                    .expercia li::before {
                        content: "✱";
                        color: #150578;
                        font-size: 2.5em;
                        margin-right: 5px;
                        vertical-align: middle;
                    }
    
                    .consultas {
                        list-style-type: none;
                        padding-left: 20px;
                    }
    
                    .consultas li {
                        position: relative;
                        padding-left: 25px;
                        margin-bottom: 10px;
                    }
    
                    .consultas li::before {
                        content: "•";
                        color: #150578;
                        font-size: 1.5em;
                        position: absolute;
                        left: 0;
                        margin-top: -2px;
                        float: right;
                    }
    
                    .estrella {
                        display: flex;
                        align-items: center;
                        font-weight: bold;
                        font-size: 3rem;
                    }
                    .estrella p {
                        margin: 0 0 0 20px;
                    }
    
                    .container {
                        display: flex;
                        justify-content: center;
                    }
                </style>

            <div class="row py-5">
                <div class="col-md-4 d-flex flex-column position-relative">
                    <img src="<%=rutaImgen%>" alt="Imagen" >
                    <div class="position-absolute bottom-0 start-50 translate-middle-x text-center w-100">
                        <h3 class="mb-0"><%=nombre%></h3>
                    </div>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <div class="flex-grow-1">
                        <h2>Sobre Él</h2>
                        <p><%= sobreElPsicologo %></p>
                    </div>
                    <div class="flex-grow-1">
                        <h2>Experiencia</h2>
                        <ul class="expercia">
                <% String[] experienciaItems = experiencia.split(",");
                   for (String item : experienciaItems) { %>
                <li><%= item %></li>
                    <% } %>
            </ul>
                    </div>
                    <div class="flex-grow-1">
                        <h2>Especialidad</h2>
                        <ul  class="rosa">
                            <% String[] especialidadItems = especialidad.split(",");
                   for (String item : especialidadItems) { %>
                            <li><span> <%= item %></span></li>
                                <% } %>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <div class="flex-grow-1">
                        <h2 >Consultas</h2>
                        <ul class="consultas">
                            <% String[] consultasItems = consultas.split(",");
                   for (String item : consultasItems) { %>
                            <li><%= item %></li>
                                <% } %>
                        </ul>
                    </div>
                    <div class="flex-grow-1">
                        <h2>Contactar</h2>
                        <ul class="morado">
                            <% String[] contactarItems = contactar.split(",");
                   for (String item : contactarItems) { %>
                            <li>  <span><%= item %></span></li>
                                <% } %>
                        </ul>
                    </div>
                    <div class="flex-grow-1">
                        <h2>Calificacion</h2>
                        <div class="estrella">
                            <div class="ec-stars-wrapper">
                                <a href="#" data-value="1" >&#9733;</a>
                                <a href="#" data-value="2" >&#9733;</a>
                                <a href="#" data-value="3" >&#9733;</a>
                                <a href="#" data-value="4" >&#9733;</a>
                                <a href="#" data-value="5" >&#9733;</a>
                            </div>
                            <p><%=calificaciones%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Calificación inicial (ejemplo: 3)
            var calificacionInicial = <%=calificaciones%>;
            var calificacionSeleccionada = calificacionInicial;
            var seHaDadoClic = false;

            // Función para resaltar las estrellas según la calificación inicial
            function resaltarEstrellasInicial(calificacion) {
                for (var i = 0; i < stars.length; i++) {
                    if (i < calificacion) {
                        stars[i].classList.add('resaltada');
                        stars[i].classList.remove('resaltada-mouseover');
                    } else {
                        stars[i].classList.remove('resaltada');
                        stars[i].classList.remove('resaltada-mouseover');
                    }
                }
            }

            // Función para manejar el evento de pasar el mouse por encima de una estrella
            function handleMouseOverEstrella() {
                if (!seHaDadoClic) {
                    var valorSeleccionado = parseInt(this.getAttribute('data-value'));

                    // Resaltar las estrellas hasta el valor seleccionado
                    for (var i = 0; i < stars.length; i++) {
                        if (i < valorSeleccionado) {
                            stars[i].classList.add('resaltada-mouseover');
                        } else {
                            stars[i].classList.remove('resaltada-mouseover');
                        }
                    }
                }
            }

            // Función para manejar el evento de pasar el mouse por fuera de las estrellas
            function handleMouseLeaveEstrellas() {
                if (!seHaDadoClic) {
                    resaltarEstrellasInicial(calificacionInicial);
                }
            }

            // Función para manejar el evento de clic en una estrella
            function handleClickEstrella(event) {
                event.preventDefault();
                var valorSeleccionado = parseInt(this.getAttribute('data-value'));
                var accion = "calificar";

                // Actualizar la calificación seleccionada y resaltar las estrellas
                calificacionSeleccionada = valorSeleccionado;
                resaltarEstrellasInicial(calificacionSeleccionada);

                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/AplicacionPsicologia/GuardarDatosServlet', true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr.send('calificacion=' + calificacionSeleccionada + '&actions=' + accion + '&id=' + <%=id%>);

                // Recargar la página después de enviar los datos
xhr.onload = function() {
  if (xhr.status === 200) {
    location.reload(); // Recargar la página
  }
};
                // Marcar que se ha dado clic
                seHaDadoClic = true;
            }


            // Obtener elementos de las estrellas
            var stars = document.querySelectorAll('.ec-stars-wrapper a');

            // Asignar el evento de pasar el mouse por encima a cada estrella
            for (var i = 0; i < stars.length; i++) {
                stars[i].addEventListener('mouseover', handleMouseOverEstrella);
            }

            // Asignar el evento de pasar el mouse por fuera de las estrellas
            document.querySelector('.ec-stars-wrapper').addEventListener('mouseleave', handleMouseLeaveEstrellas);

            // Asignar el evento de clic a cada estrella
            for (var i = 0; i < stars.length; i++) {
                stars[i].addEventListener('click', handleClickEstrella);
            }

            // Llamar a la función para resaltar las estrellas iniciales
            resaltarEstrellasInicial(calificacionInicial);
        </script>
    </body>

</html>

<% 
  } else {
    out.println("No se encontró información para el ID proporcionado."); // Si no se encuentra información, muestra un mensaje de error
  }
%>
