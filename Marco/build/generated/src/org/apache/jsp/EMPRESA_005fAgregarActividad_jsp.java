package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class EMPRESA_005fAgregarActividad_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <form action=\"Actividad\">\n");
      out.write("            <input type=\"text\" name=\"titulo\" placeholder=\"titulo\">\n");
      out.write("            <input type=\"text\" name=\"descripcion\" placeholder=\"descripcion\">\n");
      out.write("            <input type=\"date\" name=\"fecha\" placeholder=\"fecha\">\n");
      out.write("            <input type=\"time\" name=\"hora\" placeholder=\"hora\">\n");
      out.write("            <input type=\"number\" name=\"duracion\" placeholder=\"duracion\">\n");
      out.write("            <input type=\"number\" name=\"cupos\" placeholder=\"cupos\">\n");
      out.write("            <input type=\"number\" name=\"precio\" placeholder=\"precio\">\n");
      out.write("            <select name=\"categoria\">\n");
      out.write("                <option value=\"1\">activo</option>\n");
      out.write("                <option>cancelado</option>\n");
      out.write("\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <select name=\"lugar\">\n");
      out.write("                <option value=\"1\">activo</option>\n");
      out.write("                <option>cancelado</option>\n");
      out.write("\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <select name=\"estado\"> \n");
      out.write("                <option value=\"1\">activo</option>\n");
      out.write("                <option>cancelado</option>\n");
      out.write("\n");
      out.write("            </select>\n");
      out.write("            <input type=\"hidden\" value=\"1\" name=\"accion\">\n");
      out.write("            <input type=\"submit\" value=\"crear y publicar\">\n");
      out.write("\n");
      out.write("            ");
if (request.getAttribute("exito") != null) {
      out.write("\n");
      out.write("            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${exito}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("            ");
} else {
      out.write("\n");
      out.write("\n");
      out.write("            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("            ");
}
      out.write("\n");
      out.write("        </form>\n");
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
