<%-- 
    Document   : IniciarSesionEmpresa
    Created on : 26-sep-2019, 23:02:37
    Author     : jngzn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="StyleSheet" href="css/inEmp.css">

        <link rel="icon" href="img/favicon.png">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/all.css">
    </head>
    <body>
        
        <div class="container">
            <div class="col-md-6 mx-auto p-0">
                <div class="login-box">
                    <div class="header">
                        <div class="col-9 mx-auto">
                            <br>
                            <br>

                            <img src="img/logo.png">
                        </div>

                    </div>
                    <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
                            for="tab-1" class="tab">Ingresar</label> <input id="tab-2" type="radio" name="tab"
                            class="sign-up"><label for="tab-2" class="tab">Registrarse</label>

                        <div class="login-space">

                            <div class="login">
                                <form action="Usuario" method="post" id="EmpresaLogin">
                                    <div class="group"> 
                                        <label class="label">Email</label> 
                                        <input id="email" type="email" class="input" placeholder="Ingrese su email"  name="correo"> 

                                    </div>
                                    <div class="group"> 
                                        <label  class="label">Contraseña</label> 
                                        <input id="pass"
                                            type="password" class="input" data-type="password"  placeholder="Ingrese su contraseña" name="pass"> 
                                    </div>
                                    <div class="group"> 
                                        <input id="check" type="checkbox" class="check" checked> 
                                        <label for="check"><span class="icon"></span> Mantenerme Registrado</label> 
                                    </div>
                                    <div class="group"> 
                                        <input type="hidden" name="accion" value="2">
                                        <p class="col-8 mx-auto text-danger" id="err"></p>
                                        <input type="submit" class="button" value="Iniciar sesion">  
                                    </div>
                                    <div class="hr"></div>
                                    <div class="foot"> <a href="#" style="color: rgba(252, 214, 0, 0.9)">Olvido su contraseña?</a> </div>
                                </form>
                            </div>

                            <div class="sign-up-form">
                                <form action="Usuario" method="post" id="EmpresaRegistro">
                                    <div class="group">
                                        <label  class="label"> Nit </label> 
                                        <input type="number" class="input" data-type="number" placeholder="Ingrese su nit sin guiones " name="nit" id="namel"> 
                                    </div>
                                    <div class="group">
                                        <label  class="label"> Razón Social </label> 
                                        <input type="text" class="input" data-type="text" placeholder="Ingrese su razon social " name="nombre" id="nombre"> 
                                    </div>
                                    <div class="group">
                                        <label  class="label"> Correo Empresa </label> 
                                        <input type="email" class="input" data-type="email" placeholder="Ingrese su correo" name="correo" id="correo"> 
                                    </div>
                                    <div class="group"> 
                                        <label for="pass" class="label">Contraseña</label>
                                        <input id="pass" type="password" class="input" data-type="password" placeholder="Crear contraseña" name="pass"> 
                                    </div>
                                    <input type="hidden" name="accion" value="1">
                                    <p class="col-8 mx-auto text-danger" id="error"></p>
                                    <div class="group"> <input type="submit" class="button" value="Registrarse"> </div>
                                    <input type="hidden" value="2" name="env">
                                </form>
                                 <p id="errorActiv"></p>
                                    <div class="foot"> <label for="tab-1">Ya eres Miembro?</label> </div>
                                    <div class="hr"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
          
        </div>
        
        <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script src="js/validaciones/user.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
    </body>
</html>
