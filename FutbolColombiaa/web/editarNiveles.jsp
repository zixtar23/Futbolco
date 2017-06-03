<%@page import="modelo.usuarios"%>
<%@page import="Acceso.DAOUsuario"%>
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
                                String usuario = "";
                                int nivel = 0;
                                int id = 0;
                                if (sesion.getAttribute("usuario") != null && sesion.getAttribute("nivel") != null) {
                                    usuario = sesion.getAttribute("usuario").toString();
                                    nivel = Integer.parseInt(sesion.getAttribute("nivel").toString());
                                    id = Integer.parseInt(sesion.getAttribute("id").toString());
                                } else {
                                    out.print("<script>location.replace('index.jsp');</script>");
                                }

                                if (sesion.getAttribute("usuario") != null && sesion.getAttribute("nivel") != null) {
                                    usuario = sesion.getAttribute("usuario").toString();
                                    nivel = Integer.parseInt(sesion.getAttribute("nivel").toString());
                                    id = Integer.parseInt(sesion.getAttribute("id").toString());
                                    if (nivel == 1) {
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
                                        out.print("<li><a href=''><h5>Jugadores</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearJugador.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='gestionarJugadores.jsp'><h5>Gestionar</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='niveles.jsp' class='active'><h5>Niveles</h5></a>");
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp'><h5>Editar cuenta</h5></a></li>");
                                        out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>");
                                        out.print("</ul></li>");
                                    }
                                    if (nivel == 2) {
                                        out.print("<li><a href='index.jsp''><h5>Inicio</h5></a>");
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
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp' ><h5>Editar cuenta</h5></a></li>");
                                        out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session </h5></a>");
                                        out.print("</ul></li>");
                                    }
                                    if (nivel == 3) {
                                        out.print("<li><a href='index.jsp' ><h5>Inicio</h5></a>");
                                        out.print("<li><a ><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a></li>");
                                        out.print("<li><a ><h5>Usuario " + usuario + "</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='editarCuenta.jsp' ><h5>Editar cuenta</h5></a></li>");
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
        <div class="contenido">
            <form ACTION="ServletUsuario" METHOD=POST>
                <%
                    DAOUsuario dao = new DAOUsuario();
                    List<usuarios> y = dao.consultarUsuarioId(Integer.parseInt(request.getParameter("id")));
                    for (usuarios usu : y) {
                %>
                <a>Usuario:</a><br><br>
                <a ><h1><%=usu.getUsuario()%></h1></a><br>
                <a>nivel:</a><br>
                <input type="number" name="nivel" value="<%=usu.getNivel()%>"> <br>
                <input type="hidden" name="id" value="<%=usu.getId_usuario()%>"> 
                <input type="submit" value="Editar Nivel" name="btnEditarNivel">
                <% }%>
            </form>
        </div>
    </div>
    <%if (request.getAttribute("respuesta") != null) {%>
    <b><center>**<%= request.getAttribute("respuesta")%>**</center></b> 
            <% }%>
</body>
<footer>
    <a>  Futbol Colombia 2017  </a>
</footer>

</html>
