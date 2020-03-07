/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.LugarDAO;
import modelo.vo.LugarVO;


/**
 *
 * @author USER
 */
@WebServlet(name = "LugarControlador", urlPatterns = {"/Lugar"})
public class LugarControlador extends HttpServlet {

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

        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String idLugar = request.getParameter("txtId");
        String direccionLugar = request.getParameter("txtAddress");
        String zonaLugar = request.getParameter("txtZone");
        String aforoLugar = request.getParameter("txtQuantity");
        
         HttpSession sesio = request.getSession();
        
        String nit = (String) sesio.getAttribute("nit");

        LugarVO siteVO = new LugarVO(idLugar, direccionLugar, zonaLugar, aforoLugar);

        LugarDAO sitioDAO = new LugarDAO(siteVO);

        switch (opcion) {
            case 1: //Agregar Registro

                if (sitioDAO.AgregarRegistro(nit)) {

                    request.setAttribute("exito", "El Lugar Fue Registrado Correctamente!");
                } else {
                    request.setAttribute("error", "El Lugar NO Fue Registrado Correctamente!");
                }
                request.getRequestDispatcher("EMPRESA_RegistrarLugar.jsp").forward(request, response);
                break;

            case 2: //Actualizar registro

                if (sitioDAO.ActualizarRegistro()) {

                    request.setAttribute("exito", "El Lugar Fue Actualizado Correctamente!");
                } else {
                    request.setAttribute("error", "El Lugar NO Fue Actualizado Correctamente!");
                }
                request.getRequestDispatcher("EMPRESA_RegistrarLugar.jsp").forward(request, response);
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
