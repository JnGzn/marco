

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Marco</title>
    <link rel="StyleSheet" href="css/in.css">

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
                }else {
                    %>
                    <a class="btn_1 d-none d-lg-block border border-primary" href="USUARIO_Perfil.jsp">ver perfil</a>
                    <%
                }%>

<!--                        <a class="btn_1 d-none d-lg-block border border-primary" data-toggle="modal"
                            data-target="#exampleModalScrollable">Iniciar Sesión</a>-->
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h5>Los mejores momentos </h5>
                            <h1>en compañia de tus hijos</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- banner part start-->
    <section class="search_your_country">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="search_form">
                        <form action="#">
                            <div class="form-row">
                                <div class="col-lg-9">
                                    <div class="search_form_iner">
                                        <select class="custom_select" id="inlineFormCustomSelect">
                                            <option selected>zona</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                        <select class="custom_select" id="inlineFormCustomSelect1">
                                            <option selected>hora</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <a href="USUARIO_ListarActividades.jsp" class="search_btn">Buscar</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

    </section>
    <!-- banner part start-->

    <!-- feature_part start-->

    <!-- upcoming_event part start-->

    <!-- use sasu part end-->
    <section class="popular_place padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="section_tittle text-center">
                        <img src="img/section_tittle_img.png" alt="">
                        <h2>Actividades más <span>populares</span> </h2>
                        <p>Elegimos algunas de las actividades que mas disfrutan nuestros
                            usuarios</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="card-deck">
                    <div class="card col-lg-4 col-sm-6 single_popular_place">
                        <div class="container">

                            <img src="img/icon/friendship.png" alt="">
                            <h4>Actividades Grupales</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor</p>
                            <a href="#" class="btn1">Reservar Ahora!</a>
                        </div>

                    </div>
                    <div class="card col-lg-4 col-sm-6 single_popular_place">
                        <div class="container">

                            <img src="img/icon/difference.png" alt="">
                            <h4>Decide que quieres ser</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor</p>
                            <a href="#" class="btn1">Reservar Ahora!</a>
                        </div>

                    </div>
                    <div class="card col-lg-4 col-sm-6 single_popular_place">


                        <div class="container">

                            <img src="img/icon/family.png" alt="">
                            <h4>integracion familiar</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor</p>
                            <a href="#" class="btn1">Reservar Ahora!</a>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- use sasu part end-->

    <!-- about_us part start-->
    <section class="place_details section_padding">
        <div class="container-fluid">
            <div class="row justify-content-between">
                <div class="col-md-6 col-lg-6">
                    <div class="place_detauls_text">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <div class="place_details_content">
                                    <img src="img/section_tittle_img.png" alt="#">
                                    <h2>Galeria</h2>
                                    <p> Adentrate en nuestra galeria y aprecia algunas de las actividades
                                        de nuestras empresas afiliadas, no lo pienses tanto y reserva ya. </p>
                                    <span>"Breve descripcion de las imagenes que quedaran fijadas"</span>
                                </div>
                            </div>
                        </div>
                        <img src="img/plase_details_1.png" alt="#">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="place_details_img">
                        <img src="img/plase_details_2.png" alt="#">
                    </div>
                </div>
            </div>
        </div>
        <div class="view_all_btn">
            <a href="#" class="view_btn">Ver todo</a>
        </div>
    </section>
    <!-- about_us part end-->

    <!-- 
    <section class="tour_package section_padding">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-6 col-sm-6">
                    <div class="tour_package_cotent owl-carousel">
                        <div class="single_tour_package">
                            <img src="img/tour_plan_1.png" alt="">
                            <div class="tour_pack_content">
                                <h4>Sawpalo, Brasil</h4>
                                <p> Lorem ipsum dolor sit amet, consectetur adipi
                                    elit sed do eiusmod tempor incididunt</p>
                                <div class="tour_content_rating">
                                    <ul>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                    </ul>
                                    <a href="#" class="btn1">join now</a>
                                </div>
                            </div>
                        </div>
                        <div class="single_tour_package">
                            <img src="img/tour_plan_2.png" alt="">
                            <div class="tour_pack_content">
                                <h4>Sawpalo, Brasil</h4>
                                <p> Lorem ipsum dolor sit amet, consectetur adipi
                                    elit sed do eiusmod tempor incididunt</p>
                                <div class="tour_content_rating">
                                    <ul>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                    </ul>
                                    <a href="#" class="btn1">join now</a>
                                </div>
                            </div>
                        </div>
                        <div class="single_tour_package">
                            <img src="img/tour_plan_1.png" alt="">
                            <div class="tour_pack_content">
                                <h4>Sawpalo, Brasil</h4>
                                <p> Lorem ipsum dolor sit amet, consectetur adipi
                                    elit sed do eiusmod tempor incididunt</p>
                                <div class="tour_content_rating">
                                    <ul>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                    </ul>
                                    <a href="#" class="btn1">join now</a>
                                </div>
                            </div>
                        </div>
                        <div class="single_tour_package">
                            <img src="img/tour_plan_2.png" alt="">
                            <div class="tour_pack_content">
                                <h4>Sawpalo, Brasil</h4>
                                <p> Lorem ipsum dolor sit amet, consectetur adipi
                                    elit sed do eiusmod tempor incididunt</p>
                                <div class="tour_content_rating">
                                    <ul>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        <li><a href="#"><i class="fas fa-star"></i></a></li>
                                    </ul>
                                    <a href="#" class="btn1">join now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-xl-3 offset-lg-1 col-sm-6">
                    <div class="tour_pack_content">
                        <img src="img/section_tittle_img.png" alt="">
                        <h2>tour package</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit 
                        sed  do eiusmod tempor incididunt ut</p>
                        <a href="#" class="btn_1">join now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    pricing part start-->
    <!-- pricing part end-->

    <!-- cta part start-->
    <section class="cta_part section_padding">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-8 col-xl-7">
                    <div class="cta_text text-center">
                        <h5>Suscribete a nuestro Boletín</h5>
                        <h2>Suscribete y estarás al día con nuestras ofertas</h2>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Ingrese su correo"
                                aria-label="Recipient's username with two button addons"
                                aria-describedby="button-addon4">
                            <div class="input-group-append" id="button-addon4">
                                <a href="#" class="subs_btn">suscribirse</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="col-lg-8">
            <div class="copyright_text">
                <P class="p-tamano">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is
                    made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com"
                        target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </P>
            </div>
        </div>
        <!-- <div class="col-lg-4">
                    <div class="footer_icon social_icon">
                        <ul class="list-unstyled">
                            <li><a href="#" class="single_social_icon"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" class="single_social_icon"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" class="single_social_icon"><i class="fas fa-globe"></i></a></li>
                            <li><a href="#" class="single_social_icon"><i class="fab fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div> -->
    </div>


    <!-- <img src="img/overlay_2.png" alt="#" class="footer_overlay"> -->
    </footer>
    <!--::footer_part end::-->

 

        
        
        
        

        <div class="header">
            <div class="header_logo">
                <img src="image/logo.png"/>
            </div
            <nav class="nav">
                <ul>
                    <li>xxx</li>
                </ul>

            </nav>   

            <h1>MARCO!</h1>
            

            <a href="USUARIO_Registro.jsp">registro usuario</a><br>


            <a href="EMPRESA_Registro.jsp" >Agregar EMPRESA</a><br>


            <br>
            <br>
            <br>
            <a href="EMPRESA_ListarCategoria.jsp" >categorias</a><br>

            <a href="EMPRESA_ListarEmpresa.jsp" >empresas</a><br>
            <a href="EMPRESA_ListarLugar.jsp" >lugares</a><br>
            <a href="USUARIO_ListarUsuarios.jsp" >usuarios</a><br>

            </body>
            </html>
