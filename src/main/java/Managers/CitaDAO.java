
package Managers;

import database.ConnectionMySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Cita;

public class CitaDAO {
    
    // Método para crear una nueva cita
    public void crearCita(int idPaciente, int idPsicologo) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            ConnectionMySQL cn = new ConnectionMySQL();
            conn = cn.getConnection();
            
            String sql = "INSERT INTO citas (paciente_id, psicologo_id) VALUES (?, ?)";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idPaciente);
            stmt.setInt(2, idPsicologo);
            
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            // Manejar la excepción
            e.printStackTrace();
        } finally {
            // Cerrar las conexiones y liberar los recursos
            try {
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
    }
    
    // Método para editar una cita existente
    public void editarCita(int idCita, String fecha, String hora, String estado) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            ConnectionMySQL cn = new ConnectionMySQL();
            conn = cn.getConnection();
            
            String sql = "UPDATE citas SET fecha = ?, hora = ?, estado = ? WHERE id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, fecha);
            stmt.setString(2, hora);
            stmt.setString(3, estado);
            stmt.setInt(4, idCita);
            
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            // Manejar la excepción
            e.printStackTrace();
        } finally {
            // Cerrar las conexiones y liberar los recursos
            try {
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
    }
    
    // Método para obtener todas las citas de un paciente
    public List<Cita> obtenerCitasPaciente(int idPaciente) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Cita> citas = new ArrayList<>();
        
        try {
            ConnectionMySQL cn = new ConnectionMySQL();
            conn = cn.getConnection();
            
            String sql = "SELECT citas.*, usuarios.nombre AS nombre FROM citas JOIN usuarios ON citas.psicologo_id = usuarios.id WHERE citas.paciente_id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idPaciente);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int idCita = rs.getInt("id");
                int idPsicologo = rs.getInt("psicologo_id");
                String fecha = rs.getString("fecha");
                String hora = rs.getString("hora");
                String estado = rs.getString("estado");
                 String nombre = rs.getString("nombre");
                
                Cita cita = new Cita(idCita, idPaciente, idPsicologo, fecha, hora, estado, nombre);
                citas.add(cita);
            }
            
        } catch (SQLException e) {
            // Manejar la excepción
            

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
        
        return citas;
    }
    
    // Método para obtener todas las citas de un psicólogo
    public List<Cita> obtenerCitasPsicologo(int idPsicologo) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Cita> citas = new ArrayList<>();
        
        try {
            ConnectionMySQL cn = new ConnectionMySQL();
            conn = cn.getConnection();
            
            String sql = "SELECT citas.*, datos_contacto.nombre AS nombre FROM citas JOIN datos_contacto ON citas.paciente_id = datos_contacto.id WHERE citas.psicologo_id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idPsicologo);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int idCita = rs.getInt("id");
                int idPaciente = rs.getInt("paciente_id");
                String fecha = rs.getString("fecha");
                String hora = rs.getString("hora");
                String estado = rs.getString("estado");
                String nombre = rs.getString("nombre");
                
                Cita cita = new Cita(idCita, idPaciente, idPsicologo, fecha, hora, estado, nombre);
                citas.add(cita);
            }
            
        } catch (SQLException e) {
            // Manejar la excepción
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
        
        return citas;
    }
}
