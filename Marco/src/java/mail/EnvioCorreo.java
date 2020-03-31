package mail;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(urlPatterns = {"/EnvioCorreo"})
public class EnvioCorreo extends HttpServlet {

    private String host;
    private String puerto;
    private String usuario;
    private String clave;
    
    public void init(){
        
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        puerto = context.getInitParameter("puerto");
        usuario = context.getInitParameter("usuario");
        clave = context.getInitParameter("clave");
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        
        String asunto = "Bienvenido al sistema";
        String mensaje = request.getParameter("mensaje");
        
        String resultadomsj = "";
        
        try {
            PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, correo, asunto, mensaje);
            resultadomsj = "Exito";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("errot ---" +e.toString());
            System.out.println("errot +++" +e.getMessage());
            resultadomsj = "Error."+e.getMessage();
        }finally{
            request.setAttribute("mensaje", resultadomsj);
            getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);
        }
            
        
    }

}
