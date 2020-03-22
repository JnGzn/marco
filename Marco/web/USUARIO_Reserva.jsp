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
       
<!--  reserva-->
    <div class="my-5 card border-left-success shadow col-md-12">
        <div class="card-body col-md-10 mx-auto">
            <div class="row">
                
                
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success  mb-1 h5">Detalles</div>
                </div>
            </div>
            <br><br>
            
            <form action="Actividad" method="post" id="formReserva">
                
                <input type="hidden" value="<%=id%>" name="acti">
             

                <div class="form-group row">
                    <label class="col-md-2 col-form-label" for="text-input">boletos</label>
                    <div class="col-md-4">
                        <input  class="form-control date" type="text" name="ctxCupos" id="ctxCupos" value="1" >
                    </div>
                    <label class="col-md-2 col-form-label" for="text-input">Precio a pagar:</label>
                    <div class="col-md-4">
              
                        <input type="hidden" id="precioUnidad" value="<=% actiVO.getPrecio() %=>">
                        <input  class="form-control date" id="resultado" type="text" id="ctxCupos" value="54312" disabled >
                    </div>
                </div>



            <div class="form-group row">
                <label class="col-md-2 col-form-label" for="text-input">Nombres</label>
                <div class="col-md-4">
                    <input  class="form-control date" type="text" name="ctxNombres" value="<%=usuVO.getNombres()%>" >
                </div>
                <label class="col-md-2 col-form-label" for="text-input"> Apellidos</label>
                
                <div class="col-md-4">
                    <input  class="form-control time" type="text" name="ctxApellidos" value="<%=usuVO.getApellidos()%>">
                </div>
            </div>
              
            <div class="form-group row">
                <label class="col-md-2 col-form-label" for="text-input">No. Documento</label>
                <div class="col-md-4">
                    <input  class="form-control date" type="text" name="ctxDocumento" value="<%=usuVO.getDocumento()%>" >
                </div>
                <label class="col-md-2 col-form-label" for="text-input">Correo</label>
                
                <div class="col-md-4">
                    <input  class="form-control time" type="email" name="ctxCorreo" value="<%=usuVO.getCorreo()%>">
                </div>
            </div>
    
               
    
                <input type="hidden" name="ctxPrecioTotal" id="ctxPrecioTotal" value="<%= actiVO.getPrecio()%>"><br>
                <input type="hidden" name="ctxIdUsuario" value="<%=idUsuario%>"><br>
                <input type="hidden" name="ctxIdActividad" value="<%=id%>"><br>
    
    
                <br>
    


                <div class="form-group row">
                    <label class="col-md-2 col-form-label" for="text-input">Calificar</label>
                    <div class="col-md-4">
                        <input  class="form-control date" type="text" name="ctxCalificacion" value="" >
                    </div>
                   
                </div>

               
    
                
                <br>
                <input class="btn btn-primary" type="submit" name="accion"value="enviar">
                <p class="col-8 mx-auto text-danger" id="error"></p>
            </form>
            <button  class="btn" id="calcular">calcular</button>

            
        </div>
        
    </div>
    <!-- fin reserva-->

        <%}}%>
        <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/calc/reserva.js"></script>
        <script src="js/validaciones/user.js" type="text/javascript"></script>
    </body>
</html>
