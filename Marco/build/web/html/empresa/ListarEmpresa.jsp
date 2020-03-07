<%-- 
    Document   : ListarEmpresa
    Created on : 03-oct-2019, 11:42:31
    Author     : jngzn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.vo.UsuarioVO"%>
<%@page import="modelo.vo.EmpresaVO"%>
<%@page import="modelo.dao.EmpresaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
          <h1>EMPRESA</h1>
        <table border:3px>
            <tr>
                <th>nit</th>
                <th>razon social</th>
                <th>correo</th>
                
            </tr>
            <% EmpresaDAO empDAO = new EmpresaDAO();
                ArrayList<EmpresaVO> arrEmpresaVO = empDAO.ListarDatos();
                EmpresaVO empVo = null;
                for (int i = 0; i < arrEmpresaVO.size(); i++) {

                    empVo = arrEmpresaVO.get(i);

            %>
            
            <tr>
                <td>       <%= empVo.getNit()%></td>
                <td>        <%= empVo.getRazonSocial()%></td>
                <td>        <%= empVo.getCorreoEmpresa()%></td>
                
            </tr>
            <%}%>
        </table>
    </body>
</html>