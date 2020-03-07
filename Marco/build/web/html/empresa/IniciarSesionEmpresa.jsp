<%-- 
    Document   : IniciarSesionEmpresa
    Created on : 26-sep-2019, 23:02:37
    Author     : jngzn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar sesion EMPRESA</h1>
        <form action="Empresas" method="post">

            <tr>
                <td>correo </td>
                <td><input type="email" name="correo"></td>
            </tr>
            <tr>
                <td>contraseña </td>
                <td><input type="password" name="pass"></td>
            </tr>
            <input type="hidden" value="2" name="accion">
            <input type="submit" value="incia">

            <%if (request.getAttribute("exito") != null) {%>
            ${exito}
            <%} else {%>

            ${error}
            <%}%>
            <br>
            <a href="RegistrarEmpresa.jsp">registrate</a> 
        </form>
    </body>
</html>
