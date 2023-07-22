
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Managers.DatosContactoDAO, models.DatosContacto"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Usuario" %>

<% 
  int idUsuario = 0;
  Usuario usuario = null;
  usuario = (Usuario) session.getAttribute("usuario");
  if (usuario != null) {
    idUsuario = usuario.getId();
  }
%>

<style>
    /* Estilos personalizados para la tabla "Lista de Datos de Contacto" */
    .table {
        margin-top: 20px;
        border-collapse: separate;
        border-spacing: 0;
        width: 100%;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    body {
                        background-image: url("../public/images/fonndos/stacked-steps-haikei.svg");
                        background-repeat: unset;
                        background-size: cover;
                        color: aliceblue;
                    }

    .table th,
    .table td {
        padding: 12px;
        text-align: center;
    }

    .table th {
        background-color: #007bff;
        color: #ddd;
        font-weight: bold;
        text-transform: uppercase;
    }

    .table td {
        background-color: #f7f7f7;
        border-bottom: 1px solid #ccc;
    }

    .table tbody tr:nth-child(even) td {
        background-color: #ebebeb;
    }

    .table tbody tr:hover td {
        background-color: #ddd;
    }

    .table .edit-icon {
        font-size: 18px;
        color: #3366cc;
        cursor: pointer;
    }

    .table .edit-icon:hover {
        color: #235daa;
    }
</style>


<div class="container">
    <h1 class="text-center">Lista de Datos de Contacto</h1>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Teléfono</th>
                <th>Dirección</th>
            </tr>
        </thead>
        <tbody>
            <% 
DatosContactoDAO gestorDatosContacto = new DatosContactoDAO();
int idPsicologo = idUsuario; 
List<DatosContacto> listaContactos = gestorDatosContacto.obtenerDatosContactoPorPsicologo(idPsicologo);

for (DatosContacto contacto : listaContactos) {
            %>
            <tr>
                <td><%= (contacto.getId() != 0) ? contacto.getId() : "No disponible" %></td>
                <td><%= (contacto.getNombre() != null) ? contacto.getNombre() : "No disponible" %></td>
                <td><%= (contacto.getEmail() != null) ? contacto.getEmail() : "No disponible" %></td>
                <td><%= (contacto.getTelefono() != null) ? contacto.getTelefono() : "No disponible" %></td>
                <td><%= (contacto.getDireccion() != null) ? contacto.getDireccion() : "No disponible" %></td>
            </tr>
            <% } %>

        </tbody>
    </table>
</div>
