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
    </head>
    <body>
        <h1>Hello World!</h1>
        <%   String id = (String) request.getParameter("reservar");
                ActividadDAO actiDAO = new ActividadDAO();
                
             
                ActividadVO actiVO = actiDAO.ListarDatos(id);
            if (id != null) {
                
                 
                   
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
                <td>        <%=   actiVO.getTitulo()%></td>
                <td>        <%= actiVO.getDescripcion()%></td>
                <td> <%=  actiVO.getPrecio()%> </td>


            </tr>
        </table>
        <%}
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            HttpSession sesion = request.getSession();
            String idUsuario = (String) sesion.getAttribute("id");
            UsuarioDAO usuDAO = new UsuarioDAO();
            UsuarioVO usuVO = UsuarioDAO.listarDatos(idUsuario);


        %>

        <h3>datos del comprador</h3>
        <form action="Actividad" method="post">

            <label>boletos</label>
            <input type="number" name="ctxCupos" id="ctxCupos"><br>

            <label>nombre</label>
            <input type="text" name="ctxNombres" value="<%=usuVO.getNombres()%>"><br>

            <label>apellidos</label>
            <input type="text" name="ctxApellidos" value="<%=usuVO.getApellidos()%>"><br>

            <label>No. documento</label>
            <input type="number" name="ctxNombres" value="<%=usuVO.getDocumento()%>"><br>

            <label>correo</label>
            <input type="text" name="ctxCorreo" value="<%=usuVO.getCorreo()%>"><br>




            <input type="hidden" name="ctxPrecioTotal" id="ctxPrecioTotal" value="<%= actiVO.getPrecio()%>"><br>
            
            <input type="hidden" name="ctxIdUsuario" value="<%=idUsuario%>"><br>
            <input type="hidden" name="ctxIdActividad" value="<%=id%>"><br>


            <br>

            <label>calificar</label>

            <input type="number" name="ctxCalificacion" value="<%//calificacion%>"><br>

            <label>precio : <button onclick="CalcularPrecio()">calcular</button></label>
            <label id="resultado"></label>

        </form>

   
    <script type="text/javascript">

        function CalcularPrecio()
        {
            
            var precio = document.getElementById("ctxPrecioTotal").value;
            var cantidad = document.getElementById("ctxCupos").value;
            alert("precio Total: "+(precio * cantidad));
            
           document.getElementById('resultado').innerHTML = 
            precio * cantidad;
        }
    </script>
     </body>
</html>
