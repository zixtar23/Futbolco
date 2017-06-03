<%-- 
    Document   : resgistro
    Created on : 28-abr-2017, 15:51:55
    Author     : IAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>     
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" ></script> 
        <script src="libs/jquery-1.7.1.js"></script>  
        <script src="js/menu.js"></script>
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
                                    nivel = sesion.getAttribute("nivel").toString();
                                    out.print("<li><a href='Sesioncerrada'><h5>Cerrar Session " + usuario + "</h5></a></li>");
                                    int niv = Integer.parseInt(nivel);
                                } else {
                                    out.print("<li><a href='index.jsp'>Inicio</a></li>");
                                    out.print("<li><a href='iniciarSesion.jsp'>Iniciar Sesion</a></li>");;

                                }


                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </header>  
        <div id="selectfechas">
            <div class="contenido">        
                <form action="ServletUsuario" method="post">
                    <label>Formulario de registro</label>
                    <input type="text" name="usuario" placeholder="Ingrese usuario" required=""/>
                    <input type="text" name="ciudad" placeholder="Ingrese ciudad" required=""/>
                    <input type="email" name="correo" placeholder="Ingrese correo" required=""/>
                    <input type="password" name="contrasena" placeholder="Ingrese contraseña" required=""/>
                    <input type="submit" value="Registrarme" name="Registrarme"/>
                </form>
            </div>
        </div>        
    </body>
    <footer>
            <a>  Futbol Colombia 2017  </a>
        </footer>
</html>
