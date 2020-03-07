

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sesio = request.getSession();
        %>
        <form method="post" action="Categoria">
            <table>
          
                <tr>
                    <td>Nombre Categoria </td>
                    <td><input type="text" name="nombres"></td>
                </tr>
               
                <tr>
                    <td>
                        <button name="accion" value="3">Agregar</button>
                    </td>
                </tr>
            </table>
        </form>

        <%if (request.getAttribute("exito") != null) {%>
        ${exito}
        <%} else {%>
        ${error}
        <%}%>
<a href="EMPRESA_Perfil.jsp">VOLVER</a>
    </body>
</html>
