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
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.dao.EmpresaDAO;
import modelo.vo.EmpresaVO;
import utility.Encripcion;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/Empresas"})
@MultipartConfig
public class EmpresaControl extends HttpServlet {

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

        int accion = Integer.parseInt(request.getParameter("accion"));

        HttpSession sesio = request.getSession();

        String idEmpresa = request.getParameter("idEmp");
        String nit = request.getParameter("nit");
        String pass = request.getParameter("pass");
        try {
            pass = Encripcion.sha256(pass);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(EmpresaControl.class.getName()).log(Level.SEVERE, null, ex);
        }

        String razonSocial = request.getParameter("nombre");
        String correoEmpresa = request.getParameter("correo");

        EmpresaVO empVO = new EmpresaVO(nit, razonSocial, correoEmpresa, pass);
        EmpresaDAO empDAO = new EmpresaDAO(empVO);

        switch (accion) {
            case 1:
            String ruta = "";
                try {
                    String file = request.getParameter("nomLogo");
                    Part arc = request.getPart("imagen");

                    InputStream is = arc.getInputStream();

                    String base = "/home/jngzn/Escritorio/8-12/Marco/web/";
                    ruta = "imagenes/logo-" + nit + "-" + file;
//
                    File f = new File(base + ruta);
                    FileOutputStream ous = new FileOutputStream(f);
                    int dato = is.read();
                    while (dato != -1) {
                        ous.write(dato);
                        dato = is.read();
                    }
                    ous.close();
                    is.close();
                } catch (Exception e) {
                    System.out.println("error: " + e.toString());
                    response.getWriter().print("imagen");
                }

                System.out.println("1");

                if (empDAO.validaEmpresa(nit)) {
                    request.setAttribute("error", "EMPRESA ya existe");
                    response.getWriter().print("existe");
                    System.out.println("1");

                } else if (empDAO.insertar(ruta)) {
                    request.setAttribute("error", "Registro exitoso");
                    response.getWriter().print("true");
                    System.out.println("1");

                } else {
                    response.getWriter().print("false");
                    System.out.println("1");
                    request.setAttribute("error", "Registro errado");
                }
                //  request.getRequestDispatcher("EMPRESA_Registro.jsp").forward(request, response);
                break;
            case 2:
                if (empDAO.iniciarSesion(correoEmpresa, pass) != null) {

                    nit = empDAO.iniciarSesion(correoEmpresa, pass);
                    sesio = request.getSession(true);

                    /*  sesion = request.getSession(true);
                    //sesion.invalidate();
                    sesion.setAttribute("id", id);
                    request.getRequestDispatcher("PerfilUsuario.jsp").forward(request, response);*/
                    sesio.setAttribute("nit", nit);
                    request.getRequestDispatcher("EMPRESA_Perfil.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Error usuario y o contrasena incorrecta");
                    request.getRequestDispatcher("EMPRESA_IniciarSesion.jsp").forward(request, response);
                }
                break;
            case 3:
                nit = (String) sesio.getAttribute("nit");

                if (empDAO.Actualizar(nit)) {
                    request.setAttribute("exito", "actualizado");
                } else {
                    request.setAttribute("error", "no se pudo actualizar");
                }
                request.getRequestDispatcher("EMPRESA_Perfil.jsp").forward(request, response);
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
