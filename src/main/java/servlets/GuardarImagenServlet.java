package servlets;

import database.ConnectionMySQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Usuario;

public class GuardarImagenServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException {

    // Obtener la ruta de la imagen desde los parámetros de la solicitud
    String ruta = request.getParameter("direccionImagen");

    System.out.println(ruta);
    int idUsuario = 0;
    Usuario usuario = null;
    HttpSession session = request.getSession();
    usuario = (Usuario) session.getAttribute("usuario");
    if (usuario != null) {
        idUsuario = usuario.getId();
    }

    try {
        // Actualizar la propiedad rutaImagen en la tabla mas_informacion para el psicólogo específico
        actualizarRutaImagen(idUsuario, ruta);
    } catch (SQLException ex) {
        Logger.getLogger(GuardarImagenServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

    System.out.println("¡La imagen se guardó correctamente!"); // Imprimir mensaje en la consola del navegador
}


    private void actualizarRutaImagen(int idPsicologo, String ruta) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Obtener la conexión a la base de datos
            ConnectionMySQL connectionManager = new ConnectionMySQL();
            connection = connectionManager.getConnection();

            // Preparar la consulta SQL para actualizar la propiedad rutaImgen
            String sql = "UPDATE mas_informacion SET rutaImgen = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, ruta);
            statement.setInt(2, idPsicologo);

            // Ejecutar la consulta
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}

