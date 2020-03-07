

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registrate</h1>
        <form action="Usuario" method="post">
            <table>
                 <tr>
                    <td>Nombres </td>
                    <td><input type="text" name="nombres"></td>
                </tr>
                <tr>
                    <td>Apellidos: </td>
                    <td><input type="text" name="apellidos"></td>
                </tr>
             
               <tr>
                 
                    <td>fecha nacimiento </td>
                    <td><input type="date" name="fechaNacimiento"></td>
                </tr>
              
                <tr>
                    <td>correo </td>
                    <td><input type="email" name="correo"></td>
                </tr>
                <tr>
                    <td>Confirma correo </td>
                    <td><input type="email" name="confirmaCorreo"></td>
                </tr>
                 <tr>
                    <td>contraseña </td>
                    <td><input type="password" name="pass"></td>
                </tr>
                <tr>
                    <td>
                        <button name="accion" value="1">registrar</button>
                    </td>
                </tr>
                   
              
            </table>
        

        <%if (request.getAttribute("exito") != null) {%>
        ${exito}
        <%} else {%>
        
        ${error}
        <%}%>
        <br>
        <a href="USUARIO_IniciarSesion.jsp">inicia sesion</a> 
        </form>
    </body>
</html>
