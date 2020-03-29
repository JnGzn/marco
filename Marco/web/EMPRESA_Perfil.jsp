<%-- 
    Document   : PerfilEmpresa
    Created on : 26-sep-2019, 23:16:42
    Author     : jngzn
--%>

<%@page import="modelo.dao.ActividadDAO"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.vo.EmpresaVO"%>
<%@page import="modelo.dao.EmpresaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Admin | Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <%
            HttpSession sesion = request.getSession();
            Object sesionn = sesion.getAttribute("nit");

            Object sesionadmin = sesion.getAttribute("id");

            boolean emp = false;
            boolean admnin = false;

            EmpresaDAO empDAO;
            EmpresaVO empVO;

            String admn = "";
            String nit = "";

            if (sesionn != null) {
                nit = (String) sesion.getAttribute("nit");
                emp = true;
            }
            if (sesionadmin != null) {
                admn = (String) sesion.getAttribute("id");
                admnin = true;
            }

            empDAO = new EmpresaDAO();
            empVO = EmpresaDAO.ListarDatos(nit);


        %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center">
                    <div class="sidebar-brand-icon">
                        <% if (admnin) {%>
                        <img src="img/logo.png" width="100%" height="100%" alt="logo" >
                        <% }%>


                    </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interfaz
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Administrar</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Componentes:</h6>
                            <a class="collapse-item" href="buttons.html">Empresas</a>
                            <a class="collapse-item" href="cards.html">Actividades</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Usuarios</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Componentes:</h6>
                            <a class="collapse-item" href="utilities-color.html">Activar</a>
                            <a class="collapse-item" href="utilities-border.html">Desactivar</a>
                            <a class="collapse-item" href="utilities-animation.html">Bloquear</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Adicionales
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pagos</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Componentes:</h6>
                            <a class="collapse-item" href="login.html">Realizados</a>
                            <a class="collapse-item" href="register.html">Por Pagar</a>
                            <a class="collapse-item" href="forgot-password.html">En Mora</a>
                        </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Estadisticas</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Tablas</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Buscar por..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Notificaciones
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">Abtil 13, 2020</div>
                                            <span class="font-weight-bold">Un nuevo reporte mensual esta listo para descargar!</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">Abril 7, 2020</div>
                                            $420.000 han sido depositados en su cuenta!
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">Abril 2, 2020</div>
                                            Alerta de gastos: hemos notado gastos inusualmente altos en su cuenta.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Mostrar todas las Notificaciones</a>
                                </div>
                            </li>

                            <!-- Nav Item - Messages -->



                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <% if (emp) {%>

                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= empVO.getRazonSocial()%></span>
                                    <%}%>

                                    <% if (admnin) {%>
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Juan Garzon</span>
                                    <%}%>


                                    <% if (emp && empVO.getLogo() != null) {%>
                                    <img class="img-profile rounded-circle" src="<%= empVO.getLogo()%>">
                                    <% } else if (admnin) {%>
                                    <img class="img-profile rounded-circle" src="image/logo.png">
                                    <%} else {%>
                                    <img class="img-profile rounded-circle" src="https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-pure-color-watercolor-graffiti-gradient-background-board-design-board-design-image_66713.jpg">
                                    <%}%>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <%if (emp) {%>
                                    <a class="dropdown-item" href="EMPRESA_Perfil.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Perfil
                                    </a>
                                    <% }%>
                                    <!--                                    <a class="dropdown-item" href="#">
                                                                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                                                            Ajustes
                                                                        </a>-->
                                    <%if (emp) {%>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Actividades
                                    </a>
                                    <% }%>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="CerrarSesion" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Salir
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <%
                        empDAO = new EmpresaDAO();
                        HttpSession sesio = request.getSession();

                        if (sesio == null | !request.isRequestedSessionIdValid()) {
                            session.invalidate();

                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }

                        nit = (String) sesio.getAttribute("nit");
                        empVO = EmpresaDAO.ListarDatos(nit);

                    %>

                    <div class="row">
                        <div class="ml-1 card shadow mb-4 col-md-5">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Info empresa</h6>
                            </div>
                            <div class="card-body">
                                <form method="post" action="Empresas">
                                    <div class="form-group row">
                                        <label class="col-md-3 col-form-label" for="text-input">Nit</label>
                                        <div class="col-md-9">
                                            <input  class="form-control" type="text" name="nit" value="<%= empVO.getNit()%>" placeholder="nit...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 col-form-label" for="text-input">Razon social</label>
                                        <div class="col-md-9">
                                            <input  class="form-control"type="text" name="nombre" value="<%= empVO.getRazonSocial()%>" placeholder="nit...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 col-form-label" for="text-input">Correo</label>
                                        <div class="col-md-9">
                                            <input  class="form-control"type="email" name="correo" value="<%= empVO.getCorreoEmpresa()%>" placeholder="nit...">
                                        </div>
                                    </div>

                                    <div class="my-1 row">
                                        <div class="col-8">

                                        </div>
                                        <div class="col-2">
                                            <input type="hidden" value="3" name="accion">
                                            <button class="btn btn-secondary">Guardar</button>
                                        </div>
                                    </div>

                                </form>
                                <%if (request.getAttribute("exito") != null) {%>
                                ${exito}
                                <%} else {%>

                                ${error}
                                <%}%>
                                
                            </div>
                        </div>


                        <div class="ml-5 card shadow mb-4 col-md-6">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Logo</h6>
                            </div>
                            <div class="card-body">
                                <form form method="post" action="Empresas" enctype="multipart/form-data" id="EmpresaLogo">
                                    <div class="row col-auto mx-auto">
                                        <input type="file" name="imagen" id="imagenLogo">
                                        <input type="hidden" name="nomLogo" id="name1" value="">
                                    </div>
                                    <div class="my-1 row col-auto mx-auto">
                                        <div class="col-6 mx-auto">
                                            <img src="<%= empVO.getLogo()%>" id="imgSalida1" width="100%" height="180">
                                        </div>
                                    </div>
                                    <div class="my-1 row">
                                        <div class="col-9">

                                        </div>
                                        <div class="col-2">
                                            <input type="hidden" value="4" name="accion">
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                </form>
                                <p id="errorCarga"></p>
                            </div>
                        </div>
                    </div>
                    <a href="EMPRESA_AgregarCategoria.jsp">Agregar Categoria</a><br>
                    <a href="EMPRESA_RegistrarLugar.jsp" >Agregar Lugar</a><br>
                    <a href="EMPRESA_AgregarActividad.jsp" >Agregar Actividad</a><br>







                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Earnings (Annual)</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>





                </div>
            </div>

            <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
            <script type="text/javascript" src="js/jquery.validate.min.js"></script>
            <script src="js/calc/cargarImagen.js" type="text/javascript"></script>
            <script src="js/validaciones/empresa.js" type="text/javascript"></script>
            
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="js/sb-admin-2.min.js"></script>
            <script src="vendor/chart.js/Chart.min.js"></script>
            <script src="js/demo/chart-area-demo.js"></script>
            <script src="js/demo/chart-pie-demo.js"></script>
    </body>






</html>
