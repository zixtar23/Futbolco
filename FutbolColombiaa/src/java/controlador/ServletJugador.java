/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Acceso.DAOJugador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.jugadores;

/**
 *
 * @author IAN
 */
public class ServletJugador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAOJugador dao = new DAOJugador();
            jugadores jugador = new jugadores();
            List<jugadores> datos = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
            try {
                if (request.getParameter("btnCrearJugador") != null) {
                    jugador.setEquipo(request.getParameter("equipo"));
                    jugador.setPosicion(request.getParameter("posicion"));
                    jugador.setNombres(request.getParameter("nombres"));
                    jugador.setApellidos(request.getParameter("apellidos"));
                    jugador.setPais(request.getParameter("pais"));
                    respuesta = dao.crear(jugador);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("crearJugador.jsp");
                } else if (request.getParameter("btnEditar") != null) {
                    jugador.setEquipo(request.getParameter("equipo"));
                    jugador.setPosicion(request.getParameter("posicion"));
                    jugador.setNombres(request.getParameter("nombres"));
                    jugador.setApellidos(request.getParameter("apellidos"));
                    jugador.setPais(request.getParameter("pais"));
                    jugador.setId(Integer.parseInt(request.getParameter("id")));
                    respuesta = dao.editar(jugador);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("gestionarJugadores.jsp");
                } else if (request.getParameter("btnEliminar") != null) {
                     jugador.setId(Integer.parseInt(request.getParameter("id")));
                      respuesta = dao.eliminar(jugador);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("gestionarJugadores.jsp");
                }
            } catch (NumberFormatException e) {
            }

            rd.forward(request, response);

        } catch (Exception e) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
