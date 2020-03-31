<%@page import="modelo.dao.LugarDAO"%>
<%@page import="modelo.vo.LugarVO"%>
<%@page import="modelo.dao.CategoriaDAO"%>
<%@page import="modelo.vo.CategoriaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<%@page import="modelo.vo.EmpresaVO"%>
<%@page import="modelo.dao.EmpresaDAO"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Marco</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/listar.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
    <a href="sass/_variables.scss"></a>
    <link rel="stylesheet" href="css/slick.css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<link href="css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>
<link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
<link href="css/slick.css" rel="stylesheet" type="text/css"/>

<body id="page-top">
    <%
        HttpSession sesion = request.getSession();
        Object sesionn = sesion.getAttribute("nit");
        Object sesionadmin = sesion.getAttribute("id");

        boolean emp = false;
        boolean admnin = false;

        EmpresaDAO empDAO;
        EmpresaVO empVO;

        UsuarioDAO usuDAO;
        UsuarioVO usuVO;

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
        usuDAO = new UsuarioDAO();
        usuVO = usuDAO.listarDatos(admn);

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
                <a class="nav-link" href="Admin.jsp">
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
                        <%if (admnin) { %>

                        <a class="collapse-item" href="buttons.html">Empresas</a>
                        <%}%>
                        <%if (emp) { %>
                        <a class="collapse-item" href="EMPRESA_Actividades.jsp">Actividades</a>
                        <a class="collapse-item" href="EMPRESA_complementos.jsp">Categorias y lugares</a>

                        <%}%>

                    </div>
                </div>
            </li>
            <%if (admnin) {    %>
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
            <%}%>
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-lg-6">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">

                                <div class="card-header py-3">
                                    <div class="row">

                                        <h4 class="m-0 font-weight-bold text-primary col-4">Mis categorias</h4>

                                        <button type="button" class="btn btn-outline-info info col-4" data-toggle="modal"
                                                data-target="#modalCategoria" data-whatever="@mdo">
                                            agregar otra categoria
                                        </button>

                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
                                    </div>

                                    <table border="1" class="col-12"> 
                                        <tr>
                                            <th class="col-4 mx-auto">id</th>
                                            <th class="col-4">nombre categoria</th>
                                            <th class="col-4">empresa</th>

                                        </tr>
                                        <% CategoriaDAO catDAO = new CategoriaDAO();
                                            ArrayList<CategoriaVO> arrEmpresaVO = catDAO.ListarDatos(empVO.getNit());
                                            CategoriaVO catVo = null;
                                            for (int i = 0; i < arrEmpresaVO.size(); i++) {

                                                catVo = arrEmpresaVO.get(i);

                                        %>

                                        <tr>
                                            <td>       <%= catVo.getIdCategoria()%></td>
                                            <td>        <%= catVo.getNomCategoria()%></td>
                                            <td>        <%= catVo.getIdEMCategoria()%></td>

                                        </tr>
                                        <%}%>
                                    </table>

                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">

                                <div class="card-header py-3">
                                    <div class="row">

                                        <h4 class="m-0 font-weight-bold text-primary col-4">Mis Lugares</h4>
                                        <button type="button" class="btn btn-outline-info info col-4" data-toggle="modal" data-target="#registrolugar" 
                                                data-whatever="@mdo">
                                            agregar otro lugar
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
                                    </div>

                                    <table border="1" class="col-12">
                                        <tr>
                                            <th class="col-2">id</th>
                                            <th class="col-2">direccion</th>
                                            <th class="col-2">zona</th>
                                            <th class="col-2">aforo</th>
                                            <th class="col-2">empresa</th>

                                        </tr>
                                        <% LugarDAO lugDAO = new LugarDAO();
                                            ArrayList<LugarVO> arrEmpresaVO1 = lugDAO.ListarDatos(empVO.getNit());
                                            LugarVO lugVo = null;
                                            for (int i = 0; i < arrEmpresaVO1.size(); i++) {

                                                lugVo = arrEmpresaVO1.get(i);

                                        %>

                                        <tr>
                                            <td>       <%= lugVo.getIdLugar()%></td>
                                            <td>        <%= lugVo.getDireccionLugar()%></td>
                                            <td>        <%= lugVo.getZonaLugar()%></td>
                                            <td>        <%= lugVo.getAforoLugar()%></td>
                                            <td>        <%= lugVo.getIdEmp()%></td>

                                        </tr>
                                        <%}%>
                                    </table> 


                                </div>
                            </div>
                        </div>


                    </div>


                </div>

            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->
    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Marco 2020</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->
</div>
<!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Listo para Salir?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">X</span>
                </button>
            </div>
            <div class="modal-body">
                Desea finalizar su sesion actual.
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="CerrarSesion">Cerrar sesion</a>
            </div>
        </div>
    </div>
</div>



<!--modal lugar-->

<div class="modal fade" id="registrolugar" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New Zona</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="Lugar" id="formLugar">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Direccion:</label>
                        <input class="form-control" id="ctxDirecion" type="text" name="txtAddress">
                    </div>

                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Zona:</label>
                        <input class="form-control" id="ctxZona" type="text"name="txtZone">
                    </div>



                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Aforo</label>
                        <input class="form-control" id="recipient-name" id="ctxAforo" type="number" name="txtQuantity">
                    </div>
                    <p class="text-danger col-auto mx-auto" id="errLugar"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <input type="hidden" value="1" name="opcion">
                <input type="submit" class="btn btn-primary" value="Guardar">
            </div>
            </form>
        </div>
    </div>
</div>

<!--modal categoria-->
<div class="modal fade" id="modalCategoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">agregar otra categoria</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="Categoria" method="post" id="formCategora">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">nombre categoria</label>
                        <input type="text" name="nombres"class="form-control" id="ctxNombre">
                    </div>
                    <p id="errorCat" class="text-danger" ></p>
            </div>
            <div class="modal-footer">
                <a  href="EMPRESA_AgregarActividad.jsp" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</a>

                <input type="hidden" name="accion" value="3">
                <input class="btn btn-primary" type="submit" value="Guardar">
            </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script src="js/calc/cargarImagen.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
        <script src="js/DOM/reserva.js" type="text/javascript"></script>
</body>

</html>
