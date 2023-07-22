package Managers;

import database.ConnectionMySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.InfoBasicaPsicologo;
import models.PsicologoSobreMi;

public class PsicologoDAO {

    public List<InfoBasicaPsicologo> obtenerPsicologos() {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    List<InfoBasicaPsicologo> psicologos = new ArrayList<>();

    try {
        ConnectionMySQL cn = new ConnectionMySQL();
        conn = cn.getConnection();

        // Consulta SQL para obtener el nombre y la calificación de todos los psicólogos
        String sql = "SELECT u.id, u.nombre, mi.calificacion, mi.rutaImgen " +
                "FROM usuarios u " +
                "LEFT JOIN mas_informacion mi ON u.id = mi.id " +
                "WHERE u.tipo = 'psicologo'";

        // Preparar la consulta
        stmt = conn.prepareStatement(sql);

        // Ejecutar la consulta
        rs = stmt.executeQuery();

        // Obtener los datos de cada psicólogo y agregarlos a la lista
        while (rs.next()) {
            int id = rs.getInt("id");
            String nombre = rs.getString("nombre");
            float calificacion = rs.getFloat("calificacion");
            String ruta = rs.getString("rutaImgen");

            InfoBasicaPsicologo psicologo = new InfoBasicaPsicologo(id, nombre, calificacion, ruta);
            psicologos.add(psicologo);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Cerrar las conexiones y liberar los recursos
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return psicologos;
}

    public PsicologoSobreMi ObtenerMasInformacion(int id) {
        ConnectionMySQL connectionManager = new ConnectionMySQL();
        Connection connection = connectionManager.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        PsicologoSobreMi masInformacion = null;

        try {
            String query = "SELECT * FROM mas_informacion WHERE id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String sobreMi = resultSet.getString("sobre_mi");
                String experiencia = resultSet.getString("experiencia");
                String especialidad = resultSet.getString("especialidad");
                String consultas = resultSet.getString("consultas");
                String contactar = resultSet.getString("contactar");
                float calificaciones = resultSet.getFloat("calificacion");
                String ruta = resultSet.getString("rutaImgen");

                masInformacion = new PsicologoSobreMi(id, sobreMi, experiencia, especialidad, consultas, contactar, calificaciones,ruta );
                
                System.out.println(masInformacion);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener los datos de la tabla 'mas_informacion': " + e.getMessage());
        } finally {
            // Cerrar el ResultSet, el Statement y la conexión
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            connectionManager.closeConnection();
        }

        return masInformacion;
    }

    public void insertarMasInformacion(PsicologoSobreMi masInformacion) {
        PreparedStatement statement = null;
        ConnectionMySQL connectionManager = new ConnectionMySQL();
        Connection connection = connectionManager.getConnection();

        try {
            // Verificar si el registro ya existe
            if (existeMasInformacion(masInformacion.getId())) {
                // El registro ya existe, actualizar los datos
                String sql = "UPDATE mas_informacion SET sobre_mi=?, experiencia=?, especialidad=?, consultas=?, contactar=? WHERE id=?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, masInformacion.getSobreMi());
                statement.setString(2, masInformacion.getExperiencia());
                statement.setString(3, masInformacion.getEspecialidad());
                statement.setString(4, masInformacion.getConsultas());
                statement.setString(5, masInformacion.getContactar());
                statement.setInt(6, masInformacion.getId());
            } else {
                // El registro no existe, insertar los datos
                String sql = "INSERT INTO mas_informacion (id, sobre_mi, experiencia, especialidad, consultas, contactar, opiniones) VALUES (?, ?, ?, ?, ?, ?)";
                statement = connection.prepareStatement(sql);
                statement.setInt(1, masInformacion.getId());
                statement.setString(2, masInformacion.getSobreMi());
                statement.setString(3, masInformacion.getExperiencia());
                statement.setString(4, masInformacion.getEspecialidad());
                statement.setString(5, masInformacion.getConsultas());
                statement.setString(6, masInformacion.getContactar());
            }

            // Ejecutar la consulta
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar el PreparedStatement
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            connectionManager.closeConnection();
        }
    }
    
    public boolean existeMasInformacion(int id) {
    boolean existe = false;
    PreparedStatement statement = null;
    ConnectionMySQL connectionManager = new ConnectionMySQL();
    Connection connection = connectionManager.getConnection();

    try {
        // Preparar la consulta SQL
        String sql = "SELECT COUNT(*) FROM mas_informacion WHERE id = ?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, id);

        // Ejecutar la consulta
        ResultSet resultSet = statement.executeQuery();

        // Verificar si se encontró el registro
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            existe = (count > 0);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Cerrar el PreparedStatement
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        connectionManager.closeConnection();
    }

    return existe;
}
    
     public void actualizarCalificacion(int id, float nuevaCalificacion) {
         ConnectionMySQL connectionMySQL = new ConnectionMySQL();
        if (nuevaCalificacion < 0 || nuevaCalificacion > 5) {
            System.out.println("La calificación debe estar entre 0 y 5.");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Obtener la conexión a la base de datos
            conn = connectionMySQL.getConnection();

            // Obtener la calificación actual
            String query = "SELECT calificacion FROM mas_informacion WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                float calificacionActual = rs.getFloat("calificacion");
                // Calcular el promedio entre la calificación actual y la nueva calificación
                float promedio = (calificacionActual + nuevaCalificacion) / 2;

                // Actualizar la calificación en la base de datos
                String updateQuery = "UPDATE mas_informacion SET calificacion = ? WHERE id = ?";
                stmt = conn.prepareStatement(updateQuery);
                stmt.setFloat(1, promedio);
                stmt.setInt(2, id);
                stmt.executeUpdate();

                System.out.println("Calificación actualizada exitosamente.");
            } else {
                System.out.println("No se encontró ningún registro con el ID especificado.");
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar la calificación: " + e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
                connectionMySQL.closeConnection();
            } catch (SQLException e) {
                System.out.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }
    }


}
