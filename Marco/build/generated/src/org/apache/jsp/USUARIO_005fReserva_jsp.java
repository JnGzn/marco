package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.dao.UsuarioDAO;
import modelo.vo.UsuarioVO;
import modelo.vo.ActividadVO;
import modelo.dao.ActividadDAO;

public final class USUARIO_005fReserva_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        ");
 String id = (String) request.getParameter("reservar");
            if (id != null) {
                ActividadDAO actiDAO = new ActividadDAO();
                ActividadVO actiVO = new ActividadVO();
                actiVO
                        = actiDAO.ListarDatos(id);
        
      out.write("\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <th>foto</th>\n");
      out.write("                <th>titulo</th>\n");
      out.write("                <th>descripcion</th>\n");
      out.write("                <th>precio</th>\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>      </td>\n");
      out.write("                <td>        ");
      out.print(   actiVO.getTitulo());
      out.write("</td>\n");
      out.write("                <td>        ");
      out.print( actiVO.getDescripcion());
      out.write("</td>\n");
      out.write("                <td> ");
      out.print(  actiVO.getPrecio());
      out.write(" </td>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        ");
}
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            HttpSession sesion = request.getSession();
            String idUsuario = (String) sesion.getAttribute("id");
            UsuarioDAO usuDAO = new UsuarioDAO();
            UsuarioVO usuVO = UsuarioDAO.listarDatos(idUsuario);
            


        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"Actividad\" method=\"post\">\n");
      out.write("\n");
      out.write("            <label>boletos</label>\n");
      out.write("            <input type=\"number\" name=\"ctxCupos\"><br>\n");
      out.write("\n");
      out.write("            <label>nombre</label>\n");
      out.write("            <input type=\"text\" name=\"ctxNombres\" value=\"");
      out.print(usuVO.getNombres());
      out.write("\"><br>\n");
      out.write("\n");
      out.write("            <label>apellidos</label>\n");
      out.write("            <input type=\"text\" name=\"ctxApellidos\" value=\"");
      out.print(usuVO.getApellidos());
      out.write("\"><br>\n");
      out.write("\n");
      out.write("            <label>No. documento</label>\n");
      out.write("            <input type=\"number\" name=\"ctxNombres\" value=\"");
      out.print(usuVO.getDocumento());
      out.write("\"><br>\n");
      out.write("\n");
      out.write("            <label>correo</label>\n");
      out.write("            <input type=\"text\" name=\"ctxCorreo\" value=\"");
      out.print(usuVO.getCorreo());
      out.write("\"><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <input type=\"hidden\" name=\"ctxIdUsuario\" value=\"");
      out.print(idUsuario);
      out.write("\"><br>\n");
      out.write("\t       <input type=\"hidden\" name=\"ctxIdActividad\" value=\"");
      out.print(id);
      out.write("\"><br>\n");
      out.write("\n");
      out.write("           <label>calificar</label>\n");
      out.write("            <input type=\"number\" name=\"ctxCalificacion\" value=\"");
//calificacion
      out.write("\"><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
