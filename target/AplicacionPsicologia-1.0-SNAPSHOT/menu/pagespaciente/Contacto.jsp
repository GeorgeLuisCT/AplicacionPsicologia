<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="Managers.DatosContactoDAO, models.DatosContacto"%>
<%@ page import="models.Cita, Managers.CitaDAO, models.Usuario" %>


<%
    String infoBoton = "EDITAR"; 
%>

<% 
  int idUsuario = 0;
  Usuario usuario = null;
  usuario = (Usuario) session.getAttribute("usuario");
  if (usuario != null) {
    idUsuario = usuario.getId();
  }
%>
<style>
    .floating-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 999;
    }
    .panel-editar {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 300px;
        background-color: #f8f9fa;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
     /* Estilos personalizados para el formulario "Datos de Contacto" */
    .col-md-6.offset-md-3 {
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 30px;
        background-color: #150578;
    }
    h5, h3{
        color: #0E0E52;
    }

    .card-title {
        font-size: 28px;
        text-align: center;
        margin-bottom: 20px;
    }

    .panel-editar label{
        color: #0E0E52;
    }

    label {
        font-weight: bold;
    
    }

    .form-control {
        border-radius: 5px;
        border-color: #ccc;
        background-color: #f7f7f7;
        color: #333;
    }

    .form-control:read-only {
        background-color: #f7f7f7;
        cursor: not-allowed;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        font-weight: bold;
        padding: 10px 30px;
        margin-top: 20px;
        width: 100%;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    body {
                        background-image: url("../public/images/fonndos/circle-scatter-haikei1.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: aliceblue;
                    }
</style>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h1 class="text-center">Datos de Contacto</h1>
            <% 
                DatosContactoDAO gestorDatosContacto = new DatosContactoDAO();
                DatosContacto contacto = null;
                try {
                    contacto = gestorDatosContacto.obtenerContacto(idUsuario); // Reemplaza el 1 con el ID de usuario correspondiente
                } catch (Exception e) {
                    // Manejar la excepción en caso de que no se encuentren los datos de contacto
                }
                if (contacto != null) {
            %>
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" value="<%= contacto.getNombre() %>" readonly>
            </div>
            <div class="form-group">
                <label for="email">Correo electrónico</label>
                <input type="email" class="form-control" id="email" value="<%= contacto.getEmail() %>" readonly>
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono</label>
                <input type="tel" class="form-control" id="telefono" value="<%= contacto.getTelefono() %>" readonly>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" id="direccion" value="<%= contacto.getDireccion() %>" readonly>
            </div>
            <% } else { %>

            <%infoBoton = "AGREGAR";%>
            <p>No se encontraron datos de contacto.</p>
            <% } %>
            <div class="text-center">
                <button class="btn btn-primary" onclick="mostrarPanelEditar()"><%=infoBoton%></button>
            </div>
        </div>
    </div>
</div>

<!-- Panel emergente para editar -->
<div id="panelEditar" class="panel-editar">
    <h3 class="mb-3">Editar Datos de Contacto</h3>
    <form action="/AplicacionPsicologia/GuardarDatosServlet" method="POST">
        <input type="hidden" name="actions" value="contacto">
        <input type="hidden" name="id" value="<%= idUsuario %>">
        <div class="form-group">
            <label for="nombreEditar">Nombre</label>
            <input type="text" class="form-control" id="nombreEditar" name="nombre" value="<%= contacto != null ? contacto.getNombre() : "" %>">
        </div>
        <div class="form-group">
            <label for="emailEditar">Correo electrónico</label>
            <input type="email" class="form-control" id="emailEditar" name="email" value="<%= contacto != null ? contacto.getEmail() : "" %>">
        </div>
        <div class="form-group">
            <label for="telefonoEditar">Teléfono</label>
            <input type="tel" class="form-control" id="telefonoEditar" name="telefono" value="<%= contacto != null ? contacto.getTelefono() : "" %>">
        </div>
        <div class="form-group">
            <label for="direccionEditar">Dirección</label>
            <input type="text" class="form-control" id="direccionEditar" name="direccion" value="<%= contacto != null ? contacto.getDireccion() : "" %>">
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <button type="button" class="btn btn-secondary" onclick="ocultarPanelEditar()">Cancelar</button>
        </div>
    </form>

</div>

<script>
                function mostrarPanelEditar() {
                    document.getElementById('panelEditar').style.display = 'block';
                }

                function ocultarPanelEditar() {
                    document.getElementById('panelEditar').style.display = 'none';
                }
</script>
