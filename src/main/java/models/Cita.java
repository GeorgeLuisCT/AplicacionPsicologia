
package models;

public class Cita {
    private int id;
    private int pacienteId;
    private int psicologoId;
    private String fecha = "Sin definir";
    private String hora = "Sin definir";
    private String estado;
    private String Nombre;

    public Cita(int id, int pacienteId, int psicologoId, String fecha, String hora, String estado, String Nombre ) {
        this.id = id;
        this.pacienteId = pacienteId;
        this.psicologoId = psicologoId;
        this.fecha = fecha;
        this.hora = hora;
        this.estado = estado;
         this.Nombre = Nombre;
    }

    public int getId() {
        return id;
    }

    public int getPacienteId() {
        return pacienteId;
    }

    public int getPsicologoId() {
        return psicologoId;
    }

    public String getFecha() {
        return fecha;
    }

    public String getHora() {
        return hora;
    }

    public String getEstado() {
        return estado;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    
}
