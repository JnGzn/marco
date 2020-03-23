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
import modelo.dao.CategoriaDAO;
///import modelo.dao.ProductosDAO;
import modelo.vo.CategoriaVO;
//import modelo.vo.ProductosVO;

/**
 *
 * @author JNGZN
 */
@WebServlet(name = "CategoriaControl", urlPatterns = {"/Categoria"})
public class CategoriaControl extends HttpServlet {

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

        int accion;
        String codCliente = null;
        String a = request.getParameter("accion");
        if (a.length() > 1) {
            codCliente = a.substring(0, a.indexOf(" "));
            accion = Integer.parseInt(a.substring(a.length() - 1));
        } else {
            accion = Integer.parseInt(a);
        }

        HttpSession sesio = request.getSession();
        String nombres = request.getParameter("nombres");
        String nit = (String) sesio.getAttribute("nit");

        CategoriaVO clientesVO = new CategoriaVO(nombres);
        CategoriaDAO clientesDAO = new CategoriaDAO(clientesVO);

        switch (accion) {

            case 3:
                if (clientesDAO.insertarCategoria(nit)) {
                   
                    response.getWriter().print("true");
                } else {
                    
                    response.getWriter().print("false");
                }


                break;
        }
      

    }
}
