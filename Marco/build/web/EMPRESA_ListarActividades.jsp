<%-- 
    Document   : EMPRESA_AC
    Created on : 21-nov-2019, 21:36:53
    Author     : jngzn
--%>

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
        <h1>actividades</h1>
        <table>
            <tr>
                <th>foto</th>
                <th>titulo</th>
                <th>descripcion</th>
                <th>precio</th>
            </tr>
          
             
             
            <% ActividadDAO actDAO = new ActividadDAO();

                for (ActividadVO actVo : actDAO.ListarDatos()) {%>

            <tr>
                <td>      </td>
                <td>        <%=   actVo.getTitulo()%></td>
                <td>        <%= actVo.getDescripcion()%></td>
                <td> <%=  actVo.getPrecio()%> </td>
                <td> <a href="USUARIO_Reserva.jsp?reservar=<%=  actVo.getId()%>" >reservar</a></td>

            </tr>
            <%}%>
        </table>
        <a href="sfsad" me
    </body>
</html>
