
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Style_Lugar.css" rel="stylesheet" type="text/css"/>
        <title>Registrar Lugar</title>
    </head>
    <body>
    <center>
        <h1> Registre un Lugar!</h1>
        <form method="post" action="Lugar">
            <table>

                <tr>
                    <th>
                        Dirección:<br> 

                        <input type="text" name="txtAddress"> <br><br>

                        Zona:<br>

                        <input type="text" name="txtZone"> <br><br>

                        Aforo:<br>

                        <input type="number" name="txtQuantity"> <br><br>
                    </th>
                </tr>

            </table> <br><br>

            <button>Registrar</button><br><br> 

            <input type="hidden" value="1" name="opcion">

        </form>

        <div>
            <%
                if (request.getAttribute("error") != null) { %>
            ${error}

            <%} else {%>    
            ${exito}
            <%}%>
        </div>
    </center>
    </body>
</html>
