<%-- 
    Document   : EMPRESA_AgregarActividad
    Created on : 13-nov-2019, 22:46:05
    Author     : jngzn
--%>

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
        <link rel="stylesheet" href="css/swiper.min.css">

        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>







        <header class="main_menu home_menu upperHead pb-3">
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
                            <a class="btn_1 d-none d-lg-block border border-primary" href="USUARIO_IniciarSesion.jsp">Iniciar Sesión</a> 

                            <!--                        <a class="btn_1 d-none d-lg-block border border-primary" data-toggle="modal"
                                data-target="#exampleModalScrollable">Iniciar Sesión</a>-->

                        </nav>
                    </div>
                </div>
            </div>
        </header>



        <br><br><br>



        <div class="">
            <%

                EmpresaDAO empDAO = new EmpresaDAO();
                HttpSession sesion = request.getSession();
                Object sesionn = sesion.getAttribute("nit");

                if (sesionn == null) {
            %>
            <a href="USUARIO_IniciarSesion.jsp">inicia seison</a>
            <%
            } else {

                String idEmp = (String) sesion.getAttribute("nit");

                EmpresaVO empVO = empDAO.ListarDatos(idEmp);

            %>


            <%            // CategoriaDAO categoriaDAO = new CategoriaDAO();
                LugarDAO lugarDAO = new LugarDAO();
            %>

            <br>


            <div class=" row col-8 mx-auto">
                <div class="col-3">
                    <img src="<%=  empVO.getLogo()%>" >
                </div>
                <div class="col-9">
                    <h2> <%=  empVO.getRazonSocial()%> </h2>
                </div>
            </div>
            <br>
            <br>

            <form name="form" action="Actividad" method="post" enctype="multipart/form-data" id="formCrearReserva">


                <div class="card border-left-success shadow col-md-10">
                    <div class="card-body col-md-10 mx-auto">
                        <br>    
                        <div class="row">
                            <div class="col mr-2 col-auto mx-auto" >
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1 h3 mx-">Registra tu actividad</div>
                            </div>
                        </div>
                        <br><br>



                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="text-input">Titulo</label>
                            <div class="col-md-9">
                                <input  class="form-control" type="text" id="titulo" name="titulo" placeholder="titulo...">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="text-input">Descripcion</label>
                            <div class="col-md-9">
                                <textarea  class="form-control" rows="5" type="text" name="descripcion" placeholder="descripcion" id="descripcion"></textarea>
                            </div>
                        </div>



                    </div>
                </div>

                <div class="card border-left-success shadow col-md-10" id="div1">
                    <div class="card-body col-md-10 mx-auto">
                        <div class="row">


                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success  mb-1 h5">Escoge las mejores fotos</div>
                            </div>
                        </div>

                        <br><br>
                        <div class="form-group row" >
                            <div class="col-md-3">
                                <input class="btn" name="imagen1"  id="imagen1" type="file" />
                            </div>
                            <div class="col-md-8">
                                <img id="imgSalida1" width="100%" height="300" src="" />

                            </div>

                        </div>

                        <button class="btn btn-primary" onclick="carga()">Quiero agregar otra foto</button>
                        <p>1/4</p>
                    </div>
                </div>

                <div class="card border-left-success shadow col-md-10" id="div2" hidden>
                    <div class="card-body col-md-10 mx-auto">
                        <div class="row">


                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success  mb-1 h5">Bien, escoge otra</div>
                            </div>
                        </div>

                        <br><br>
                        <div class="form-group row">
                            <div class="col-md-3">
                                <input class="btn" name="imagen2"  id="imagen2" type="file" />
                            </div>
                            <div class="col-md-8">
                                <img id="imgSalida2" width="100%" height="300" src="" />

                            </div>

                        </div>


                        <button class="btn btn-primary" onclick="carga()">Quiero agregar otra foto</button>
                        <p>2/4</p>
                    </div>
                </div>

                <div class="card border-left-success shadow col-md-10" id="div3" hidden>
                    <div class="card-body col-md-10 mx-auto">
                        <div class="row">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success  mb-1 h5">Bien, escoge otra</div>
                            </div>
                        </div>

                        <br><br>
                        <div class="form-group row">
                            <div class="col-md-3">
                                <input class="btn" name="imagen3"  id="imagen3" type="file" />
                            </div>
                            <div class="col-md-8">
                                <img id="imgSalida3" width="100%" height="300" src="" />
                            </div>
                        </div>

                        <button class="btn btn-primary" onclick="carga()">Quiero agregar otra foto</button>
                        <p>3/4</p>
                    </div>
                </div>
                <div class="card border-left-success shadow col-md-10" id="div4" hidden>
                    <div class="card-body col-md-10 mx-auto">
                        <div class="row">


                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success  mb-1 h5">Bien, escoge otra</div>
                            </div>
                        </div>

                        <br><br>
                        <div class="form-group row">
                            <div class="col-md-3">
                                <input class="btn" name="imagen4"  id="imagen4" type="file" />
                            </div>
                            <div class="col-md-8">
                                <img id="imgSalida4" width="100%" height="300" src="" />

                            </div>

                        </div>


                        <p>4/4</p>
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
                                <input  class="form-control date" type="date" name="fecha" placeholder="fecha" id="fecha" >
                            </div>
                            <label class="col-md-2 col-form-label" for="text-input"> Hora</label>

                            <div class="col-md-4">
                                <input  class="form-control time" type="time" name="hora" placeholder="hora" id="hora">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="text-input">Duracion</label>
                            <div class="col-md-4">
                                <input  class="form-control" type="number" name="duracion" placeholder="duracion", id="duracion">
                            </div>
                            <label class="col-md-2 col-form-label" for="text-input">Cupos</label>

                            <div class="col-md-4">
                                <input  class="form-control" type="number" name="cupos" placeholder="cupos" id="cupos">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="text-input">Lugar</label>
                            <div class="col-md-4">
                                <select  class="form-control" name="lugar" id="lugar">
                                    <option>LUGAR</option>
                                    <% for (LugarVO lugarVO : lugarDAO.ListarDatos(idEmp)) {
                                            if (lugarVO != null) {
                                    %>
                                    <option value="<%= lugarVO.getIdLugar()%>"><%= lugarVO.getDireccionLugar()%></option>
                                    <%}
                                        }%>

                                    
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
                                <!-- 

                                    <input  class="form-control" type="text" id="titulo" name="titulo" placeholder="titulo...">
                                -->
                            </div>
                        </div>


                        <div class="form-group row ">
                            <label class="col-md-2 col-form-label" for="text-input">Precio</label>
                            <div class="col-md-4">
                                <input  class="form-control" type="number" name="precio" placeholder="precio" id="precio">
                            </div>
                            <label class="col-md-2 col-form-label" for="text-input">Descuento</label>
                            <div class="col-md-4">
                                <input  class="form-control" type="number" name="descuento" placeholder="precio" id="precio">
                            </div>

                        </div>
                        <div class="form-group row ">
                            <div class="col-md-4">
                                <input type="hidden" value="1" name="accion">
                                <input class="btn btn-primary" type="submit" value="crear y publicar">
                            </div>
                            <div class="col-md-8">

                                <p class="col-8 mx-auto text-danger" id="errorActiv"></p>
                            </div>
                        </div>

                        <a href="EMPRESA_Perfil.jsp">VOLVER</a>

                    </div>
                </div>







                <!--
                                    
                                    
                                    
                                    
                                </div>-->

                <input type="hidden" id="name1" name="name1" value="">
                <input type="hidden" id="name2" name="name2" value="">
                <input type="hidden" id="name3" name="name3" value="">
                <input type="hidden" id="name4" name="name4" value=""> 

                <input type="hidden" id="estado" name="estado" value="activo">



                <!--             <iframe name="ifarame"></iframe>-->









            </form>

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





        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...a
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>








 

        
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/sb-admin-2.min.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
        
        
        <script src="js/jquery.validate.min.js" type="text/javascript"></script>
         <script src="js/calc/cargarImagen.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
        <script src="js/DOM/reserva.js" type="text/javascript"></script>
        <% }%>
    </body>
</html>
