<%-- 
    Document   : ADMIN_index
    Created on : 22-mar-2020, 19:29:47
    Author     : jngzn
--%>

<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>marco</title>

        <link rel="icon" href="img/favicon.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css"> 
    </head>
    <body>




        <%

            HttpSession sesion = request.getSession();
            Object sesionID = sesion.getAttribute("id");
            Object sesionAD = sesion.getAttribute("admin");
            if (sesionID != null && sesionAD != null) {

        %>
        <h1></h1>
        
        
        
        <form action="Usuario" method="post" id="formSign">
                                    <div class="group"> 
                                        <div class="row">
                                            <div class="col-6 mx-auto">
                                                <label for="user" class="label">Nombre</label>
                                                <input id="user" type="text" class="input" placeholder="Ingrese su nombre" name="nombres">
                                            </div>
                                            <div class="col-6 mx-auto">
                                                <label for="user" class="label">Apellido</label>
                                                <input id="user" type="text" class="input" placeholder="Ingrese su apellido" name="apellidos">
                                            </div>
                                        </div> 
                                    </div>
                                     <div class="group">
                                        <label  class="label"> fecha nacimiento </label> 
                                        <input type="date" class="input" data-type="date" placeholder="Ingrese su correo" name="fechaNacimiento"> 
                                    </div>
                                    <div class="group">
                                        <label  class="label"> Correo </label> 
                                        <input type="email" class="input" data-type="email" placeholder="Ingrese su correo" name="confirmaCorreo" id="confirmaCorreo"> 
                                    </div>
                                    <div class="group">
                                        <label  class="label"> Confirmar Correo </label> 
                                        <input type="email" class="input" data-type="email" placeholder="Confirme su correo" name="correo"> 
                                    </div>
                                    <div class="group"> 
                                        <label for="pass" class="label">Contraseña</label>
                                        <input id="pass" type="password" class="input" data-type="password" placeholder="Contraseña" name="pass"> 
                                    </div>
                                    <input type="hidden" name="accion" value="1">
                                    <p class="col-8 mx-auto text-danger" id="error"></p>
                                    <div class="group"> <input type="submit" class="button" value="Registrarse"> </div>
                                </form>
        
        
        
        <form action="CerrarSesion">
            <button type="submit" class="btn btn-primary" onclick="CerrarSesion">Cerrar sesion</button>
        </form>
        <%}%>
    </body>
</html>
