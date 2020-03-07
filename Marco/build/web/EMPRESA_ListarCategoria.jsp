<%-- 
    Document   : ListarCategoria
    Created on : 03-oct-2019, 12:15:38
    Author     : jngzn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.vo.CategoriaVO"%>
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
   <h1>CATEGORIA</h1>
        <table border:3px>
            <tr>
                <th>id</th>
                <th>nombre categoria</th>
                <th>empresa</th>
                
            </tr>
            <% CategoriaDAO catDAO = new CategoriaDAO();
                ArrayList<CategoriaVO> arrEmpresaVO = catDAO.ListarDatos();
                CategoriaVO catVo = null;
                for (int i = 0; i < arrEmpresaVO.size(); i++) {

                    catVo = arrEmpresaVO.get(i);

            %>
            
            <tr>
                <td>       <%= catVo.getIdCategoria()%></td>
                <td>        <%= catVo.getNomCategoria()%></td>
                <td>        <%= catVo.getIdEMCategoria()%></td>
                
            </tr>
            <%}%>
        </table>
    </body>
</html>