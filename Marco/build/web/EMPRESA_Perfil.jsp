<%-- 
    Document   : PerfilEmpresa
    Created on : 26-sep-2019, 23:16:42
    Author     : jngzn
--%>

<%@page import="modelo.vo.EmpresaVO"%>
<%@page import="modelo.dao.EmpresaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>mi empresa!</h1>

        <%
            EmpresaDAO empDAO = new EmpresaDAO();
            HttpSession sesio = request.getSession();

            if (sesio == null | !request.isRequestedSessionIdValid()) {
                session.invalidate();

                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            String nit = (String) sesio.getAttribute("nit");
            EmpresaVO empVO = EmpresaDAO.ListarDatos(nit);

        %>
        <form method="post" action="Empresas">
            <table>
                <tr>
                    <td>Nit:</td>
                    <td><input type="text" name="nit" value="<%= empVO.getNit()%>"></td>
                </tr>
                <tr>
                    <td>Razón Social: </td>
                    <td><input type="text" name="nombre" value="<%= empVO.getRazonSocial()%>"></td>
                </tr>

                <tr>

                    <td>Correo Empresa:</td>
                    <td><input type="email" name="correo" value="<%= empVO.getCorreoEmpresa()%>"></td>
                </tr>

                <tr>
                    <td>
                        <input type="hidden" value="3" name="accion">
                        <input type="submit" value="actualizar">
                    </td>
                </tr>


            </table>

        </form>
        <form action="CerrarSesion" method="post">

            <input type="submit" value="cerrar">

        </form>
                <a href="EMPRESA_AgregarCategoria.jsp">Agregar Categoria</a><br>
                <a href="EMPRESA_RegistrarLugar.jsp" >Agregar Lugar</a><br>
                <a href="EMPRESA_AgregarActividad.jsp" >Agregar Actividad</a><br>
                
        
    </body>




    <%if (request.getAttribute("exito") != null) {%>
    ${exito}
    <%} else {%>

    ${error}
    <%}%>
</html>
