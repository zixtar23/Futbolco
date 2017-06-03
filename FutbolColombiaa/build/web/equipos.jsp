<%@page import="modelo.equipos"%>
<%@page import="Acceso.DAOEquipo"%>
<%@page import="Acceso.DAOJugador"%>
<%@page import="modelo.jugadores"%>
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
        <link href="css/tablas.css" rel="stylesheet" type="text/css"> 
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
                                    if (niv == 1) {
                                        out.print("<li><a href='index.jsp' '><h5>Inicio</h5></a>");
                                        out.print("<li><a ><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='#'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='' class='active'><h5>Jugadores</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearJugador.jsp' class='active1'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='gestionarJugadores.jsp'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='niveles.jsp'><h5>Niveles</h5></a>");
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp' ><h5>Editar cuenta</h5></a></li>");
                                        out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>");
                                        out.print("</ul></li>");
                                    }
                                    if (niv == 2) {
                                        out.print("<li><a href='index.jsp' ><h5>Inicio</h5></a>");
                                        out.print("<li><a ><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='#'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='' class='active'><h5>Jugadores</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearJugador.jsp' class='active1'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='gestionarJugadores.jsp'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>");
                                        out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>");
                                        out.print("</ul></li>");
                                    }
                                    if (niv == 3) {
                                        out.print("<li><a href='index.jsp' class='active'><h5>Inicio</h5></a>");
                                        out.print("<li><a ><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a></li>");
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>");
                                        out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>");
                                        out.print("</ul></li>");
                                    }

                                } else {
                                    out.print("<li><a href='iniciarSesion.jsp'>Inicio de Sesion</a></li>");
                                    out.print("<li><a href='registro.jsp'>Registrarme</a></li>");
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div> 
        </header>
        <div id="selectfechas">
            <table   class="fecha" id="tblg">
                <caption><b>Equipos</b></caption>
                <thead>                
                <th>Escudo</th>
                <th>Nombre</th>
                </thead>
                <tbody>
                    <%
                        DAOEquipo dao = new DAOEquipo();
                        List<equipos> y = dao.consultar();
                        for (equipos equipo : y) {
                    %>  
                    <tr> <center>      
                        <td><center><a href="equipoDetalles.jsp?id=<%=equipo.getId()%>&&equipo=<%=equipo.getNombre()%>"><img src="<%=equipo.getPath()%>" width="100px" height="100px" ></a></center></td>
                    <td><center><a ><%=equipo.getNombre()%></a></center></td>                  
                    </tr>              
                    <%  }%>
                    </tbody> 
            </table>
        </div>
    </body>
    <footer>
        <a>  Futbol Colombia 2017  </a>
    </footer>
</html>