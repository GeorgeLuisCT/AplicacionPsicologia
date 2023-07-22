
package models;


public class Paciente extends Usuario {
  private int edad;
  private String genero;

    public Paciente() {
    }

    public Paciente(int edad, String genero) {
        this.edad = edad;
        this.genero = genero;
    }

  public Paciente(int id, String nombre, String email, String contraseña, String tipo, int edad, String genero) {
    super(id, nombre, email, contraseña, tipo);
    this.edad = edad;
    this.genero = genero;
  }
  
  public Paciente( String nombre, String email, String contraseña, String tipo, int edad, String genero) {
    super(nombre, email, contraseña, tipo);
    this.edad = edad;
    this.genero = genero;
  }
  
    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }


}