package models;

public class InfoBasicaPsicologo {

    private int id;
    private String nombre;
    private float calificacion;
    private String direccionImagen;

    public InfoBasicaPsicologo(int id, String nombre, float calificacion, String direccionImagen) {
        this.id = id;
        this.nombre = nombre;
        this.calificacion = calificacion;
        this.direccionImagen = direccionImagen;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public String getDireccionImagen() {
        return direccionImagen;
    }
    
    
}
