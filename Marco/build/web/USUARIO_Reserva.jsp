<%-- 
    Document   : USUARIO_Reserva
    Created on : 04-dic-2019, 17:59:06
    Author     : jngzn
--%>

<%@page import="modelo.dao.UsuarioDAO"%>
<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marco</title>
  
        
        
        
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
        <header class="main_menu home_menu upperHead">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.html">
                                <img src="img/logo.png" height="70px" alt="logo">
                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Inicio</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Nosotros.html">Nosotros</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="USUARIO_ListarActividades.jsp">Actividades</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Galeria.html">Galería</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.html">Contáctenos</a>
                                </li>
                            </ul>
                            </div>
                            <a class="btn_1 d-none d-lg-block border border-primary" href="USUARIO_IniciarSesion.jsp">Iniciar SesiÃ³n</a> 
                            <!--                        <a class="btn_1 d-none d-lg-block border border-primary" data-toggle="modal"
                                data-target="#exampleModalScrollable">Iniciar SesiÃ³n</a>-->
                        </nav>
                    </div>
                </div>
            </div>
        </header>

        <section class="banner_part2">


            <%

                UsuarioDAO usuarioDAO = new UsuarioDAO();
                HttpSession sesion = request.getSession();
                Object sesionn = sesion.getAttribute("id");

                if (sesionn == null) {
            %>
            <br>
            <h3>Primero debe iniciar sesion</h3>
            <button class="btn btn-primary" onclick="iniciar()">Iniciar Sesion</button>
            <%
            } else {

                String idUsuario = (String) sesion.getAttribute("id");
                UsuarioDAO usuDAO = new UsuarioDAO();
                UsuarioVO usuVO = UsuarioDAO.listarDatos(idUsuario);


            %>
            
            <%   String id = (String) request.getParameter("res");
                if (id != null) {

                    ActividadDAO actiDAO = new ActividadDAO();
                    ActividadVO actiVO = actiDAO.ListarDatos(id);

            %>


            <div class="container">
                <h3>datos del comprador</h3>

                <!--  reserva-->
                <div class="my-5 card border-left-success shadow col-md-12">
                    <div class="card-body col-md-10 mx-auto">
                        <div class="row">


                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success  mb-1 h5">reservar</div>
                            </div>
                        </div>
                        <br><br>

                        <form action="Actividad" method="post" id="formReserva">

                            <input type="hidden" value="<%=id%>" name="acti">


                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="text-input">boletos</label>
                                <div class="col-md-4">
                                    <input  class="form-control" type="text" name="ctxCupos" id="ctxCupos" value="1" >
                                </div>
                                <label class="col-md-2 col-form-label" for="text-input">Precio a pagar:</label>
                                <div class="col-md-4">

                                    <input type="hidden" id="precioUnidad" value="<%= actiVO.getPrecio()%>">
                                    <input  class="form-control" id="resultado" type="text" id="ctxCupos" value="<%= actiVO.getPrecio()%>" disabled >
                                </div>
                            </div>



                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="text-input">Nombres</label>
                                <div class="col-md-4">
                                    <input  class="form-control" type="text" name="ctxNombres" value="<%=usuVO.getNombres()%>" >
                                </div>
                                <label class="col-md-2 col-form-label" for="text-input"> Apellidos</label>

                                <div class="col-md-4">
                                    <input  class="form-control " type="text" name="ctxApellidos" value="<%=usuVO.getApellidos()%>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="text-input">No. Documento</label>
                                <div class="col-md-4">
                                    <input  class="form-control " type="text" name="ctxDocumento" value="<%=usuVO.getDocumento()%>" >
                                </div>
                                <label class="col-md-2 col-form-label" for="text-input">Correo</label>

                                <div class="col-md-4">
                                    <input  class="form-control " type="email" name="ctxCorreo" value="<%=usuVO.getCorreo()%>">
                                </div>
                            </div>



                            <input type="hidden" name="ctxPrecioTotal" id="ctxPrecioTotal" value="<%= actiVO.getPrecio()%>"><br>
                            <input type="hidden" name="ctxIdUsuario" value="<%=idUsuario%>"><br>
                            <input type="hidden" name="ctxIdActividad" value="<%=id%>"><br>


                            <br>



                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="text-input">Calificar</label>
                                <div class="col-md-4">
                                    <input  class="form-control date" type="text" name="ctxCalificacion" value="" >
                                </div>

                            </div>




                            <br>
                            <input class="btn btn-primary" type="submit" name="accion"value="enviar">
                            <p class="col-8 mx-auto text-danger" id="error"></p>
                        </form>
                        


                    </div>

                </div>
                <!-- fin reserva-->
            </div>
            <%}
            }%>
        </section>
        <script src="js/DOM/reserva.js"></script>
        <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/calc/reserva.js"></script>
        <script src="js/validaciones/user.js" type="text/javascript"></script>
    </body>
</html>
