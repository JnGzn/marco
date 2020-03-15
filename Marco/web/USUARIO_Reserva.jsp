<%-- 
    Document   : USUARIO_Reserva
    Created on : 04-dic-2019, 17:59:06
    Author     : jngzn
--%>

<%@page import="modelo.dao.UsuarioDAO"%>
<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.vo.ActividadVO"%>
<%@page import="modelo.dao.ActividadDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <%

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            HttpSession sesion = request.getSession();
            Object sesionn = sesion.getAttribute("id");

            if (sesionn == null) {
        %>
        <a href="USUARIO_IniciarSesion.jsp">inicia seison</a>
        <%
        } else {

            String idUsuario = (String) sesion.getAttribute("id");
            UsuarioDAO usuDAO = new UsuarioDAO();
            UsuarioVO usuVO = UsuarioDAO.listarDatos(idUsuario);


        %>
        <h1>Hello World!</h1>
        <%   String id = (String) request.getParameter("reservar");
            if (id != null) {

                ActividadDAO actiDAO = new ActividadDAO();
                ActividadVO actiVO = actiDAO.ListarDatos(id);

        %>
        <table>
            <tr>
                <th>foto</th>
                <th>titulo</th>
                <th>descripcion</th>
                <th>precio</th>
            </tr>
            <tr>
                <td>      </td>
                <td>      </td>
                <td>        <%=   actiVO.getTitulo()%></td>
                <td>        <%= actiVO.getDescripcion()%></td>
                <td> <%=  actiVO.getPrecio()%> </td>


            </tr>
        </table>


        <h3>datos del comprador</h3>
        <form action="Actividad" method="post" id="formReserva">
            <input type="hidden" value="<%=id%>" name="acti">
            <label>boletos</label>
            <input type="number" name="ctxCupos" id="ctxCupos" value="1"><br>

            <label>nombre</label>
            <input type="text" name="ctxNombres" value="<%=usuVO.getNombres()%>"><br>

            <label>apellidos</label>
            <input type="text" name="ctxApellidos" value="<%=usuVO.getApellidos()%>"><br>

            <label>No. documento</label>
            <input type="number" name="ctxDocumento" value="<%=usuVO.getDocumento()%>"><br>

            <label>correo</label>
            <input type="text" name="ctxCorreo" value="<%=usuVO.getCorreo()%>"><br>

            <input type="hidden" name="ctxPrecioTotal" id="ctxPrecioTotal" value="<%= actiVO.getPrecio()%>"><br>
            <input type="hidden" name="ctxIdUsuario" value="<%=idUsuario%>"><br>
            <input type="hidden" name="ctxIdActividad" value="<%=id%>"><br>


            <br>

            <label>calificar</label>

            <input type="number" name="ctxCalificacion" value="<%//calificacion%>"><br>

            
            <br>
            <input type="submit" name="accion"value="enviar">
            <p class="col-8 mx-auto text-danger" id="error"></p>
            <label>precio <small id="resultado">0</small> </label>
        </form>
             <button  class="btn" id="calcular">calcular</button>

        <%}}%>
        <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/calc/reserva.js"></script>
        <script src="js/validaciones/user.js" type="text/javascript"></script>
    </body>
</html>
