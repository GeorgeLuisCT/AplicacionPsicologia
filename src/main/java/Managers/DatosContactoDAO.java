package Managers;

import database.ConnectionMySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.DatosContacto;

public class DatosContactoDAO {

    private ConnectionMySQL connectionMySQL;

    public DatosContactoDAO() {
        connectionMySQL = new ConnectionMySQL();
    }

    public void registrarOActualizarContacto(DatosContacto contacto) {
    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Obtener la conexión a la base de datos
        connection = connectionMySQL.getConnection();

        // Verificar si el contacto ya existe en la base de datos
        DatosContacto contactoExistente = obtenerContacto(contacto.getId());

        if (contactoExistente != null) {
            System.out.println("se proceso a actulizar los datos");
            // El contacto ya existe, actualizar los datos
            String sql = "UPDATE datos_contacto SET nombre=?, email=?, telefono=?, direccion=? WHERE id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, contacto.getNombre());
            statement.setString(2, contacto.getEmail());
            statement.setString(3, contacto.getTelefono());
            statement.setString(4, contacto.getDireccion());
            statement.setInt(5, contacto.getId());
        } else {
            // El contacto no existe, insertar los datos
            String sql = "INSERT INTO datos_contacto (id, nombre, email, telefono, direccion) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, contacto.getId());
            statement.setString(2, contacto.getNombre());
            statement.setString(3, contacto.getEmail());
            statement.setString(4, contacto.getTelefono());
            statement.setString(5, contacto.getDireccion());
        }

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
            connectionMySQL.closeConnection();
        }
    }
}


    public DatosContacto obtenerContacto(int id) {
        DatosContacto contacto = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Obtener la conexión a la base de datos
            connection = connectionMySQL.getConnection();

            // Preparar la consulta SQL
            String sql = "SELECT * FROM datos_contacto WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            // Ejecutar la consulta
            resultSet = statement.executeQuery();

            // Verificar si se encontró un contacto con el ID proporcionado
            if (resultSet.next()) {
                contacto = new DatosContacto();
                contacto.setId(resultSet.getInt("id"));
                contacto.setNombre(resultSet.getString("nombre"));
                contacto.setEmail(resultSet.getString("email"));
                contacto.setTelefono(resultSet.getString("telefono"));
                contacto.setDireccion(resultSet.getString("direccion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
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
            if (connection != null) {
                connectionMySQL.closeConnection();
            }
        }

        return contacto;
    }
    
    public List<DatosContacto> obtenerDatosContactoPorPsicologo(int idPsicologo) {
        List<DatosContacto> listaContactos = new ArrayList<>();
        ConnectionMySQL connectionManager = new ConnectionMySQL();
        Connection connection = connectionManager.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Preparar la consulta SQL
            String sql = "SELECT dp.id,dc.nombre, dc.email, dc.telefono, dc.direccion "
                    + "FROM datos_pacientes dp LEFT JOIN datos_contacto dc ON dp.id = dc.id "
                    + "LEFT JOIN citas c ON c.paciente_id = dp.id AND c.psicologo_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, idPsicologo);

            // Ejecutar la consulta
            resultSet = statement.executeQuery();

            // Recorrer los resultados y crear objetos DatosContacto
            while (resultSet.next()) {
                DatosContacto contacto = new DatosContacto();
                contacto.setId(resultSet.getInt("id"));
                contacto.setNombre(resultSet.getString("nombre"));
                contacto.setEmail(resultSet.getString("email"));
                contacto.setTelefono(resultSet.getString("telefono"));
                contacto.setDireccion(resultSet.getString("direccion"));
                listaContactos.add(contacto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
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

        return listaContactos;
    }
}
