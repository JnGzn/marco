<%-- 
    Document   : EMPRESA_AC
    Created on : 21-nov-2019, 21:36:53
    Author     : jngzn
--%>

<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <!-- Header part end-->

	<!-- breadcrumb start-->
	<!-- <section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2>elements</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- breadcrumb start-->

	<!-- Start Sample Area -->
	
	<!-- End Sample Area -->

	

	<!-- Start Align Area -->
	<section>
	
		<div class="container my-auto" style="padding-top: 140px; background: blue all;">
 
			<div class="section">
				<h3 class="mb-30">Resultados de la búsqueda</h3>
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="titulo">Titulo</div>
							<div class="description">Descripción</div>
							<div class="country">Zona</div>
							<div class="visit">cupos</div>
							<div class="percentage">Imagen</div>
							<div class="reserva">Reservar</div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??
								Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??
								Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??Lorem Ipsum??
							</div>
							<div class="country">Norte</div>
							<div class="visit">64</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQn18dVK2lCinthPGgJq_IYE7J3hXcosVvS8dD7dRwqKiUBKgCm"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??</div>
							<div class="country">Centro</div>
							<div class="visit">645</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRaHVQCAgYRkLCqeEEQ9Du2QaQcqK-7wFwg6nxrm52C9KyFcMSb"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??</div>
							<div class="country">Oriente</div>
							<div class="visit">1122334</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTR2qBxWpzw2F59erLLtuh4Gd-WoXbw0UGdKmqT8K7Wv7X6rIM1"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??</div>
							<div class="country">Centro</div>
							<div class="visit">64503</div>
							<div class="Imagen"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRaHVQCAgYRkLCqeEEQ9Du2QaQcqK-7wFwg6nxrm52C9KyFcMSb" ></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??</div>
							<div class="country">Occidente</div>
							<div class="visit">64503</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQn18dVK2lCinthPGgJq_IYE7J3hXcosVvS8dD7dRwqKiUBKgCm"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??</div>
							<div class="country">Oriente</div>
							<div class="visit">6450</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTR2qBxWpzw2F59erLLtuh4Gd-WoXbw0UGdKmqT8K7Wv7X6rIM1"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo">BLAblablA</div>
							<div class="description">Lorem Ipsum??</div>
							<div class="country">Sur</div>
							<div class="visit">645</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQn18dVK2lCinthPGgJq_IYE7J3hXcosVvS8dD7dRwqKiUBKgCm"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
						<div class="table-row">
							<div class="titulo"> BLAblablA </div>
							<div class="description"> Lorem Ipsum?? </div>
							<div class="country">Norte</div>
							<div class="visit">64</div>
							<div class="Imagen"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQn18dVK2lCinthPGgJq_IYE7J3hXcosVvS8dD7dRwqKiUBKgCm"></div>
							<div class="reserva"><a href="#" class="btn1">Reservar Ahora!</a></div>
						</div>
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <h1>actividades</h1>
        <table>
            <tr>
                <th>foto</th>
                <th>titulo</th>
                <th>descripcion</th>
                <th>precio</th>
            </tr>
          
             
             
            <% ActividadDAO actDAO = new ActividadDAO();

                for (ActividadVO actVo : actDAO.ListarDatos()) {%>

            <tr>
                <td>      <img src="<%=   actVo.getImage1()%>" width="70" height="50"> </td>
                <td>        <%=   actVo.getTitulo()%></td>
                <td>        <%= actVo.getDescripcion()%></td>
                <td> <%=  actVo.getPrecio()%> </td>
                <td> <a href="USUARIO_Reserva.jsp?reservar=<%=  actVo.getId()%>" >reservar</a></td>

            </tr>
            <%}%>
        </table>
        <a href="sfsad" me
    </body>
</html>
