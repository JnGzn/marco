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

    public void init() {

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
        String envio = request.getParameter("env");
        String mensaje = "";
        String nombre = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String asunto = "Bienvenido al sistema";

        switch (envio) {
            case "1":
                mensaje = ("HOLA " + nombre + " " + apellidos
                        + "\n tu registro al sistema ha sido exitoso \n aca en contrarás diferntes "
                        + "actividades recreativas para realizar con tus niños."
                        + "\n \n tu correo de ingreso es " + correo
                        + " \n cordialmete \n    el quipo MARCO");
                break;
            case "2":

                mensaje = ("HOLA " + nombre + " "
                        + "\n tu registro al sistema ha sido exitoso \n aca en podras publicar diferntes "
                        + "actividades recreativas para niños, estas serán ofertadas por medio del portal y "
                        + "los usuarios la podran consultar y reservar"
                        + "\n \n tu correo de ingreso es " + correo
                        + " \n cordialmete \n    el quipo MARCO");
                break;
            case "3":
                correo = request.getParameter("ctxCorreo");
                nombre = request.getParameter("ctxNombres");
                String actividad = request.getParameter("titulo");

                asunto = "Reserva realizada";
                mensaje = ("HOLA " + nombre + " tu reserva de la actividad -" + actividad + "- se ha registrado correctamente "
                        + " \n cordialmete \n    el quipo MARCO");

                String resultadomsj = "";
                try {
                    PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, correo, asunto, mensaje);
                    resultadomsj = "Exito";
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("errot ---" + e.toString());
                    System.out.println("errot +++" + e.getMessage());
                    resultadomsj = "Error." + e.getMessage();
                }

            case "4":

                break;
        }

        String resultadomsj = "";

        try {
            PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, correo, asunto, mensaje);
            resultadomsj = "Exito";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("errot ---" + e.toString());
            System.out.println("errot +++" + e.getMessage());
            resultadomsj = "Error." + e.getMessage();
        } finally {
            request.setAttribute("mensaje", resultadomsj);
            getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);
        }

    }

}
