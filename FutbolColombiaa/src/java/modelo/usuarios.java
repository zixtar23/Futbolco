package modelo;

/**
 *
 * @author IAN
 */
public class usuarios {
    
    private int id_usuario;
    private String usuario;
    private String ciudad;    
    private String correo;
    private String contra;
    private int nivel;
    

    public usuarios() {
    }

    public usuarios(int id_usuario, String usuario, String ciudad, String correo, String contra, int nivel) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.ciudad = ciudad;
        this.correo = correo;
        this.contra = contra;
        this.nivel = nivel;
    }


    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }


    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }



    
}
