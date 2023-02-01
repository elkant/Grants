package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <title>Grants Tracking System</title>\n");
      out.write("\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900&subset=latin,greek,greek-ext,vietnamese,cyrillic-ext,latin-ext,cyrillic' rel='stylesheet' type='text/css'>\n");
      out.write("\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"assets/img/favicon-16x16.png\">\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"assets/img/favicon-32x32.png\">\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" sizes=\"96x96\" href=\"assets/img/favicon-96x96.png\">\n");
      out.write("\n");
      out.write("  <link rel=\"stylesheet\" href=\"styles/vendor-2cae343ef1.css\">\n");
      out.write("\n");
      out.write("  <link rel=\"stylesheet\" href=\"styles/auth-a200a050c1.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<main class=\"auth-main\">\n");
      out.write("  <div class=\"auth-block\">\n");
      out.write("    <h1  style='background-color:white;color:red;'>Grants Tracking System</h1>\n");
      out.write("    <!--<a href=\"reg.html\" class=\"auth-link\">New to Blur Admin? Sign up!</a>-->\n");
      out.write("\n");
      out.write("    <form class=\"form-horizontal\">\n");
      out.write("      <div class=\"form-group\">\n");
      out.write("        <label for=\"inputEmail3\" class=\"col-sm-2 control-label\">username</label>\n");
      out.write("\n");
      out.write("        <div class=\"col-sm-10\">\n");
      out.write("          <input type=\"email\" class=\"form-control\" id=\"inputEmail3\" placeholder=\"Email\">\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"form-group\">\n");
      out.write("        <label for=\"inputPassword3\" class=\"col-sm-2 control-label\">Password</label>\n");
      out.write("\n");
      out.write("        <div class=\"col-sm-10\">\n");
      out.write("          <input type=\"password\" class=\"form-control\" id=\"inputPassword3\" placeholder=\"Password\">\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"form-group\">\n");
      out.write("        <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("          <button type=\"submit\" class=\"btn btn-default btn-auth\">Sign in</button>\n");
      out.write("          <a href class=\"forgot-pass\">Forgot password?</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("    <div ><span></span></div>\n");
      out.write("\n");
      out.write("    <div class=\"al-share-auth\">\n");
      out.write("      <ul class=\"al-share clearfix\">\n");
      out.write("          <img alt=\"\" style='height:85px;' src=\"assets/img/aphia_logo.png\">\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</main>\n");
      out.write("</body>\n");
      out.write("</html>");
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
