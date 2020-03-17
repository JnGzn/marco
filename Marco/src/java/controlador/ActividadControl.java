/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.dao.ActividadDAO;
import modelo.vo.ActividadVO;

/**
 *
 * @author jngzn
 */
@WebServlet(name = "ActividadControl", urlPatterns = {"/Actividad"})
@MultipartConfig
public class ActividadControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */

        String id = request.getParameter("reservar");
        String accion = request.getParameter("accion");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String duracion = request.getParameter("duracion");
        String cupos = request.getParameter("cupos");
        String precio = request.getParameter("precio");
        String estado = request.getParameter("estado");;
        String lugar = request.getParameter("lugar");;
        String categoria = request.getParameter("categoria");;
        String descuento = request.getParameter("descuento");;

        HttpSession sesio = request.getSession();
        String idEmpresa = (String) sesio.getAttribute("nit");
        String idUser = (String) sesio.getAttribute("id");

        ActividadVO actiVO = new ActividadVO(titulo, descripcion,
                fecha, hora, duracion, cupos, precio, estado,
                idEmpresa, lugar, categoria, descuento);

        ActividadDAO actiDAO = new ActividadDAO(actiVO);
        switch (accion) {
            case "1":
                String[] images = new String[5];
                try {
                    for (int i = 0; i < images.length; i++) {
                        images[i] = "";
                        String file = request.getParameter("name" + (i + 1));
                        Part arc = request.getPart("imagen" + (i + 1));
                        System.out.println("name" + (i + 1) + " " + file);
                        InputStream is = arc.getInputStream();
                        
                        images[i] = "/home/jngzn/Escritorio/8-12/Marco/web/imagenes/" + idEmpresa + "_" + titulo + "_" + file;
                        File f = new File(images[i]);
                        FileOutputStream ous = new FileOutputStream(f);
                        int dato = is.read();
                        while (dato != -1) {
                            ous.write(dato);
                            dato = is.read();
                        }
                        if (i == 3) {
                            ous.close();
                            is.close();
                            break;
                        }
                    }
                } catch (Exception e) {
                    System.err.println(e.toString());
                    response.getWriter().print("imagentrue");
                }

                if (actiDAO.AgregarActividad(images)) {
                    response.getWriter().print("true");

                } else {
                    response.getWriter().print("false");
                }
//                request.getRequestDispatcher("EMPRESA_AgregarActividad.jsp").forward(request, response);

                break;
            case "enviar":
                int cantRes = Integer.parseInt(request.getParameter("ctxCupos"));
                String nomComprador = request.getParameter("ctxNombres");
                String apellidoComprador = request.getParameter("ctxApellidos");
                String docComprador = request.getParameter("ctxDocumento");
                String email = request.getParameter("ctxCorreo");
                String calificacion = request.getParameter("ctxCalificacion");
                String activ = request.getParameter("acti");

                actiVO = actiDAO.ListarDatos(activ);
                if (actiDAO.realizaReserva(actiVO, nomComprador, apellidoComprador,
                        email, docComprador, cantRes, idUser, calificacion)) {
                    response.getWriter().print("true");

                } else {
                    response.getWriter().print("false");
                }
//                    request.getRequestDispatcher("USUARIO_Reserva.jsp?reservar="+activ).forward(request, response);

                break;

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
