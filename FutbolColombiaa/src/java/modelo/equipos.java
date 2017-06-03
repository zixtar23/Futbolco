package modelo;


public class equipos {
    private int id;
    private String nombre;
    private String estadio;
    private int fecha_fundacion;
    private String path;

    public equipos() {
    }

    public equipos(int id, String nombre, String estadio, int fecha_fundacion, String path) {
        this.id = id;
        this.nombre = nombre;
        this.estadio = estadio;
        this.fecha_fundacion = fecha_fundacion;
        this.path = path;
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

    public String getEstadio() {
        return estadio;
    }

    public void setEstadio(String estadio) {
        this.estadio = estadio;
    }

    public int getFecha_fundacion() {
        return fecha_fundacion;
    }

    public void setFecha_fundacion(int fecha_fundacion) {
        this.fecha_fundacion = fecha_fundacion;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    



    
}
