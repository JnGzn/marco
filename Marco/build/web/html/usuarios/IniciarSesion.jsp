

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar sesion</h1>
        <form action="Usuario" method="post">

            <tr>
                <td>correo </td>
                <td><input type="email" name="confirmaCorreo"></td>
            </tr>
            <tr>
                <td>contraseña </td>
                <td><input type="password" name="pass"></td>
            </tr>
             <button name="accion" value="2">iniciar sesion</button>

            <%if (request.getAttribute("exito") != null) {%>
            ${exito}
            <%} else {%>

            ${error}
            <%}%>
            <br>
            <a href="RegistroUsuarios.jsp">registrate</a> 
        </form>
    </body>
</html>
