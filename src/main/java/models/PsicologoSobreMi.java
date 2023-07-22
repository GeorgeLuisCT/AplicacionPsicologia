
package models;

public class PsicologoSobreMi {
    private int id;
  private String sobreMi;
  private String experiencia;
  private String especialidad;
  private String consultas;
  private String contactar;
  private float calificaciones;
  private String rutaImagen;

  public PsicologoSobreMi(int id, String sobreMi, String experiencia, String especialidad, String consultas, String contactar, float calificaciones, String rutaImagen) {
    this.id = id;
    this.sobreMi = sobreMi;
    this.experiencia = experiencia;
    this.especialidad = especialidad;
    this.consultas = consultas;
    this.contactar = contactar;
    this.calificaciones = calificaciones;
     this.rutaImagen = rutaImagen;
  }

    public PsicologoSobreMi(int id, String sobreMi, String experiencia, String especialidad, String consultas, String contactar) {
        this.id = id;
        this.sobreMi = sobreMi;
        this.experiencia = experiencia;
        this.especialidad = especialidad;
        this.consultas = consultas;
        this.contactar = contactar;
    }
  
  

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getSobreMi() {
    return sobreMi;
  }

  public void setSobreMi(String sobreMi) {
    this.sobreMi = sobreMi;
  }

  public String getExperiencia() {
    return experiencia;
  }

  public void setExperiencia(String experiencia) {
    this.experiencia = experiencia;
  }

  public String getEspecialidad() {
    return especialidad;
  }

  public void setEspecialidad(String especialidad) {
    this.especialidad = especialidad;
  }

  public String getConsultas() {
    return consultas;
  }

  public void setConsultas(String consultas) {
    this.consultas = consultas;
  }

  public String getContactar() {
    return contactar;
  }

  public void setContactar(String contactar) {
    this.contactar = contactar;
  }

  public float getOpiniones() {
    return calificaciones;
  }

  public void setOpiniones(float calificaciones) {
    this.calificaciones = calificaciones;
  }
    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }
    
  
}
