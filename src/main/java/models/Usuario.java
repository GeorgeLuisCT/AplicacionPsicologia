
package models;

public class Usuario {
  private int id;
  private String nombre;
  private String email;
  private String contraseña;
  private String tipo;

    public Usuario() {
    }

    public Usuario(int id, String nombre, String email, String contraseña, String tipo) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.contraseña = contraseña;
        this.tipo = tipo;
    }

    public Usuario(String nombre, String email, String contraseña, String tipo) {
        this.nombre = nombre;
        this.email = email;
        this.contraseña = contraseña;
        this.tipo = tipo;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }


}
