<%-- 
    Document   : AgregarCliente
    Created on : 20/06/2019, 12:25:12 PM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresas</title>
    </head>
    <body>
        <h1>agregar EMPRESA</h1>
        <form method="post" action="Empresas">
            <table>
                 <tr>
                    <td>Nit:</td>
                    <td><input type="text" name="nit"></td>
                </tr>
                <tr>
                    <td>Razón Social: </td>
                    <td><input type="text" name="nombre"></td>
                </tr>
             
               <tr>
                 
                    <td>Correo Empresa:</td>
                    <td><input type="email" name="correo"></td>
                </tr>
               <tr>
                 
                    <td>Contraseña:</td>
                    <td><input type="password" name="pass"></td>
                </tr>
                <tr>
                    <td>
                        <button name="accion" value="1">registrar</button>
                    </td>
                </tr>
                   
              
            </table>
            <a href="EMPRESA_IniciarSesion.jsp">inicia sesion</a> 
        </form>

        <%if (request.getAttribute("exito") != null) {%>
        ${exito}
        <%} else {%>
        
        ${error}
        <%}%>

    </body>
</html>
