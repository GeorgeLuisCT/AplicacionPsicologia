<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Cita, Managers.CitaDAO, models.Usuario" %>

<%
    
    int idUsuario = 0;
    Usuario usuario = null;
            usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
              idUsuario = usuario.getId();
         }
%>

<style>
    /* Estilos personalizados */

    h5, label{
        color: #0E0E52;
    }
    h1 {
        color: #0E0E52; /* Color azul de Bootstrap */
        font-weight: bold;
        margin-top: 30px;
        margin-bottom: 20px;
        text-align: center;
        text-decoration: underline;
    }

    body {
                        background-image: url("../public/images/fonndos/symbol-scatter-haikei.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: aliceblue;
                    }

    /* Estilo para los elementos de la lista */
    .list-group-item {
        background-color: #f8f9fa; /* Color de fondo gris claro */
        border: none;
        border-radius: 10px;
        margin-bottom: 10px;
        padding: 15px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .list-group-item p {
        margin-bottom: 5px;
    }

    /* Estilo para el texto "No hay citas disponibles" */
    .no-citas {
        font-style: italic;
        color: #6c757d; /* Color gris de Bootstrap */
        text-align: center;
        margin-top: 20px;
        font-size: 18px;
    }

    /* Estilo para la alerta */
    .custom-alert {
        background-color: #ffc107; /* Color amarillo de Bootstrap */
        color: #212529; /* Color de texto oscuro */
        padding: 15px;
        margin-top: 20px;
        border-radius: 4px;
        display: none;
        text-align: center;
        font-size: 18px;
    }
    
     /* Estilos personalizados para las citas */
    .cita-info {
        display: flex;
        align-items: center;
    }

    .cita-info-label {
        width: 120px;
        font-weight: bold;
    }

    .cita-info-value {
        margin-left: 10px;
    }
    
     /* Estilos personalizados para el modal "Editar Cita" */
    #editarCitaModal .modal-dialog {
        max-width: 400px;
    }

    #editarCitaModal .modal-title {
        font-weight: bold;
    }

    #editarCitaModal .modal-body {
        padding: 20px;
    }

    #editarCitaModal .modal-footer {
        justify-content: center;
    }

    #editarCitaModal .form-label {
        font-weight: bold;
    }
</style>
<div class="container">
    <h1 class="mt-4 mb-4">Gestiona Tus Citas</h1>

    <%-- Obtener todas las citas del paciente --%>
    <% 
    CitaDAO citadao = new CitaDAO();
    List<Cita> citasPsicologo = citadao.obtenerCitasPsicologo(idUsuario);
    %>

    <%-- Verificar si hay citas disponibles --%>
    <% if (!citasPsicologo.isEmpty()) { %>

    <%-- Recorrer y mostrar las citas --%>
<ul class="list-group">
    <% for (Cita cita : citasPsicologo) { %>
    <li class="list-group-item">
        <div class="row">
            <div class="col-8">
                <div class="cita-info">
                    <p class="cita-info-label">Paciente:</p>
                    <p class="cita-info-value"><% if (cita.getNombre() == null) { %>Anónimo<% } else { %><%= cita.getNombre() %><% } %></p>
                </div>
                <div class="cita-info">
                    <p class="cita-info-label">Fecha:</p>
                    <p class="cita-info-value"><% if (cita.getFecha() == null) { %>Aún no definido<% } else { %><%= cita.getFecha() %><% } %></p>
                </div>
                <div class="cita-info">
                    <p class="cita-info-label">Hora:</p>
                    <p class="cita-info-value"><% if (cita.getHora() == null) { %>Aún no definido<% } else { %><%= cita.getHora() %><% } %></p>
                </div>
                <div class="cita-info">
                    <p class="cita-info-label">Estado:</p>
                    <p class="cita-info-value"><%= cita.getEstado() %></p>
                </div>
            </div>
            <div class="col-4 d-flex align-items-center justify-content-center"> <!-- Columna para el botón con alineación vertical y centrado -->
                <button type="button" class="btn btn-primary gestionar-cita" data-cita-id="<%= cita.getId() %>">Gestionar</button>
            </div>
        </div>
    </li>
    <% } %>
</ul>




    <%-- Si no hay citas disponibles --%>
    <% } else { %>

    <p class="mt-4 mb-4">No hay citas disponibles para este paciente.</p>

    <%-- Cierre del else --%>
    <% } %>
</div>


<div class="modal" id="editarCitaModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Cita</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="editarCitaForm">
                <div class="modal-body">
                    <div class="container mt-5">

                        <div class="mb-3">
                            <label for="fecha" class="form-label">Fecha:</label>
                            <input type="date" id="fecha" name="fecha" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label for="hora" class="form-label">Hora:</label>
                            <input type="time" id="hora" name="hora" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label for="estado" class="form-label">Estado:</label>
                            <select id="estado" name="estado" class="form-select">
                                <option value="pendiente">Pendiente</option>
                                <option value="confirmada">Confirmada</option>
                                <option value="cancelada">Cancelada</option>
                            </select>
                        </div>



                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="alert alert-warning alert-dismissible fade show fixed-top text-center d-none" role="alert" id="myAlert">
    <strong> Hecho!</strong>Se a establecido una cita
    <button type="button" class="btn-close" aria-label="Close"></button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    var gestionarButtons = document.querySelectorAll('.gestionar-cita');
    var editarCitaModal = document.getElementById('editarCitaModal');
    var cancelarButton = document.querySelector('#editarCitaModal .modal-footer .btn-secondary');
    var close = document.querySelector('#editarCitaModal .modal-header .close');
    var citaId;
    
    gestionarButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            citaId = button.getAttribute('data-cita-id');


            console.log(citaId);
            editarCitaModal.style.display = 'block';
        });
    });

    // Cerrar el modal cuando se haga clic en el botón "Cancelar" o fuera del modal
    cancelarButton.addEventListener('click', function () {
        editarCitaModal.style.display = 'none';
    });
    close.addEventListener('click', function () {
        editarCitaModal.style.display = 'none';
    });

    editarCitaModal.addEventListener('click', function (event) {
        if (event.target === editarCitaModal) {
            editarCitaModal.style.display = 'none';
        }
    });

    $(document).ready(function () {
        $('#editarCitaForm').submit(function (event) {
            event.preventDefault(); // Evitar el envío del formulario por defecto

            // Obtener los valores del formulario
            const fecha = $('#fecha').val();
            const hora = $('#hora').val();
            const estado = $('#estado').val();

            // Crear un objeto con los datos a enviar
            const datos = {
                citaId: citaId,
                fecha: fecha,
                hora: hora,
                estado: estado,
                accion: 'editar'
            };

            // Realizar una solicitud AJAX al servlet
            $.ajax({
                url: '/AplicacionPsicologia/SolicitarCitaServlet',
                type: 'GET',
                data: datos,
                success: function (response) {
                    editarCitaModal.style.display = 'none';
                    console.log(response);

                    var alert = $("#myAlert");
                    alert.html(response.mensaje);
                    alert.removeClass("d-none").addClass("show");
                    setTimeout(function () {
                        alert.removeClass("show").addClass("d-none");
                    }, 3000);
                },
                error: function (error) {
                    // Manejar el error de la solicitud AJAX
                    console.error(error);
                }
            });
        });
    });
</script>