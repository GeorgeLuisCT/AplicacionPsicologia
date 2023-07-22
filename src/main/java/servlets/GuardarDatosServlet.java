package servlets;

import Managers.DatosContactoDAO;
import Managers.PsicologoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.*;

public class GuardarDatosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("actions");
            int id = Integer.parseInt(request.getParameter("id"));

        switch (action) {
            case "contacto":
            
                String nombre = request.getParameter("nombre");
                String email = request.getParameter("email");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");

                DatosContactoDAO datosContactoDAO = new DatosContactoDAO();

                System.out.println(nombre + email);

                DatosContacto contacto = new DatosContacto(id, nombre, email, telefono, direccion);

                datosContactoDAO.registrarOActualizarContacto(contacto);
                
                 response.sendRedirect("/AplicacionPsicologia/menu/paciente.jsp");
                break;
            case "sobremi":
                String sobreMi = request.getParameter("sobreMi");
                String experiencia = request.getParameter("experiencia");
                String especialidad = request.getParameter("especialidad");
                String consultas = request.getParameter("consultas");
                String contactar = request.getParameter("contactar");
                PsicologoDAO psicologoDAO = new PsicologoDAO();
                PsicologoSobreMi psicolgo = new PsicologoSobreMi(id, sobreMi, experiencia, especialidad, consultas, contactar);
                
                psicologoDAO.insertarMasInformacion(psicolgo);
                 response.sendRedirect("/AplicacionPsicologia/menu/psicologo.jsp");
                case "calificar":
                 float calificacion = Float.parseFloat( request.getParameter("calificacion"));
                 
                 PsicologoDAO psicologoDAO1 = new PsicologoDAO();
                  psicologoDAO1.actualizarCalificacion(id, calificacion);
                 break;
                
            default:
                throw new AssertionError();
        }

    }
}
