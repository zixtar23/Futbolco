package modelo;

public class jugadores {

    private int id;
    private String equipo;
    private String posicion;
    private String nombres;
    private String apellidos;
    private String pais;

    public jugadores() {
    }

    public jugadores(int id, String equipo, String posicion, String nombres, String apellidos, String pais) {
        this.id = id;
        this.equipo = equipo;
        this.posicion = posicion;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.pais = pais;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }
    
    
}
