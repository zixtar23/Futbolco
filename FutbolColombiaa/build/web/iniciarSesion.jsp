<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true"%>
<!DOCTYPE html>
<html>
    <head>    
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script> 
        <script src="libs/jquery-1.7.1.js"></script>
        <script src="js/tablaJSONP.js"></script> 
        <script src="js/tablaJSONF.js"></script>  
        <script src="js/menu.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
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
                        <div class="logo"><img src="logo.png" alt="Smiley face"></div>
                        <ul>
                            <%
                                HttpSession sesion = request.getSession();
                                String usuario;
                                int nivel;
                                int id_usuario;

                                if (sesion.getAttribute("usuario") != null && sesion.getAttribute("nivel") != null) {
                                    usuario = sesion.getAttribute("usuario").toString();
                                    nivel = Integer.parseInt(sesion.getAttribute("nivel").toString());
                                    id_usuario = Integer.parseInt(sesion.getAttribute("id").toString());
                                    out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session " + usuario + "</h5></a></li>");
                                } else {
                                    out.print("<li><a href='index.jsp'>Inicio</a></li>");
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

                <form action="ServletUsuario" method="post" id="forminicio">
                    <label for="">Iniciar Sesión</label>
                    <div class="usuario">
                        <input type="text" name="usuario" id="textusuario" placeholder="Usuario" required=""/><br>
                    </div>
                    <div class="contrasena">
                        <input type="password" name="contrasena" id="textcontrasena" placeholder="Contraseña"  required=""/><br>
                    </div>
                    <input type="submit" value="iniciar sesion" id="btniniciar" name="btniniciar" class="btningresar"/><p>

                </form>           
                <br>
                <a><h5>¿No tienes una cuenta? <a href="registro.jsp">Registrarme</h5></a>
            </div>
            <%            if (request.getParameter("cerrar") != null) {
                    session.invalidate();
                }
            %>
        </div>        
    </body>
    <footer>
            <a>  Futbol Colombia 2017  </a>
        </footer> 
</html>
