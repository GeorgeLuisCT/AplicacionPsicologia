<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Managers.PsicologoDAO"%>
<%@page import="models.PsicologoSobreMi"%>
<%@ page import="models.Cita, Managers.CitaDAO, models.Usuario" %>

<% 
  int idUsuario = 0;
  Usuario usuario = null;
  usuario = (Usuario) session.getAttribute("usuario");
  if (usuario != null) {
    idUsuario = usuario.getId();
  }
%>

<% 
  PsicologoDAO psicologoDAO = new PsicologoDAO(); // Instancia la clase PsicologoDAO
  PsicologoSobreMi masInformacion = psicologoDAO.ObtenerMasInformacion(idUsuario); // Llama al método ObtenerMasInformacion

  // Verifica si se encontró información para el ID proporcionado
  if (masInformacion != null) {
    // Obtiene los datos de masInformacion
    String sobreMi = masInformacion.getSobreMi();
    String experiencia = masInformacion.getExperiencia();
    String especialidad = masInformacion.getEspecialidad();
    String consultas = masInformacion.getConsultas();
    String contactar = masInformacion.getContactar();
    float calificaciones = masInformacion.getOpiniones();
    String rutaImgen = masInformacion.getRutaImagen();

    // Verifica si los datos son nulos y asigna valores predeterminados si es necesario
    if (sobreMi == null) {
      sobreMi = "Aun no tienes información sobre Sobre mí";
    }
    if (experiencia == null) {
      experiencia = "Aun no tienes información sobre Experiencia";
    }
    if (especialidad == null) {
      especialidad = "Aun no tienes información sobre Especialidad";
    }
    if (consultas == null) {
      consultas = "Aun no tienes información sobre Consultas";
    }
    if (contactar == null) {
      contactar = "Aun no tienes información sobre Contactar";
    }
    if (calificaciones == 0.0f) {
      calificaciones =0.0f;
    }
%>


<style>
    .fixed-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 999;
    }

    h3 {
        font-size: 4rem;
        color: white;
        -webkit-text-stroke: 2px black;
    }

    .row {
        height: 90vh;
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

    .ec-stars-wrapper a.resaltada {
        color: #ffbf00; /* Color de las estrellas con la calificación inicial */
    }

    body {
                        background-image: url("../public/images/fonndos/fondoinfo.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: aliceblue;
                    }
    
                    h2 {
                        color: white;
                          font-weight: 800; /* Valor más alto para hacer la fuente más gruesa */
                font-size: 2vw; /* Tamaño de fuente relativo al ancho de la pantalla */
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
    }

    .expercia li::before {
        content: "✱";
        color: purple;
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
        color: purple;
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
</style>


<div class="row">
    <div class="col-md-4 d-flex flex-column position-relative tamano">
        <img src="<%=rutaImgen%>" alt="Imagen"  data-bs-toggle="modal" data-bs-target="#carouselModal">
        <div class="position-absolute bottom-0 start-50 translate-middle-x text-center w-100">
            <h3 class="mb-0"><%=usuario.getNombre()%></h3>
        </div>
    </div>

    <div class="col-md-4 d-flex flex-column margenarrba">
        <div class="flex-grow-1">
            <h2>Sobre mí</h2>
            <p><%= sobreMi %></p>
        </div>
        <div class="flex-grow-1">
            <h2 >Experiencia</h2>
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
    <div class="col-md-4 d-flex flex-column margenarrba">
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

<div class="fixed-button">
    <button class="btn btn-primary" onclick="toggleModal()">Editar</button>
</div>

<!-- Modal de edición -->
<div class="modal fade" id="edicionModal" tabindex="-1" aria-labelledby="edicionModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="edicionModalLabel">Editar Más Información</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="edicionForm" action="/AplicacionPsicologia/GuardarDatosServlet" method="POST">
                    <!-- Campos de entrada para editar los datos -->
                    <input type="hidden" name="actions" value="sobremi">
                    <input type="hidden" name="id" value="<%=idUsuario%>">
                    <div class="mb-3">
                        <label for="sobreMi" class="form-label">Sobre mí</label>
                        <textarea class="form-control" name="sobreMi" id="sobreMi" rows="2"><%= sobreMi.equals("Aun no tienes información sobre Sobre mí") ? "" : sobreMi %></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="experiencia" class="form-label">Experiencia</label>
                        <textarea class="form-control" name="experiencia" id="experiencia" rows="2"><%= experiencia.equals("Aun no tienes información sobre Experiencia") ? "" : experiencia %></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="especialidad" class="form-label">Especialidad</label>
                        <textarea class="form-control" name="especialidad" id="especialidad" rows="2"><%= especialidad.equals("Aun no tienes información sobre Especialidad") ? "" : especialidad %></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="consultas" class="form-label">Consultas</label>
                        <textarea class="form-control" name="consultas" id="consultas" rows="2"><%= consultas.equals("Aun no tienes información sobre Consultas") ? "" : consultas %></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="contactar" class="form-label">Contactar</label>
                        <textarea class="form-control" name="contactar" id="contactar" rows="2"><%= contactar.equals("Aun no tienes información sobre Contactar") ? "" : contactar %></textarea>
                    </div>

                    <!-- Recuerda ajustar los nombres de los campos y los valores predeterminados según tus necesidades -->

                    <button type="submit" class="btn btn-primary">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal para el carrusel de imágenes -->
<div class="modal fade" id="carouselModal" tabindex="-1" aria-labelledby="carouselModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="carouselModalLabel">Carrusel de Imágenes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active text-center">
                            <img src="../public/images/1.png" alt="Imagen 1" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="carousel-item text-center">
                            <img src="../public/images/2.png" alt="Imagen 2" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="carousel-item text-center">
                            <img src="../public/images/3.png" alt="Imagen 3" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="carousel-item text-center">
                            <img src="../public/images/4.png" alt="Imagen 4" class="img-fluid mx-auto d-block">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Anterior</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Siguiente</span>
                    </button>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="0">Imagen 1</button>
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="1">Imagen 2</button>
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="2">Imagen 3</button>
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="3">Imagen 4</button>
            </div>
            <div class="modal-body">
                <form id="agregarImagenForm">
                    <div class="mb-3">
                        <label for="enlaceImagen" class="form-label">Enlace de imagen personalizado</label>
                        <input type="text" class="form-control" id="enlaceImagen" name="enlaceImagen">
                    </div>
                    <button type="submit" class="btn btn-primary btn-agregar-imagen">Agregar imagen</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal para el carrusel de imágenes -->
<div class="modal fade" id="carouselModal" tabindex="-1" aria-labelledby="carouselModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="carouselModalLabel">Carrusel de Imágenes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active text-center">
                            <img src="../public/images/1.png" alt="Imagen 1" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="carousel-item text-center">
                            <img src="../public/images/2.png" alt="Imagen 2" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="carousel-item text-center">
                            <img src="../public/images/3.png" alt="Imagen 3" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="carousel-item text-center">
                            <img src="../public/images/4.png" alt="Imagen 4" class="img-fluid mx-auto d-block">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Anterior</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Siguiente</span>
                    </button>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="0">Imagen 1</button>
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="1">Imagen 2</button>
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="2">Imagen 3</button>
                <button type="button" class="btn btn-primary" data-bs-target="#carouselExample" data-bs-slide-to="3">Imagen 4</button>
            </div>
            <div class="modal-body">
                <form id="agregarImagenForm">
                    <div class="mb-3">
                        <label for="enlaceImagen" class="form-label">Enlace de imagen personalizado</label>
                        <input type="text" class="form-control" id="enlaceImagen" name="enlaceImagen">
                    </div>
                    <button type="submit" class="btn btn-primary btn-agregar-imagen">Agregar imagen</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleModal() {
        var edicionModal = new bootstrap.Modal(document.getElementById("edicionModal")); // Crea una instancia del modal
        edicionModal.show(); // Muestra el modal
    }
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        var direccionImagenSeleccionada;

        $('#agregarImagenForm').submit(function (event) {

            var carousel = $(this).closest('.modal-content').find('.carousel-inner');
            var imagenSeleccionada = carousel.find('.carousel-item.active').find('img');
            direccionImagenSeleccionada = imagenSeleccionada.attr('src');
            $('.btn-agregar-imagen').data('direccion-imagen', direccionImagenSeleccionada);
            console.log(direccionImagenSeleccionada);

            event.preventDefault();

            var enlaceImagen = $('#enlaceImagen').val();
            var direccionImagen = enlaceImagen || direccionImagenSeleccionada;

            enviarDireccionImagen(direccionImagen);
        });


        function enviarDireccionImagen(direccionImagen) {
            var datos = {
                direccionImagen: direccionImagen
            };

            $.ajax({
                url: '/AplicacionPsicologia/GuardarImagenServlet',
                type: 'POST',
                data: datos,
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }
    });
</script>


<script>
    // Calificación inicial (ejemplo: 3)
    var calificacionInicial = <%=calificaciones%>;
    var calificacionSeleccionada = calificacionInicial;

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
    // Obtener elementos de las estrellas
    var stars = document.querySelectorAll('.ec-stars-wrapper a');


    // Llamar a la función para resaltar las estrellas iniciales
    resaltarEstrellasInicial(calificacionInicial);
</script>

<% 
  } else {
    out.println("No se encontró información para el ID proporcionado."); // Si no se encuentra información, muestra un mensaje de error
  }
%>
