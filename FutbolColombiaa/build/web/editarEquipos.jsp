<%@page import="modelo.equipo"%>
<%@page import="java.sql.Connection"%>
<%@page import="controlador.conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Equipo</title>
    </head>
    <body>
        <header>
            <div id = "div1">
                <div id = "div2">                
                    <div id="nav_wrapper">
                        <div class="logo"><img src="logo.png" ></div>
                            <%             HttpSession sesion = request.getSession();
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
                                        out.print("<li><a href='index.jsp' class='active'><h5>Inicio</h5></a>");
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
                                        out.print("<li><a href=''><h5>Jugadores</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearJugador.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='gestionarJugadores.jsp'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='niveles.jsp'><h5>Niveles</h5></a>");
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>");
                                        out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>");
                                        out.print("</ul></li>");
                                    }
                                    if (niv == 2) {
                                        out.print("<li><a href='index.jsp' class='active'><h5>Inicio</h5></a>");
                                        out.print("<li><a ><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a>");;
                                        out.print("<ul>");
                                        out.print("<li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='#'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href=''><h5>Jugadores</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearJugador.jsp'><h5>Crear</h5></a></li>");
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
                    </div>
                </div>
            </div>
            <header>
                <b>crear | <a href="verEquipos.jsp">Volver</a></b><br/>

                <h1>Editar equipo:</h1>
                <form action="actualizar" method="post" enctype="multipart/form-data">
                    <label>Nombre del equipo: </label><br>
                    <input type="text" name="nombre" value="<%=request.getParameter("nombre")%>"/><br>
                    <label>Estadio: </label><br>
                    <input type="text" name="estadio" value="<%=request.getParameter("estadio")%>"/><br>
                    <label>Fecha de fundacion: </label><br>
                    <input type="number" name="fecha_fundacion" value="<%=request.getParameter("fecha_fundacion")%>"/><br>
                    <label>Escudo: </label><br>
                    <%
                        try {
                            conexion dbconn = new conexion();
                            Connection myconnection = dbconn.getconexion();

                            String sqlString = "SELECT * FROM equipos";
                            Statement myStatement = myconnection.createStatement();
                            ResultSet rs = myStatement.executeQuery(sqlString);

                            if (rs.next()) {
                                String nombre = request.getParameter("nombre");

                    %>
                    <img src="getImage.jsp?nombre=<%=nombre%>" width="100px"/>
                    <%}
                            rs.close();
                            myStatement.close();
                            myconnection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    %>
                    <p> <label>Seleccione el escudo del equipo: </label><br>
                        <input type="file" name="escudo"/><br>
                        <input type="submit" value="Guardar Equipo" />
                </form>
                </body>
                <footer>
                    <a>  Futbol Colombia 2017  </a>
                </footer>
                </html>
