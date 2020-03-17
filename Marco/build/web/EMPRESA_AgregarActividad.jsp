<%-- 
    Document   : EMPRESA_AgregarActividad
    Created on : 13-nov-2019, 22:46:05
    Author     : jngzn
--%>

<%@page import="modelo.vo.LugarVO"%>
<%@page import="modelo.vo.CategoriaVO"%>
<%@page import="modelo.dao.LugarDAO"%>
<%@page import="modelo.dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="img/favicon.png">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/all.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            // CategoriaDAO categoriaDAO = new CategoriaDAO();
            LugarDAO lugarDAO = new LugarDAO();
        %>
        <form name="form" action="Actividad" method="post" enctype="multipart/form-data" id="formCrearReserva">
            <div class="row">
                <div class="col-3 mx-auto">

                    <input name="imagen1" width="10px" height="10%" id="imagen1" type="file" />
                </div>
                <div class="col-3 mx-auto">
                    <img id="imgSalida1" src="" />
                </div>
                <div class="col-3 mx-auto">
                    <input name="imagen2" id="imagen2" type="file" />
                </div>
                <div class="col-3 mx-auto">
                    <img id="imgSalida2" src="" />
                </div>
            </div>
            <div class="row">
                <div class="col-3 mx-auto">
                    <input name="imagen3" id="imagen3" type="file" />
                </div>
                <div class="col-3 mx-auto">
                    <img id="imgSalida3" src="" />
                </div>
                <div class="col-3 mx-auto">
                    <input name="imagen4" id="imagen4" type="file" />
                </div>
                <div class="col-3 mx-auto">
                    <img id="imgSalida4" src="" />
                </div>
            </div>

            <input type="hidden" id="name1" name="name1" value="">
            <input type="hidden" id="name2" name="name2" value="">
            <input type="hidden" id="name3" name="name3" value="">
            <input type="hidden" id="name4" name="name4" value="">


            <!--             <iframe name="ifarame"></iframe>-->

            <input type="text" id="titulo" name="titulo" placeholder="titulo">
            <input type="text" name="descripcion" placeholder="descripcion" id="descripcion">
            <input type="date" name="fecha" placeholder="fecha" id="fecha">
            <input type="time" name="hora" placeholder="hora" id="hora">
            <input type="number" name="duracion" placeholder="duracion", id="duracion">
            <input type="number" name="cupos" placeholder="cupos" id="cupos">
            <input type="number" name="precio" placeholder="precio" id="precio">
            <select name="lugar" id="lugar">
                <option>LUGAR</option>
                <% for (LugarVO lugarVO : lugarDAO.ListarDatos()) {%>
                <option value="<%= lugarVO.getIdLugar()%>"><%= lugarVO.getDireccionLugar()%></option>
                <%} %>
            </select>

            <select name="categoria" id="categoria">
                <option>CATEGORIA</option>
                <% for (CategoriaVO categoriaVO : CategoriaDAO.ListarDatos()) {%>
                <option value="<%= categoriaVO.getIdCategoria()%>"><%= categoriaVO.getNomCategoria()%></option>
                <%}%>
            </select>

            <select name="estado" estado="estado"> 
                <option>ESTADO</option>
                <option value="activo">activo</option>
                <option value="publico">publico</option>
                <option value="creado">creado</option>
                <option value="cancelado">cancelado</option>
            </select>
            
            <input type="hidden" value="1" name="accion">
            <input type="submit" value="crear y publicar">
        </form>
        <p class="col-8 mx-auto text-danger" id="error"></p>

        <a href="EMPRESA_Perfil.jsp">VOLVER</a>


        <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script src="js/calc/cargarImagen.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
    </body>
</html>
