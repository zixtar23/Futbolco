package Acceso;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.jugadores;
import modelo.usuarios;

public class DAOJugador implements Operaciones {

    conexion con = new conexion();

    @Override
    public String crear(Object obj) {
        jugadores jugador = (jugadores) obj;
        String consulta = "insert into jugadores (equipo, posicion, nombres, apellidos, pais) values (?, ?, ?, ?, ?)";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, jugador.getEquipo());
            pst.setString(2, jugador.getPosicion());
            pst.setString(3, jugador.getNombres());
            pst.setString(4, jugador.getApellidos());
            pst.setString(5, jugador.getPais());
            int filas = pst.executeUpdate();
            respuesta = "Jugador creado con exito";
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
        jugadores jugador = (jugadores) obj;
        String consulta = "update jugadores set equipo=?, posicion=?, nombres=?, apellidos=?, pais=? where id=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setString(1, jugador.getEquipo());
            pst.setString(2, jugador.getPosicion());
            pst.setString(3, jugador.getNombres());
            pst.setString(4, jugador.getApellidos());
            pst.setString(5, jugador.getPais());
            pst.setInt(6, jugador.getId());

            int filas = pst.executeUpdate();
            respuesta = "Jugador Actualizado";
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
        jugadores jugador = (jugadores) obj;
        String consulta = "delete from jugadores where id=?";
        String respuesta = "";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, jugador.getId());
            int row = pst.executeUpdate();
            respuesta = "Jugador Eliminado" + row ;
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
    public List<jugadores> consultar() {
        List<jugadores> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from jugadores";
            pst = conn.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                y.add(new jugadores(rs.getInt("id"),
                        rs.getString("equipo"),
                        rs.getString("posicion"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("pais")));
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

    public List<jugadores> consultarJugadorId(Object obj) {
        jugadores jugador = (jugadores) obj;
        List<jugadores> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from jugadores where id = ? ";
            pst = conn.prepareStatement(consulta);
            pst.setInt(1, jugador.getId());
            rs = pst.executeQuery();
            if (rs.next()) {
                y.add(new jugadores(rs.getInt("id"),
                        rs.getString("equipo"),
                        rs.getString("posicion"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("pais")));
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
    
    public List<jugadores> consultarJugadorEquipo(String equipo) {
        List<jugadores> y = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            conn = con.getconexion();
            String consulta = "select * from jugadores where equipo = ? ";
            pst = conn.prepareStatement(consulta);
            pst.setString(1, equipo);
            rs = pst.executeQuery();
            if (rs.next()) {
                y.add(new jugadores(rs.getInt("id"),
                        rs.getString("equipo"),
                        rs.getString("posicion"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("pais")));
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

}
