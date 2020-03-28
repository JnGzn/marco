<%@page import="java.util.ArrayList"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<!doctype html>
<html lang="es">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Marco</title>
        <link rel="stylesheet" type="text/css" href="css/listar.css">
        <!-- CSS Listar -->
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
        <style>

            .vl {
                border-left: 2px solid green;
                height: 100px;
            }

            .text-color{
                color: black;
            }

        </style>
    </head>

    <body >
        <!--::header part start::-->
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.html"> <img src="img/logo.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.html">Inicio</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Nosotros.html">Nosotros</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Actividades.html">Actividades</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Galeria.html">Galeria</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.html">Contactenos</a>
                                    </li>
                                </ul>
                            </div>
                            <a class="btn_1 d-none d-lg-block border border-primary" href="login.html">Iniciar Sesion</a>
                        </nav>
                    </div>
                </div>
            </div>
        </header>

        <section class="search_your_country my-auto" style="padding-top: 380px;background: #ffcc00;">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <div class="search_form">


                            <form method="post">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="search_form_iner">
                                            <input  class="custom_select form-control col-12" name="busc" type="text" placeholder="Ingresa palabra clave">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <button type="submit" class="btn search_btn" id="busqueda">Buscar</button>
                                    </div>
                                </div>

                            </form>
                            <button id="vermas"  class="btn btn-link">mas criterios de busqueda</button>>

                        </div>
                        <div class="row col-6 mx-auto border border-success" id="filter" hidden >
                            <form method="post">
                                <div class="col-6 my-3">
                                    <label class="mx-auto col-auto">Rango precio</label>
                                    <div class="row">
                                        $ <input class="col-4" type="text"> -
                                        $ <input class="col-4" type="text">
                                    </div>
                                </div>
                                <button type="submit" class="my-3 btn btn-secondary col-auto mx-auto">aplicar</button>
                            </form>
                                <div class="col-6 my-3">
                                    <label class="mx-auto col-auto">Zona</label>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <select class="col-4">
                                            <option  value="any"></option>
                                            <option value="norte">Norte</option>
                                            <option value="sur">Sur</option>
                                            <option value="oriente">Oriente</option>
                                            <option value="occidente">Occidente</option>
                                        </select>
                                    </div>
                                </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <hr>
        <div class="container" style="padding-top:40px; background: blue all;">

            <div class="section">
                <div class="row align-items-center">
                    <h3 class="mb-30">Resultados de la busqueda</h3>

                    <div class="progress-table-wrap col-12" id="inicio">
                        <div class="progress-table col-12">
                            <div class="table-head col-12">
                                <div class=" col-3">Titulo</div>
                                <div class=" col-2">Zona</div>
                                <div class=" col-3">cupos</div>
                                <div class=" col-3">Imagen</div>
                                <div class=" col-2">Reservar</div>
                            </div>
                            <%

                                ActividadDAO actDAO = new ActividadDAO();

                                for (ActividadVO actVo2 : actDAO.ListarDatos()) {
                                    ActividadVO actVo = actDAO.ListarDatos(actVo2.getId());%>
                            <div class="table-row col-12">
                                <div class=" col-3">  <%=   actVo.getTitulo()%></div>
                                <div class=" col-2">   <%=   actVo.getZona()%></div>
                                <div class=" col-2">   <%=   actVo.getCupos()%></div>
                                <div class=" col-auto mx-auto" > <img src="<%=   actVo.getImage1()%>" width="70%" height="90"> </div>
                                <div class=" col-2"> <a href="USUARIO_VerActividad.jsp?actividad=<%=  actVo.getId()%>" >Ver mas</a></div>

                            </div>
                            <%}%>


                        </div>
                    </div>

                    <div class="progress-table-wrap col-12" id="busqu" hidden>
                        <button class="btn btn-outline-info" id="limpiar">Limpiar filtro</button>
                        <div class="progress-table col-12">
                            <div class="table-head col-12">
                                <div class=" col-3">Titulossss</div>
                                <div class=" col-2">Zona</div>
                                <div class=" col-3">cupos</div>
                                <div class=" col-3">Imagen</div>
                                <div class=" col-2">Reservar</div>
                            </div>
                            <%

                                String palClave = request.getParameter("busc");
//                                actDAO = new ActividadDAO();
//                                String precio1 = request.getParameter("");
//                                int op = 0;
//                                String precio2 = request.getParameter("");
//                                String zona = request.getParameter("");                          

                           


                                    for (ActividadVO actVo2 : actDAO.Filtar(palClave)) {
                                        ActividadVO actVo = actDAO.ListarDatos(actVo2.getId());%>
                            <div class="table-row col-12">
                                <div class=" col-3">  <%=   actVo.getTitulo()%></div>
                                <div class=" col-2">   <%=   actVo.getZona()%></div>
                                <div class=" col-2">  <%=   actVo.getCupos()%></div>
                                <div class=" col-auto mx-auto" > <img src="<%=   actVo.getImage1()%>" width="70%" height="90"> </div>
                                <div class=" col-2"> <a href="USUARIO_VerActividad.jsp?actividad=<%=  actVo.getId()%>" >Ver mas</a></div>

                            </div>
                            <%}
                                

                            %>


                        </div>
                    </div>
                </div>
            </div>
    </section>


    <!-- End Align Area -->

    <section class="cta_part section_padding">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-8 col-xl-7">
                    <div class="cta_text text-center">
                        <h5>Suscribete a nuestro Boletín</h5>
                        <h2>Suscribete y estaras al día con nuestras ofertas</h2>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Ingrese su correo" aria-label="Recipient's username with two button addons" aria-describedby="button-addon4">
                            <div class="input-group-append" id="button-addon4">
                                <a href="#" class="subs_btn">suscribirse</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <!--::footer_part start::-->
    <footer class="footer_part">
        <hr>
        <div class="row">
            <div class="col-lg-8">
                <div class="copyright_text">
                    <P><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
                </div>
            </div>

        </div>
        <img src="img/overlay_2.png" alt="#" class="footer_overlay">
    </footer>

    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <!-- jquery -->	
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>

    <script src="js/DOM/filtro.js"></script>


    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>