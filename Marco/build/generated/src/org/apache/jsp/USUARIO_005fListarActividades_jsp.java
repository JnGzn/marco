package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.vo.ActividadVO;
import modelo.dao.ActividadDAO;

public final class USUARIO_005fListarActividades_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("          <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/flaticon.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/themify-icons.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/slick.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/nice-select.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/magnific-popup.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>actividades</h1>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <th>foto</th>\n");
      out.write("                <th>titulo</th>\n");
      out.write("                <th>descripcion</th>\n");
      out.write("                <th>precio</th>\n");
      out.write("            </tr>\n");
      out.write("          \n");
      out.write("             \n");
      out.write("             \n");
      out.write("            ");
 ActividadDAO actDAO = new ActividadDAO();

                for (ActividadVO actVo : actDAO.ListarDatos()) {
      out.write("\n");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>      </td>\n");
      out.write("                <td>        ");
      out.print(   actVo.getTitulo());
      out.write("</td>\n");
      out.write("                <td>        ");
      out.print( actVo.getDescripcion());
      out.write("</td>\n");
      out.write("                <td> ");
      out.print(  actVo.getPrecio());
      out.write(" </td>\n");
      out.write("                <td> <a href=\"USUARIO_Reserva.jsp?reservar=");
      out.print(  actVo.getId());
      out.write("\" >reservar</a></td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <a href=\"sfsad\" me\n");
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