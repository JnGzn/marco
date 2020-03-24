

<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.dao.UsuarioDAO"%>
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
                            <%
                                HttpSession sesion = request.getSession();
                                Object sesionn = sesion.getAttribute("id");

                                if (sesionn == null) {
                            %>


                            <a class="btn_1 d-none d-lg-block border border-primary" href="USUARIO_IniciarSesion.jsp">Iniciar Sesión</a> 

                            <%
                            } else {
                            %>

                            <a class="btn_1 d-none d-lg-block border border-primary" href="USUARIO_Perfil.jsp">ver perfil</a>

                            <%
                    }%>
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
                sesion = request.getSession();
                sesion.getAttribute("id");

                if (sesionn == null) {
            %>
            <a href="USUARIO_IniciarSesion.jsp">inicia seison</a>
            <%
            } else {

                String id = (String) sesion.getAttribute("id");

                UsuarioVO usuarioVo = usuarioDAO.listarDatos(id);

            %>
            <h1>My profile!</h1>
            <div id="datosPersonales">
                <form action="Usuario" method="post">

                    <table>

                        <tr>
                            <td>
                                <p>nombres</p>
                                <input  class="form-control " type="text" name="nombres" value="<%= usuarioVo.getNombres()%>">
                            </td>       
                        </tr>
                        <tr>
                            <td>
                                <p>apellidos:</p>
                                <input  class="form-control  "type="text" name="apellidos" value="<%= usuarioVo.getApellidos()%>">
                            </td>       
                        </tr>
                        <tr>
                            <td>
                                <p>celular:</p>
                                <input  class="form-control " type="number" name="celular" value="<%= usuarioVo.getCel()%>">
                            </td>       
                        </tr>
                        <tr>
                            <td>
                                <p>fecha nacimiento:</p>
                                <input class="form-control date" type="date" name="fechaNacimiento" value="<%= usuarioVo.getFecha()%>">
                            </td>       
                        </tr>
                        <tr>
                            <td>
                                <p>dirección:</p>
                                <input  class="form-control " type="text" name="direccion" value="<%= usuarioVo.getDireccion()%>">
                            </td>  

                        </tr>
                    </table>

                    <br>
                    <input type="hidden" name="accion" value="3">
                    <input class="btn btn-primary"  type="submit" value="actualizar"> 


                </form>
                <a href="USUARIO_ListarActividades.jsp">Listar actividades</a>
                <form action="CerrarSesion" method="post">
                    <input class=" btn btn-outline-warning" type="submit" value="cerrar sesion">
                </form>
            </div> 
            <%if (request.getAttribute("exito") != null) {%>
            ${exito}
            <%} else {%>

            ${error}
            <%}
            }%>
        </section>
    </body>
</html>
