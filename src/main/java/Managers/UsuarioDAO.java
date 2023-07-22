package Managers;

import database.ConnectionMySQL;
import java.sql.*;
import models.Paciente;
import models.Psicologo;
import models.Usuario;

public class UsuarioDAO {

    public Usuario obtenerUsuario(String email, String contrasena) {
        Usuario usuario = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            ConnectionMySQL conection = new ConnectionMySQL();
            conn = conection.getConnection();
            String query = "SELECT * FROM usuarios WHERE email = ? AND contrasena = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, contrasena);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String tipo = rs.getString("tipo");
                
                System.out.println("el nombre obtenido es: " + nombre + "el tipo es: " + tipo + "el id es: " + id);

                if (tipo.equals("paciente")) {
                    // Obtener datos adicionales de la tabla datos_pacientes
                    String queryPaciente = "SELECT * FROM datos_pacientes WHERE id = ?";
                    PreparedStatement stmtPaciente = conn.prepareStatement(queryPaciente);
                    stmtPaciente.setInt(1, id);
                    ResultSet rsPaciente = stmtPaciente.executeQuery();

                    if (rsPaciente.next()) {
                        int edad = rsPaciente.getInt("edad");
                        String genero = rsPaciente.getString("genero");
                        usuario = new Paciente(id, nombre, email, contrasena, tipo, edad, genero);
                        System.out.println("el paciente es: " + usuario);
                    }
                } else if (tipo.equals("psicologo")) {
                    // Obtener datos adicionales de la tabla datos_psicologos
                    String queryPsicologo = "SELECT * FROM datos_psicologos WHERE id = ?";
                    PreparedStatement stmtPsicologo = conn.prepareStatement(queryPsicologo);
                    stmtPsicologo.setInt(1, id);
                    ResultSet rsPsicologo = stmtPsicologo.executeQuery();

                    if (rsPsicologo.next()) {
                        String especialidad = rsPsicologo.getString("especialidad");
                        int experiencia = rsPsicologo.getInt("experiencia");
                        usuario = new Psicologo(id, nombre, email, contrasena, tipo, especialidad, experiencia);
                        System.out.println("el psicologo es: " + usuario);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("error");
        } finally {
            // Cerrar conexiones y liberar recursos
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

        return usuario;
    }

    public boolean registrarUsuario(Usuario usuario) {
    boolean registrado = false;
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        ConnectionMySQL conection = new ConnectionMySQL();
        conn = conection.getConnection();
        String query = "INSERT INTO usuarios (nombre, email, contrasena, tipo) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, usuario.getNombre());
        stmt.setString(2, usuario.getEmail());
        stmt.setString(3, usuario.getContraseña());
        stmt.setString(4, usuario.getTipo());

        int filasAfectadas = stmt.executeUpdate();
        if (filasAfectadas > 0) {
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int usuarioId = generatedKeys.getInt(1);
                    if (usuario instanceof Paciente) {
                        Paciente paciente = (Paciente) usuario;
                        // Insertar datos adicionales del paciente en la tabla "datos_pacientes"
                        String pacienteQuery = "INSERT INTO datos_pacientes (id, edad, genero) VALUES (?, ?, ?)";
                        try (PreparedStatement pacienteStmt = conn.prepareStatement(pacienteQuery)) {
                            pacienteStmt.setInt(1, usuarioId);
                            pacienteStmt.setInt(2, paciente.getEdad());
                            pacienteStmt.setString(3, paciente.getGenero());
                            pacienteStmt.executeUpdate();
                        }
                    } else if (usuario instanceof Psicologo) {
                        Psicologo psicologo = (Psicologo) usuario;
                        // Insertar datos adicionales del psicólogo en la tabla "datos_psicologos"
                        String psicologoQuery = "INSERT INTO datos_psicologos (id, especialidad, experiencia) VALUES (?, ?, ?)";
                        try (PreparedStatement psicologoStmt = conn.prepareStatement(psicologoQuery)) {
                            psicologoStmt.setInt(1, usuarioId);
                            psicologoStmt.setString(2, psicologo.getEspecialidad());
                            psicologoStmt.setInt(3, psicologo.getExperiencia());
                            psicologoStmt.executeUpdate();
                        }
                    }
                    registrado = true;
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Cerrar conexiones y liberar recursos
        // ...
    }
    
    return registrado;
}

}
