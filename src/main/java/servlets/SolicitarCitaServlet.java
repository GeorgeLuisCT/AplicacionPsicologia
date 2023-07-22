package servlets;

import Managers.CitaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import models.Usuario;

public class SolicitarCitaServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros de la solicitud
       
        String accion = request.getParameter("accion");

        int idUsuario = 0;
        Usuario usuario = null;
        HttpSession session = request.getSession();
        usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
            idUsuario = usuario.getId();
        }

        switch (accion) {
            case "solicitar":
                 int idPsicologo = Integer.parseInt(request.getParameter("idPsicologo"));
                CitaDAO cita = new CitaDAO();
                cita.crearCita(idUsuario, idPsicologo);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"mensaje\": \"Cita solicitada\"}");
                break;
            case "editar":
                CitaDAO citaEdit = new CitaDAO();
                int codCita = Integer.parseInt(request.getParameter("citaId"));
                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");
                String estado = request.getParameter("estado");
                citaEdit.editarCita(codCita, fecha, hora, estado);
                 response.getWriter().write("{\"mensaje\": \"Cita editada\"}");
                break;
            case "informacion":
                // Lógica para manejar la acción "Más Información"
                // ...
                break;
            default:
                // Acción desconocida, redirigir a una página de error o realizar otra acción adecuada
                response.sendRedirect("pagina_de_error.jsp");
                break;
        }
    }
}
