package models;

public class Psicologo extends Usuario {

    private String especialidad;
    private int experiencia;

    public Psicologo() {
    }

    public Psicologo(String especialidad, int experiencia) {
        this.especialidad = especialidad;
        this.experiencia = experiencia;
    }
    
    public Psicologo(int id, String nombre, String email, String contraseña, String tipo, String especialidad, int experiencia) {
    super(id, nombre, email, contraseña, tipo);
    this.especialidad = especialidad;
    this.experiencia = experiencia;
  }
    
    public Psicologo( String nombre, String email, String contraseña, String tipo, String especialidad, int experiencia) {
    super(nombre, email, contraseña, tipo);
    this.especialidad = especialidad;
    this.experiencia = experiencia;
  }

    
    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(int experiencia) {
        this.experiencia = experiencia;
    }

    
}
