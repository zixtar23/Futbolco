<%@page import="modelo.equipos"%>
<%@page import="Acceso.DAOEquipo"%>
<%@page import="modelo.jugadores"%>
<%@page import="Acceso.DAOJugador"%>
<%@page import="controlador.consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Acceso.conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bar.css" rel="stylesheet" type="text/css">
        <title>Futbol Colombia</title>            
    </head>
    <body>
        <header>
            <div id = "div1">
                <div id = "div2">                
                    <div id="nav_wrapper">
                        <div class="logo"><img src="logo.png" ></div>
                        <ul>
                            <%
                                HttpSession sesion = request.getSession();
                                String usuario;
                                String nivel;
                                if (sesion.getAttribute("usuario") != null && sesion.getAttribute("nivel") != null) {
                                    usuario = sesion.getAttribute("usuario").toString();
                                    nivel = sesion.getAttribute("usuario").toString();
                                } else {
                                    out.print("<script>location.replace('index.jsp');</script>");
                                }

                                if (sesion.getAttribute("usuario") != null && sesion.getAttribute("nivel") != null) {
                                    usuario = sesion.getAttribute("usuario").toString();
                                    nivel = sesion.getAttribute("nivel").toString();
                                    int niv = Integer.parseInt(nivel);
                                    if (niv == 1) {%>
                            <li><a href='index.jsp' class='active'><h5>Inicio</h5></a>
                            <li><a ><h5>Tablas</h5></a>
                                <ul>
                                    <li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>
                                    <li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>
                                    <li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>
                                </ul></li>
                            <li><a href='equipos.jsp'><h5>Equipos</h5></a>
                                <ul>
                                    <li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>
                                    <li><a href='#'><h5>Gestionar</h5></a></li>
                                </ul></li>
                            <li><a href=''><h5>Jugadores</h5></a>
                                <ul>
                                    <li><a href='crearJugador.jsp'><h5>Crear</h5></a></li>
                                    <li><a href='gestionarJugadores.jsp'><h5>Gestionar</h5></a></li>
                                </ul></li>
                            <li><a href='niveles.jsp'><h5>Niveles</h5></a>
                            <li><a ><h5>Usuario  <%=usuario%> </h5></a>
                                <ul>
                                    <li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>
                                    <li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>
                                </ul></li>
                                <% }
                                    if (niv == 2) {%>
                            <li><a href='index.jsp' class='active'><h5>Inicio</h5></a>
                            <li><a ><h5>Tablas</h5></a>
                                <ul>
                                    <li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>
                                    <li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>
                                    <li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>
                                </ul></li>
                            <li><a href='equipos.jsp'><h5>Equipos</h5></a>
                                <ul>
                                    <li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>
                                    <li><a href='#'><h5>Gestionar</h5></a></li>
                                </ul></li>
                            <li><a href=''><h5>Jugadores</h5></a>
                                <ul>
                                    <li><a href='crearJugador.jsp'><h5>Crear</h5></a></li>
                                    <li><a href='gestionarJugadores.jsp'><h5>Gestionar</h5></a></li>
                                </ul></li>
                            <li><a ><h5>Usuario  <%=usuario%> </h5></a>
                                <ul>
                                    <li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>
                                    <li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>
                                </ul></li>
                                <%  }
                                    if (niv == 3) {%>
                            <li><a href='index.jsp' class='active'><h5>Inicio</h5></a>
                            <li><a ><h5>Tablas</h5></a>
                                <ul>
                                    <li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>
                                    <li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>
                                    <li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>
                                </ul></li>
                            <li><a href='equipos.jsp'><h5>Equipos</h5></a></li>
                            <li><a ><h5>Usuario  <%=usuario%> </h5></a>
                                <ul>
                                    <li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>
                                    <li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>
                                </ul></li>
                                <% }

                                } else {%>
                            <li><a href='iniciarSesion.jsp'>Inicio de Sesion</a></li>
                            <li><a href='registro.jsp'>Registrarme</a></li>
                                <% }
                                %>
                        </ul>
                    </div>
                </div>
            </div> 
        </header>
        <div id="selectfechas">   
            <div class="contenido">
                <form id="formu" ACTION="ServletJugador" METHOD=POST>
                    <label>Editar Jugador</label><br>
                    <a>Equipo al que pertenece: </a><br>                           
                    <select name="equipo" form="formu" >
                       <%
                            String posicionj="";
                           DAOEquipo daoe = new DAOEquipo();
                            DAOJugador dao = new DAOJugador();
                            List<equipos> y = daoe.consultar();
                            jugadores jugador1 = new jugadores();
                            jugador1.setId(Integer.parseInt(request.getParameter("id")));
                             List<jugadores> z = dao.consultarJugadorId(jugador1);
                             for (jugadores jugador : z) {
                             posicionj = jugador.getEquipo();
                                                        
                            for (equipos equipo : y) {
                        %>
                        <option value="<%=equipo.getNombre()%>"><%=equipo.getNombre()%></option>                         
<% } %>
                    </select> <br>
                    <a>Posicion en el campo: </a><br>
                    <select name="posicion" form="formu" id="pos" >
                    <%
                            List<jugadores> x = dao.consultar();
                            String pos[] = new String[5];
                            pos[0] = "Arquero";
                            pos[1] = "Desfensa";
                            pos[2] = "Mediocampista";
                            pos[3] = "Delantero";
                            pos[4] = "Tecnico";
                            for (int p = 0; p < pos.length; p++) { 
                    %>
                        <option value="<%=pos[p]%>"><%=pos[p]%></option>
                        <% } %>
                    </select> 
                    <input type="text" name="nombres"  value="<%=jugador.getNombres()%>"> 
                    <input type="text" name="apellidos"  value="<%=jugador.getApellidos()%>"> 
                    <input type="text" name="pais"  value="<%=jugador.getPais()%>"> 
                    <input type="hidden" name="id" value="<%=jugador.getId()%>"> 
                    <input type="submit" value="Editar Jugador" name="btnEditar">
                    <%
}

                    %>
                </form>
            </div>
        </div>        
    </body>
    <footer>
        <a>  Futbol Colombia 2017  </a>
    </footer>
</html>
