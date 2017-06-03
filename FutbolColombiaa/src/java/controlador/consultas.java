/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Acceso.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author IAN
 */
public class consultas extends conexion {

    public boolean autenticacion(String usuario, String contraseña) {
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String consulta = "select * from usuarios where usuario = ? and contrasena = ?";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
        } finally {
            try {
                if (getconexion() != null) {
                    getconexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.err.println("Error" + e);
            }

        }

        return false;
    }

    public boolean registrar(String usuario, String ciudad, String correo, String contraseña, int nivel) {
        PreparedStatement pst = null;
        try {
            String consulta = "insert into usuarios (usuario, ciudad, correo, contrasena, nivel) values (?, ?, ?, ?, ?)";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, ciudad);
            pst.setString(3, correo);
            pst.setString(4, contraseña);
            pst.setInt(5, nivel);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception ex) {
            System.out.println("Error" + ex);
        } finally {
            try {
                if (getconexion() != null) {
                    getconexion().close();
                }
            } catch (Exception e) {
                System.out.println("Error" + e);
            }

        }
        return false;
    }

    public int validarnivel(String usuario, String contraseña) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        int nivel = 0;

        try {
            String consulta = "select nivel from usuarios where usuario = ? and contrasena = ?";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }
        } catch (Exception ex) {
            System.err.println("Error" + ex);
        }

        return nivel;
    }

    public String correo(String usuario, String contraseña) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        String correo = "";

        try {
            String consulta = "select correo from usuarios where usuario = ? and contrasena = ?";
            pst = getconexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();
            while (rs.next()) {
                correo = rs.getNString(1);
            }
        } catch (Exception ex) {
            System.err.println("Error" + ex);
        }

        return correo;
    }

//        public boolean crearEquipos(String nombre,String estadio, int fecha_fundacion){
//        PreparedStatement pst = null;
//        try {
//            String consulta = "insert into equipos (nombre, estadio, fecha_fundacion) values (?, ?, ?)";
//        pst = getconexion().prepareStatement(consulta);
//        pst.setString(1, nombre);
//        pst.setString(2, estadio);
//        pst.setInt(3, fecha_fundacion);
//        
//        if (pst.executeUpdate() == 1){
//            return true;
//        }
//                
//        } catch (Exception ex) {
//            System.out.println("Error"+ ex);
//        }
//        finally{
//            try {
//            if(getconexion()!= null) getconexion().close();
//            } catch (Exception e) {
//                System.out.println("Error"+ e);
//            }
//            
//        }
//        return false;
//    }
    public String[] nombrequipo() {

        PreparedStatement pst = null;
        ResultSet rs = null;
    String[] result = new String[0];
        try {
            String consulta = "SELECT * FROM equipos";
            pst = getconexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            ArrayList<String> list = new ArrayList<String>();
            while (rs.next()) {
                list.add(rs.getString("nombre"));
            }

             result = new String[list.size()];
            result = list.toArray(result);

           for (int i = 0; i < result.length; i++) {
               System.out.println(result[i]);
            }

        } catch (Exception ex) {
            System.err.println("Error" + ex);
        }
        return result;
        

      
    }

    public static void main(String[] args){
        consultas co = new consultas();
        co.nombrequipo();
//        System.out.println(co.correo("millos","campin"));
    }
}
