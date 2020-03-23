/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
//import java.sql.Date;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.parser.TokenType;
import modelo.dao.CategoriaDAO;
import modelo.dao.UsuarioDAO;
///import modelo.dao.ProductosDAO;
import modelo.vo.CategoriaVO;
import modelo.vo.UsuarioVO;
import utility.Encripcion;
//import modelo.vo.ProductosVO;

/**
 *
 * @author JNGZN
 */
@WebServlet(name = "UsuariosControl", urlPatterns = {"/Usuario"})
public class UsuariosControl extends HttpServlet {

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

        HttpSession sesion = request.getSession();
        int accion;
        String codCliente = null;
        String a = request.getParameter("accion");

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String fecha = request.getParameter("fechaNacimiento");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = new java.util.Date(0);

        try {
            fechaNacimiento = sdf.parse(fecha);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        //Date fechaNacimiento = request.getDateHeader("fechanacimiento")
        String correo = request.getParameter("confirmaCorreo");
        String pass = request.getParameter("pass");
        try {
            pass = Encripcion.sha256(pass);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UsuariosControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        String cel = request.getParameter("celular");
        String direccion = request.getParameter("direccion");
        String docuemento = request.getParameter("documento");
        accion = Integer.parseInt(a);
        UsuarioVO usuarioVO = new UsuarioVO(nombres, apellidos, fecha, correo, pass, cel, direccion, docuemento);
        UsuarioDAO usuarioDAO = new UsuarioDAO(usuarioVO);
        String id = "0";
        switch (accion) {

            case 1: //registro
                
                if (usuarioDAO.validaUsuario(correo)) {
                    response.getWriter().print("CORREO ya existe");
                } else {
                    if (usuarioDAO.insertar()) {

                        response.getWriter().print("Registro exitoso");
                    }else {
                    response.getWriter().print("false");
                    }
                }
                
//                request.getRequestDispatcher("USUARIO_Registro.jsp").forward(request, response);
                break;
            case 2: //inicio sesion

                if (usuarioDAO.iniciarSesion(correo, pass) != null) {

                    id = usuarioDAO.iniciarSesion(correo, pass);
                    sesion = request.getSession(true);
                    //sesion.invalidate();
                    sesion.setAttribute("id", id);
                    String privilegios = usuarioDAO.privilegios(id);
                    if (privilegios.equals("1")) {
                        
                        request.getRequestDispatcher("USUARIO_Perfil.jsp").forward(request, response);
                    }
                    if(privilegios.equals("5")){
                        response.getWriter().print("admin");   
                               sesion = request.getSession(true);
                    sesion.setAttribute("admin", privilegios);
                        //request.getRequestDispatcher("ADMIN_index.jsp").forward(request, response);
                    }
                } else {
//                    request.setAttribute("error", "Error usuario y o contrasena incorrecta");
             
                    response.getWriter().print("false");
                }
                break;
            case 3:

                id = (String) sesion.getAttribute("id");
                if (usuarioDAO.actualizar(id)) {

                    request.setAttribute("exito", "cambios realizados");
                } else {
                    request.setAttribute("error", "no se pundo realizar los cambios");
                }
                request.getRequestDispatcher("USUARIO_PerfilUsuario.jsp").forward(request, response);
                break;
        }

    }
}
