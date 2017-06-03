<%-- 
    Document   : tblp
    Created on : 10-may-2017, 19:12:33
    Author     : IAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>     
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script> 
        <script src="libs/jquery-1.7.1.js"></script> 
        <script src="js/tablaJSONF.js"></script>  
        <link href="css/tablas.css" rel="stylesheet" type="text/css">
        <link href="css/bar.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FutbolColombia</title>
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
                                        out.print("<li><a href='index.jsp' ><h5>Inicio</h5></a>");
                                        out.print("<li><a class='active'><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp' class='active1'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Gestionar</h5></a></li>");
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
                                        out.print("<li><a href='index.jsp' ><h5>Inicio</h5></a>");
                                        out.print("<li><a class='active'><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp' class='active1'><h5>Fechas</h5></a></li>");
                                        out.print("</ul></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Equipos</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='crearEquipos.jsp'><h5>Crear</h5></a></li>");
                                        out.print("<li><a href='equipos.jsp'><h5>Gestionar</h5></a></li>");
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
                                        out.print("<li><a href='index.jsp'><h5>Inicio</h5></a>");
                                        out.print("<li><a class='active'><h5>Tablas</h5></a>");
                                        out.print("<ul>");
                                        out.print("<li><a href='Posiciones.jsp'><h5>Posiciones</h5></a></li>");
                                        out.print("<li><a href='Goleadores.jsp'><h5>Goleadores</h5></a></li>");
                                        out.print("<li><a href='Fechas.jsp' class='active1'><h5>Fechas</h5></a></li>");
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
        <div id="selectfechas" >  
            <p style="text-align:center;">Seleccione la fecha que quiere consultar:</p>
            <br>        
            <script type="text/javascript">
                d();
            </script>
            <select id="Ultra" onchange="run()"> 
                <option value="0" selected>Seleccione una fecha:</option>
                <option value="8171">Fecha 1</option>
                <option value="8172">Fecha 2</option>
                <option value="8173">Fecha 3</option>
                <option value="8174">Fecha 4</option>
                <option value="8175">Fecha 5</option>
                <option value="8176">Fecha 6</option>
                <option value="8177">Fecha 7</option>
                <option value="8178">Fecha 8</option>
                <option value="8179">Fecha 9</option>
                <option value="8180">Fecha 10</option>
                <option value="8181">Fecha 11</option>
                <option value="8182">Fecha 12</option>
                <option value="8183">Fecha 13</option>
                <option value="8184">Fecha 14</option>
                <option value="8185">Fecha 15</option>
                <option value="8186">Fecha 16</option>
                <option value="8187">Fecha 17</option>
                <option value="8188">Fecha 18</option>
                <option value="8189">Fecha 19</option>
                <option value="8190">Fecha 20</option>
            </select><br>    
        </div><br>
        <div>                       
            <table   class="fecha" id="tblf">
                <caption><b>Tabla de Fechas</b></caption>
                <thead>
                <th>Fecha</th>
                <th>Arbitro</th>
                <th>Estadio</th>
                <th>Televisión</th>	
                <th>Equipo Local</th>
                <th>Goles local</th>
                <th>Goles visitante</th>
                <th>Equipo Visitante</th>	
                </thead>
                <tbody></tbody>
            </table>         
        </div>

    </body>
    <footer>
            <a>  Futbol Colombia 2017  </a>
        </footer>
</html>
