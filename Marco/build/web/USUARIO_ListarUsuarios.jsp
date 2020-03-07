<%-- 
    Document   : ListarUsuarios
    Created on : 21-sep-2019, 21:27:33
    Author     : jngzn
--%>

<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>USUARIOS</h1>
        
    
        
        
        <table border:3px>
            <tr>
                <th>nombres</th>
                <th>apellidos</th>
                <th>correo</th>
                <th>direccion</th>
            </tr>
            <% UsuarioDAO usuDAO = new UsuarioDAO();
                ArrayList<UsuarioVO> arrClienteVO = UsuarioDAO.listarDatos();
                UsuarioVO usuVo = null;
                for (int i = 0; i < arrClienteVO.size(); i++) {

                    usuVo = arrClienteVO.get(i);

            %>
            
            <tr>
                <td>       <%= usuVo.getNombres()%></td>
                <td>        <%= usuVo.getApellidos()%></td>
                <td>        <%= usuVo.getCorreo()%></td>
                <td> <%=usuVo.getDireccion() %> </td>
                
            </tr>
            <%}%>
        </table>
    </body>
</html>
