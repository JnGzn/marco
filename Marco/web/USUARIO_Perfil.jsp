

<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            }else {
                
                String id = (String) sesion.getAttribute("id");
            

            UsuarioVO usuarioVo = usuarioDAO.listarDatos(id);

        %>
        <h1>My profile!</h1>
        <div id="datosPersonales">
            <form action="Usuario" method="post">

                <table>

                    <tr>
                        <td>
                            <p>nombres</p>
                            <input type="text" name="nombres" value="<%= usuarioVo.getNombres()%>">
                        </td>       
                    </tr>
                    <tr>
                        <td>
                            <p>apellidos:</p>
                            <input type="text" name="apellidos" value="<%= usuarioVo.getApellidos()%>">
                        </td>       
                    </tr>
                    <tr>
                        <td>
                            <p>celular:</p>
                            <input type="number" name="celular" value="<%= usuarioVo.getCel()%>">
                        </td>       
                    </tr>
                    <tr>
                        <td>
                            <p>fecha nacimiento:</p>
                            <input type="date" name="fechaNacimiento" value="<%= usuarioVo.getFecha()%>">
                        </td>       
                    </tr>
                    <tr>
                        <td>
                            <p>dirección:</p>
                            <input type="text" name="direccion" value="<%= usuarioVo.getDireccion()%>">
                        </td>  

                    </tr>
                </table>

                <br>
                <input type="hidden" name="accion" value="3">
                <input type="submit" value="actualizar"> 


            </form>
            <a href="USUARIO_ListarActividades.jsp">Listar actividades</a>
            <form action="CerrarSesion" method="post">
                <input type="submit" value="cerrar sesion">
            </form>
        </div> 
        <%if (request.getAttribute("exito") != null) {%>
        ${exito}
        <%} else {%>

        ${error}
        <%}}%>

    </body>
</html>
