<%-- 
    Document   : EMPRESA_AgregarActividad
    Created on : 13-nov-2019, 22:46:05
    Author     : jngzn
--%>

<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<%@page import="modelo.vo.EmpresaVO"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page import="modelo.dao.EmpresaDAO"%>
<%@page import="modelo.vo.LugarVO"%>
<%@page import="modelo.vo.CategoriaVO"%>
<%@page import="modelo.dao.LugarDAO"%>
<%@page import="modelo.dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>


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
        <link rel="stylesheet" href="css/swiper.min.css">

        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css">


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


        <div class="row">




            <div class="card-body">
                <div class="">
                    <%                                        empDAO = new EmpresaDAO();
                        sesion = request.getSession();
                        sesionn = sesion.getAttribute("nit");
                        String actividad = request.getParameter("actividad");
                        if (sesionn == null || actividad == null) {
                    %>
                    <a href="USUARIO_IniciarSesion.jsp">inicia seison</a>
                    <%
                    } else {
                        String idEmp = (String) sesion.getAttribute("nit");
                        empVO = empDAO.ListarDatos(idEmp);
                        ActividadDAO actiDAO = new ActividadDAO();
                        ActividadVO actiVO = actiDAO.ListarDatos(actividad);
                        if (actiVO != null) {
                    %>

                    <%            // CategoriaDAO categoriaDAO = new CategoriaDAO();
                        LugarDAO lugarDAO = new LugarDAO();
                    %>
                    <form name="form" action="Actividad" method="post" enctype="multipart/form-data" id="formEditarReserva">
                        <div class="card border-left-success shadow col-md-10">
                            <div class="card-body col-md-10 mx-auto">
                                <br>    
                                <div class="row">
                                    <div class="col mr-2 col-auto mx-auto" >
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1 h3 mx-">Edita tu actividad</div>
                                    </div>
                                </div>
                                <br><br>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="text-input">Titulo</label>
                                    <div class="col-md-9">
                                        <input  class="form-control" value="<%= actiVO.getTitulo()%>" type="text" id="titulo" name="titulo" placeholder="titulo...">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="text-input">Descripcion</label>
                                    <div class="col-md-9">
                                        <textarea  class="form-control" rows="5"  value="<%= actiVO.getDescripcion()%>" type="text" name="descripcion" placeholder="descripcion" id="descripcion">
                                            <%= actiVO.getDescripcion()%>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card border-left-success shadow col-md-10">
                            <div class="card-body col-md-10 mx-auto">
                                <div class="row">


                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success  mb-1 h5">Escoge las mejores fotos</div>
                                    </div>
                                </div>

                                <br><br>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <input class="btn" name="imagen1"  id="imagen1" type="file" />
                                    </div>
                                    <div class="col-md-4">
                                        <img id="imgSalida1" width="100%" height="140" src="<%= actiVO.getImage1() %>" />

                                    </div>

                                    <div class="col-md-2">
                                        <input class="btn" name="imagen2"  id="imagen2" type="file" />
                                    </div>
                                    <div class="col-md-4">
                                        <img id="imgSalida2" width="100%" height="140" src="<%= actiVO.getImage2() %>" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-2 ">
                                        <input class="btn" name="imagen3"  id="imagen3" type="file" >
                                    </div>
                                    <div class="col-md-4">
                                        <img id="imgSalida3" width="100%" height="140" src="<%= actiVO.getImage3() %>" />
                                    </div>

                                    <div class="col-md-2">
                                        <input class="btn" name="imagen4"  id="imagen4" type="file" />
                                    </div>
                                    <div class="col-md-4">
                                        <img id="imgSalida4" width="100%" height="140" src="<%= actiVO.getImage4() %>" />
                                    </div>
                                </div>

                            </div>
                        </div>  

                        <div class="card border-left-success shadow col-md-10">
                            <div class="card-body col-md-10 mx-auto">
                                <div class="row">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success  mb-1 h5">Detalles</div>
                                    </div>
                                </div>
                                <br><br>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="text-input">Fecha</label>
                                    <div class="col-md-4">
                                        <input  class="form-control date" type="date" name="fecha" value="<%= actiVO.getFecha()%>" placeholder="fecha" id="fecha" >
                                    </div>
                                    <label class="col-md-2  col-form-label" for="text-input"> Hora</label>
                                    <div class="col-md-4">
                                        <input  class="form-control time" type="time" value="<%= actiVO.getHora()%>" name="hora" placeholder="hora" id="hora">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="text-input">Duracion</label>
                                    <div class="col-md-4">
                                        <input  class="form-control" type="number" name="duracion"  value="<%= actiVO.getDuracion()%>" placeholder="duracion", id="duracion">
                                    </div>
                                    <label class="col-md-2 col-form-label" for="text-input">Cupos</label>
                                    <div class="col-md-4">
                                        <input  class="form-control" type="number" name="cupos" value="<%= actiVO.getCupos()%>" placeholder="cupos" id="cupos">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 col-form-label" for="text-input">Lugar</label>
                                    <div class="col-md-4">
                                        <select  class="form-control" name="lugar" value="<%= actiVO.getLugar()%>" id="lugar">
                                            <option>LUGAR</option>
                                            <% for (LugarVO lugarVO : lugarDAO.ListarDatos(idEmp)) {
                                                    if (lugarVO != null) {
                                            %>
                                            <option value="<%= lugarVO.getIdLugar()%>"><%= lugarVO.getDireccionLugar()%></option>
                                            <%  } }%>
                                        </select>
                                        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#registrolugar" 
                                                data-whatever="@mdo">
                                            agregar otro lugar
                                        </button>
                                    </div>
                                    <label class="col-md-2 col-form-label" for="text-input">Categoria</label>
                                    <div class="col-md-4">
                                        <select class="form-control" name="categoria" id="categoria">
                                            <option>CATEGORIA</option>
                                            <% for (CategoriaVO categoriaVO : CategoriaDAO.ListarDatos(idEmp)) {
                                                    if (categoriaVO != null) {
                                            %>
                                            <option value="<%= categoriaVO.getIdCategoria()%>"><%= categoriaVO.getNomCategoria()%></option>
                                            <%}
                                                                }%>
                                        </select>
                                        <button type="button" class="btn btn-link" data-toggle="modal"
                                                data-target="#modalCategoria" data-whatever="@mdo">
                                            agregar otra categoria
                                        </button>
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <label class="col-md-2 col-form-label" for="text-input">Precio</label>
                                    <div class="col-md-4">
                                        <input  class="form-control" type="number" name="precio" value="<%= actiVO.getPrecio()%>" placeholder="precio" id="precio">
                                    </div>
                                    <label class="col-md-2 col-form-label" for="text-input">Descuento</label>
                                    <div class="col-md-4">
                                        <input  class="form-control" type="number" name="descuento" value="<%= actiVO.getDescuento()%>" placeholder="precio" id="precio">
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <div class="col-md-4">
                                        <input type="hidden" value="2" name="accion">
                                        <input class="btn btn-primary" type="submit" value="Editar">
                                    </div>
                                    <div class="col-md-8">
                                        <p class="col-8 mx-auto text-danger" id="errorActiv"></p>
                                    </div>
                                </div>
                                <a href="EMPRESA_Actividades.jsp">VOLVER</a>
                            </div>
                        </div>
                        <input type="hidden" id="name1" name="name1" value="">
                        <input type="hidden" id="name2" name="name2" value="">
                        <input type="hidden" id="name3" name="name3" value="">
                        <input type="hidden" id="name4" name="name4" value=""> 
                        <input type="hidden" id="estado" name="estado" value="activo">
                        <input type="hidden"  name="idActiv" value="<%= actiVO.getId()%>">
                    </form>
                </div> 
            </div>
        </div>

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Marco 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->



        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>


        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="js/calc/cargarImagen.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
        <script src="js/validaciones/actividad.js" type="text/javascript"></script>
        <script src="js/DOM/reserva.js" type="text/javascript"></script>
        <% }
            }%>
    </body>
</html>
