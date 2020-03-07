<%-- 
    Document   : ListarLugar
    Created on : 03-oct-2019, 13:56:49
    Author     : jngzn
--%>

<%@page import="modelo.vo.LugarVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.dao.LugarDAO"%>
<%@page import="modelo.dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
      <h1>LUGAR</h1>

        <table border:3px>
            <tr>
                <th>id</th>
                <th>direccion</th>
                <th>zona</th>
                <th>aforo</th>
                <th>empresa</th>
                
            </tr>
            <% LugarDAO lugDAO = new LugarDAO();
                ArrayList<LugarVO> arrEmpresaVO = lugDAO.ListarDatos();
                LugarVO lugVo = null;
                for (int i = 0; i < arrEmpresaVO.size(); i++) {

                    lugVo = arrEmpresaVO.get(i);

            %>
            
            <tr>
                <td>       <%= lugVo.getIdLugar()%></td>
                <td>        <%= lugVo.getDireccionLugar()%></td>
                      <td>        <%= lugVo.getZonaLugar()%></td>
                <td>        <%= lugVo.getAforoLugar()%></td>
                      <td>        <%= lugVo.getIdEmp()%></td>
                
            </tr>
            <%}%>
        </table>
    </body>
</html>