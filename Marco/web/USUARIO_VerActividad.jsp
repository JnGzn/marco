<%@page import="modelo.dao.EmpresaDAO"%>
<%@page import="modelo.vo.EmpresaVO"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


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
                           <%     HttpSession sesion = request.getSession();
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
                            data-target="#exampleModalScrollable">Iniciar SesiÃ³n</a>-->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        
        <section class="banner_part2">
            <%
           String id = (String) request.getParameter("actividad");
            if (id != null) {

                ActividadDAO actiDAO = new ActividadDAO();
                ActividadVO actiVO = actiDAO.ListarDatos(id);
                if (actiVO.getId() != null) {
                        
                    
                
          %>
          <input type="hidden" value="<%=id%>" id="actividad">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img width="100%" height="440" class="d-block w-100" src="<%= actiVO.getImage1() %>" alt="First slide">
          </div>
          <div class="carousel-item">
            <img width="100%" height="440" class="d-block w-100" src="<%= actiVO.getImage2() %>" alt="Second slide">
          </div>
          <div class="carousel-item">
              <img width="100%" height="440" class="d-block w-100" src="<%= actiVO.getImage3() %>" alt="Third slide">
          </div>
          <div class="carousel-item">
              <img width="100%" height="440" class="d-block w-100" src="<%= actiVO.getImage4() %>" alt="Third slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    
    
    
    
    
</div>
<br>



<div class="container" id="container">
    <div class="row co-12">
        <div  class="card border-left-success mx-4 shadow col-md-8" >
            <div class="card-body col-md-12 mx-auto">
                <br>
                <div class="page-header header-filter clear-filter purple-filter" data-parallax="true" style="background-image: url('./assets/img/bg2.jpg');">
                    <div class="container">
                        <div class="row">
                        <div class="col-md-8 ml-auto mr-auto">
                          <div class="brand">
                            <h1><%=  actiVO.getCategoria() %></h1>
                            <h3> <%=  actiVO.getTitulo() %> </h3>
                          </div>
                        </div>
                        <div class="col-md-2S ml-auto mr-auto">
                            <br>
                            <button type="button" class="btn btn-outline-primary" onclick="reservar()">Reservar</button>

                        </div>
                      </div>
                    </div>
                  </div>
    
                  <br><br>
                  
                <hr>
                <br>
            <div class="col-12 row">
                    <label class="col-md-2" for="text-input">Fecha:</label>
                    <div class="col-md-4">
                        <label class="h5 mb-0 font-weight-bold text-gray-800"> <%= actiVO.getFecha() %> </label>
                    </div>
                    <label class="col-md-2" for="text-input">Precio:</label>
                    <div class="col-md-4">
                        <label class="h5 mb-0 font-weight-bold text-gray-800">$ <%= actiVO.getPrecio() %> </label>
                    </div>
            </div>
            <br>
            <div class="col-12 row">
                <label class="col-md-2" for="text-input">Zona:</label>
                <div class="col-md-4">
                    <label class="h5 mb-0 font-weight-bold text-gray-800"> <%= actiVO.getZona()%> </label>

                </div>
                <label class="col-md-2" for="text-input">Direccion:</label>

                <div class="col-md-4">
                    <label class="h5 mb-0 font-weight-bold text-gray-800"> <%= actiVO.getDireccion()%> </label>
                </div>
            </div>
            <br>
            <div class="col-12 row">
                <label class="col-md-2" for="text-input">Hora estimada:</label>
                <div class="col-md-4">
                    <label class="h5 mb-0 font-weight-bold text-gray-800"> <%= actiVO.getHora()%> </label>
                </div>
                <label class="col-md-2" for="text-input">Duracion estimada:</label>
                <div class="col-md-4">
                    <label class="h5 mb-0 font-weight-bold text-gray-800"><%= actiVO.getDuracion() %> h</label>
                </div>
            </div>
            <br>
            <div class="col-12 row">
                <label class="col-md-2" for="text-input">Descripcion:</label>
                <div class="col-md-8">
                    <label class="text-justify mb-0 font-weight-bold text-gray-800">
                        <%= actiVO.getDescripcion() %>
                    </label>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="card  shadow mx-4 col-md-3">
        <div class="card-body col-md-10 mx-auto">
            <br>    
            <div class="row">
                <div class="col mr-2 col-auto mx-auto" >
                    <div class="text-xs font-weight-bold text-justify text-success mb-1 h5">Organizado por: </div>
                </div>
            </div>
            <hr>
            
<%
    EmpresaDAO empDAO = new EmpresaDAO();
    EmpresaVO emp = empDAO.ListarDatos(actiVO.getIdEmpresa()) ;
%>
            <div class="form-group row mx-auto">
                <label class="col-md-9 col-form-label" for="text-input">  <%= emp.getRazonSocial() %> </label>
                
            </div>
            <div class="form-group row"  >
                <div class="col-md-10 mx-auto" >
                    <img src="<%= emp.getLogo()%>" height="100" width="100%" alt="">
                </div>
            </div>
            <div class="form-group row"  >
                <label class="col-md-9 col-form-label" for="text-input">calificacio³n</label>
                <div class="col-md-10 mx-auto" >
                    <img src="img/icon/estrella.png" width="20" alt="">
                    <img src="img/icon/estrella.png" width="20" alt="">
                    <img src="img/icon/estrella.png" width="20" alt="">
                    <img src="img/icon/estrella.png" width="20" alt="">
                    <img src="img/icon/estrella2.png" width="15" alt="">
                </div>
            </div>
        </div>
    </div>   
    
    <br><br>

    <br><br>
</div>
    <%}else{%>
    <a href="USUARIO_ListarActividades.jsp"> ver actividades </a>
    <%}}else{
request.getRequestDispatcher("USUARIO_ListarActividades.jsp").forward(request, response);
}
    %>
</section>
    <script type="text/javascript" src="js/DOM/reserva.js"></script>

      <script type="text/javascript" src="js/jquery-3.3.1.slim.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/popper.min.js"></script>
<script src="js/owl.carousel.min.js"></script>

<script src="js/bootstrap.min.js"></script>
</body>
</html>