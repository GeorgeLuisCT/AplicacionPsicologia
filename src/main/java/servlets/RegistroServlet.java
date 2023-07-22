package servlets;

import Managers.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import models.Paciente;
import models.Psicologo;
import models.Usuario;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contrasena");
        String tipo = request.getParameter("tipo");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        
        switch (tipo) {
            case "paciente":
                int edad = Integer.parseInt(request.getParameter("edad"));
                String genero = request.getParameter("genero");
                registrarPaciente(usuarioDAO, nombre, email, contraseña, tipo, edad, genero);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"redirect\": \"/AplicacionPsicologia/authentication/loginPaciente.jsp\"}");
                break;
            case "psicologo":
                String especialidad = request.getParameter("especialidad");
                int experiencia = Integer.parseInt(request.getParameter("experiencia"));
                System.out.println("experiencia " + experiencia + "especialidad " + especialidad);
                System.out.println(request.getParameter("experiencia"));
                registrarPsicologo(usuarioDAO, nombre, email, contraseña, tipo, especialidad, experiencia);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"redirect\": \"/AplicacionPsicologia/authentication/loginPsicologo.jsp\"}");
                break;
            default:
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<p>Credenciales inválidas</p>");
                break;
        }
    }

    private void registrarPaciente(UsuarioDAO usuarioDAO, String nombre, String email, String contraseña, String tipo, int edad, String genero) {
        Usuario usuario = new Paciente(nombre, email, contraseña, tipo, edad, genero);
        usuarioDAO.registrarUsuario(usuario);

    }

    private void registrarPsicologo(UsuarioDAO usuarioDAO, String nombre, String email, String contraseña, String tipo, String especialidad, int experiencia) {
        Usuario usuario = new Psicologo(nombre, email, contraseña, tipo, especialidad, experiencia);
        usuarioDAO.registrarUsuario(usuario);

    }
}
