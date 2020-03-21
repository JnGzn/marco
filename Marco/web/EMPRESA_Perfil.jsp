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
        <h1>mi empresa!</h1>

        <%
            EmpresaDAO empDAO = new EmpresaDAO();
            HttpSession sesio = request.getSession();

            if (sesio == null | !request.isRequestedSessionIdValid()) {
                session.invalidate();

                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            String nit = (String) sesio.getAttribute("nit");
            EmpresaVO empVO = EmpresaDAO.ListarDatos(nit);

        %>

        <div class="row">
            <div class="ml-1 card shadow mb-4 col-md-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Info empresa</h6>
                </div>
                <div class="card-body">
                    <form method="post" action="Empresas">
                        <table>
                            <tr>
                                <td>logo</td>
                                <td>
                                    <img id="imgSalida2" src="<%= empVO.getLogo()%>" />

                                </td>
                            </tr>
                            <tr>
                                <td>Nit:</td>
                                <td><input type="text" name="nit" value="<%= empVO.getNit()%>"></td>
                            </tr>
                            <tr>
                                <td>Razón Social: </td>
                                <td><input type="text" name="nombre" value="<%= empVO.getRazonSocial()%>"></td>
                            </tr>

                            <tr>

                                <td>Correo Empresa:</td>
                                <td><input type="email" name="correo" value="<%= empVO.getCorreoEmpresa()%>"></td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="hidden" value="3" name="accion">
                                    <input type="submit" value="actualizar">
                                </td>
                            </tr>


                        </table>

                    </form>
                </div>
            </div>

            <div class="ml-1 card shadow mb-4 col-md-6">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Mis actividades</h6>
                </div>
                <div class="card-body">
                    <form method="post" action="Empresas">
                        <table border="1">
                            <tr>
                                <td>imagen</td>
                                <td>titulo</td>
                                <td>precio</td>
                                <td>cupos <br> disp.</td>
                            </tr>
                            
                            <tr>
                                
                                <td>
                                    <img id="imgSalida2" width="70" height="50" src="<%= empVO.getLogo()%>" />

                                </td>
                                <td>fdsdfsdfdsfddddddddddddddddddddddddddddddddfd</td>
                                <td>$4654</td>
                                <td>4</td>
                                <td><a href="">ver</a></td>
                            </tr>
                            
                         <% ActividadDAO actDAO = new ActividadDAO();

                           for (ActividadVO actVo1 : actDAO.ListarDatosNit(nit)) {
                                for (ActividadVO actVo : actDAO.ListarDatosID(actVo1.getId()))
                                {
                         %>

                        <tr>
                         
                            <td>     <img src="<%=   actVo.getImage1()%>" width="70" height="50"></td>
                            <td>        <%=   actVo.getTitulo()%></td>
                            <td> <%=  actVo.getPrecio()%> </td>
                            <td>        <%= actVo.getCupos()%></td>
                            <td> <a href="EMPRESA_Reserva.jsp?editar=<%=  actVo.getId()%>" >ver</a></td>

                        </tr>
                        <%}}%>

                        </table>

                    </form>
                </div>
            </div>
        </div>
        <a href="EMPRESA_AgregarCategoria.jsp">Agregar Categoria</a><br>
        <a href="EMPRESA_RegistrarLugar.jsp" >Agregar Lugar</a><br>
        <a href="EMPRESA_AgregarActividad.jsp" >Agregar Actividad</a><br>



        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
            </div>
            <div class="card-body">
                <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
                </div>
                <form action="CerrarSesion" method="post">
                    <input type="submit" value="cerrar">
                </form>
            </div>
        </div>



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



        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-area">
                        <!--
                            
                            <canvas id="myAreaChart"></canvas>
                        -->
                    </div>
                </div>
            </div>
        </div>
    </body>




    <%if (request.getAttribute("exito") != null) {%>
    ${exito}
    <%} else {%>

    ${error}
    <%}%>
</html>
