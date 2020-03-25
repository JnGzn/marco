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
        <form method="post" action="Empresas" enctype="multipart/form-data" id="Empresa">
            <table>
                 <tr>
                    <td>Nit:</td>
                    <td><input type="text" name="nit"> <input type="hidden" name="nomLogo" id="name1" value=""> </td>
                </tr>
                <tr>
                    <td>logo</td>
                    <td><input type="file" name="imagen" id="imagenLogo"></td>
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
        <p id="errorActiv"></p>
        <%if (request.getAttribute("exito") != null) {%>
        ${exito}
        <%} else {%>
        
        ${error}
        <%}%>
 <script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script src="js/calc/cargarImagen.js" type="text/javascript"></script>
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
    </body>
</html>
