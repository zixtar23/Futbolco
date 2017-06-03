package Acceso;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import controlador.consultas;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import modelo.usuarios;

public class DAOUsuario implements Operaciones {

    conexion con = new conexion();

    @Override
    public String crear(Object obj) {
        usuarios usuario = (usuarios) obj;
        String consulta = "insert into usuarios (usuario, ciudad, correo, contrasena, nivel) values (?, ?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, usuario.getUsuario());
            pst.setString(2, usuario.getCiudad());
            pst.setString(3, usuario.getCorreo());
            pst.setString(4, usuario.getContra());
            pst.setInt(5, usuario.getNivel());
            int filas = pst.executeUpdate();
            respuesta = "Usuario creado con exito";
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }
        return respuesta;

    }

    @Override
    public String editar(Object obj) {
        usuarios usuario = (usuarios) obj;
        String consulta = "update usuarios set ciudad=?, correo=? where id_usuario=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, usuario.getCiudad());
            pst.setString(2, usuario.getCorreo());
            pst.setInt(3, usuario.getId_usuario());
            int filas = pst.executeUpdate();
            respuesta = "Usuario Actualizado";
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }
        return respuesta;

    }

    @Override
    public String eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<usuarios> consultar() {
         List<usuarios> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from usuarios";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while(rs.next()) {
                y.add(new usuarios(rs.getInt("id_usuario"),
                        rs.getString("usuario"),
                        rs.getString("ciudad"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getInt("nivel")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }
        }
        return y;
    }

    @Override
    public List<?> filtrar(String tabla, String dato) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<usuarios> autenticar(Object obj) {
        usuarios usuario = (usuarios) obj;
        Connection conn = null;
        ResultSet rs = null;
        List<usuarios> y = new ArrayList<>();
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from usuarios where usuario = ? and contrasena = ?";
            pst = conn.prepareStatement(consulta);
            pst.setString(1, usuario.getUsuario());
            pst.setString(2, usuario.getContra());
            rs = pst.executeQuery();
            if (rs.next()) {
                y.add(new usuarios(rs.getInt("id_usuario"),
                        rs.getString("usuario"),
                        rs.getString("ciudad"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getInt("nivel")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }

        }

        return y;

    }

    public List<usuarios> consultarUsuarioId(int id) {
        List<usuarios> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from usuarios where id_usuario = ? ";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                y.add(new usuarios(rs.getInt("id_usuario"),
                        rs.getString("usuario"),
                        rs.getString("ciudad"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getInt("nivel")));
            }
        } catch (SQLException e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.err.println("Error" + e);
            }
        }
        return y;

    }
    
    public String editarNivel(Object obj) {
        usuarios usuario = (usuarios) obj;
        String consulta = "update usuarios set nivel=? where id_usuario=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, usuario.getNivel());
            pst.setInt(2, usuario.getId_usuario());
            int filas = pst.executeUpdate();
            respuesta = "Nivel Actualizado";
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error" + e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error" + e);
            }
        }
        return respuesta;

    }

//    public static void main(String[] args) {
//        DAOUsuario dao = new DAOUsuario();
////      usuarios u = new usuarios("","","","",3);
////        String usua = "ian";
////        String cont = "1235";
////        String respuesta = dao.crear(u);
////         System.out.println(respuesta);
//        List<usuarios> y = dao.consultar();
//        for (usuarios usu : y) {
//            System.out.println(usu.getId_usuario()+usu.getUsuario()+usu.getCiudad()+usu.getCorreo()+usu.getContra()+usu.getNivel());
//            
//        }
//
//    }
}
