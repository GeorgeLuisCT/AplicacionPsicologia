package servlets;

import Managers.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import models.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.obtenerUsuario(email, contrasena);
        System.out.println("email y contraseña que me llego" + email + " " + contrasena);
        System.out.println(usuario);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            // Redireccionar a la página correspondiente según el tipo de usuario
            switch (usuario.getTipo()) {
                case "paciente":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"redirect\": \"/AplicacionPsicologia/menu/paciente.jsp\"}");
                    break;
                case "psicologo":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"redirect\": \"/AplicacionPsicologia/menu/psicologo.jsp\"}");
                    break;
                default:
                    break;
            }

        } else {
            // Mostrar mensaje de error si las credenciales son inválidas
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"mensaje\": \"Credenciales inválidas\"}");
        }
    }
}
