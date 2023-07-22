
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMySQL {
    private Connection connection = null;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/apppsicologia", "root", "JorgeCT19");
        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el controlador de la base de datos: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error al establecer la conexión con la base de datos: " + e.getMessage());
        }
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión con la base de datos: " + e.getMessage());
        }
    }
}

