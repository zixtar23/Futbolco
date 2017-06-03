package Acceso;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.equipos;

public class DAOEquipo implements Operaciones{

    conexion con = new conexion();
    
    @Override
    public String crear(Object obj) {
        
        equipos equipo = (equipos) obj;
        String consulta = "insert into equipos (nombre, estadio, año, path) values (?,?,?,?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, equipo.getNombre());
            pst.setString(2, equipo.getEstadio());
            pst.setInt(3, equipo.getFecha_fundacion());
            pst.setString(4, equipo.getPath());
            int filas = pst.executeUpdate();
            respuesta = "Equipo creado con exito";
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
        public List<equipos> consultar () {
        List<equipos> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from equipos";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new equipos(rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("estadio"),
                        rs.getInt("año"),
                        rs.getString("path")));
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
        

        public List<equipos> consultarID (int id) {
        List<equipos> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from equipos where id=?";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new equipos(rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("estadio"),
                        rs.getInt("año"),
                        rs.getString("path")));
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
    public String editar(Object obj) {
          equipos equipo = (equipos) obj;
        String consulta = "update equipos set nombre=?, estadio=?, año=?, path=? where id=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, equipo.getNombre());
            pst.setString(2, equipo.getEstadio());
            pst.setInt(3, equipo.getFecha_fundacion());
            pst.setString(4, equipo.getPath());
            int filas = pst.executeUpdate();
            respuesta = "Equipo Actualizado";
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
    public List<?> filtrar(String tabla, String dato) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
