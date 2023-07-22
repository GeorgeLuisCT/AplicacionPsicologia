<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    /* Estilo para el encabezado */
    h1 {
        color: #007bff; /* Color azul de Bootstrap */
        font-weight: bold;
        margin-top: 30px;
        margin-bottom: 20px;
        text-align: center;
        text-decoration: underline;
    }
    body, h1 {
                        background-image: url("../public/images/fonndos/symbol-scatter-haikei.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: #0E0E52;
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
</style>

<div class="container">
    <h1 class="mt-4 mb-4">Tus Citas</h1>

    <% 
    CitaDAO citadao = new CitaDAO();
    List<Cita> citasPaciente = citadao.obtenerCitasPaciente(idUsuario); 
    %>

    <%-- Verificar si hay citas disponibles --%>
    <% if (!citasPaciente.isEmpty()) { %>

    <%-- Recorrer y mostrar las citas --%>
    <div class="list-group">
        <% for (Cita cita : citasPaciente) { %>
        <div class="list-group-item">
            <div class="cita-info">
                <p class="cita-info-label">Psicólogo:</p>
                <p class="cita-info-value"><% if (cita.getNombre() == null) { %>Anónimo<% } else { %><%= cita.getNombre() %><% } %></p>
            </div>
            <div class="cita-info">
                <p class="cita-info-label">Fecha:</p>
                <p class="cita-info-value"><%= cita.getFecha() %></p>
            </div>
            <div class="cita-info">
                <p class="cita-info-label">Hora:</p>
                <p class="cita-info-value"><%= cita.getHora() %></p>
            </div>
            <div class="cita-info">
                <p class="cita-info-label">Estado:</p>
                <p class="cita-info-value"><%= cita.getEstado() %></p>
            </div>
        </div>
        <% } %>
    </div>


    <%-- Si no hay citas disponibles --%>
    <% } else { %>

    <p class="no-citas mt-4 mb-4">No hay citas disponibles para este paciente.</p>

    <%-- Cierre del else --%>
    <% } %>
</div>

<div class="alert custom-alert" role="alert" id="myAlert">
    <strong>Holy guacamole!</strong> You should check in on some of those fields below.
    <button type="button" class="btn-close" aria-label="Close"></button>
</div>
