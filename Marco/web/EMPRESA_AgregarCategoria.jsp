

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
        <form method="post" action="Categoria" id="formCategora">
            <table>
          
                <tr>
                    <td>Nombre Categoria </td>
                    <td><input type="text" name="nombres" id="ctxNombre"></td>
                </tr>
               
                <tr>
                    <td>
                        <button name="accion" value="3">Agregar</button>
                    </td>
                </tr>
                
            </table>
            <p id="errorCat" class="text-danger" ></p>
        </form>

        <%if (request.getAttribute("exito") != null) {%>
        ${exito}
        <%} else {%>
        ${error}
        <%}%>
<a href="EMPRESA_Perfil.jsp">VOLVER</a>

<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
      
        <script src="js/validaciones/empresa.js" type="text/javascript"></script>
    </body>
</html>
