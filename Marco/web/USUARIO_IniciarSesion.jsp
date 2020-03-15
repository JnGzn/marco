<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="StyleSheet" href="css/in.css">

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




        <!---------------------------------------------------->

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
                                <form action="Usuario" method="post" id="formLogin">
                                    <div class="group"> 
                                        <label class="label">Usuario</label> 
                                        <input id="user" type="text" class="input" placeholder="Ingrese su nombre"  name="confirmaCorreo"> 

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
                                    <div class="foot"> <a href="#">Olvido su contraseÃ±a?</a> </div>
                                </form>
                            </div>

                            <div class="sign-up-form">
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
                                        <input type="email" class="input" data-type="email" placeholder="Ingrese su correo" name="correo"> 
                                    </div>
                                    <div class="group">
                                        <label  class="label"> Confirmar Correo </label> 
                                        <input type="email" class="input" data-type="email" placeholder="Confirme su correo" name="confirmaCorreo"> 
                                    </div>
                                    <div class="group"> 
                                        <label for="pass" class="label">Contraseña</label>
                                        <input id="pass" type="password" class="input" data-type="password" placeholder="Contraseña" name="pass"> 
                                    </div>
                                    <input type="hidden" name="accion" value="1">
                                    <div class="group"> <input type="submit" class="button" value="Registrarse"> </div>

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
        
    </body>
</html>