package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.sql.*;
import java.lang.*;

public final class manisha_005fdairy_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Manisha Dairy</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

               
            HttpSession sess = request.getSession(false);
            String username =sess.getAttribute("username").toString();
            
                //------------ from here jdbc code starts-------.
                // step1) loading jdbc-odbc drivers
                Class.forName("com.mysql.jdbc.Driver");
                
                // step2) Making Connection
                    // parameter to DriverManager.getConnection() is a connection string.
                    // connection string has 3 parameter as 1)url to database 2)username 3)password 
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bms","root","afrid");
                

                // step3) creating statement object
                // statement object is created using object of Connection.
                Statement stm = conn.createStatement();
                
                // step4) firing queries.
                ResultSet rs = stm.executeQuery("select * from manishadairy");
                
                int flag = 0,max;
                
                out.print("<table>");
                out.print("<tr>"
                        + "<th>Product name</th>"
                        + "<th>Product Quantity</th>"
                        + "<th>Your Quantity</th>"
                        + "</tr>");
                while(rs.next()){
                    out.print("<form action='addtocart.jsp'>");
                    out.print("<input type='hidden' name='shop' value='manisha_dairy'>");
                     out.print("<tr><td>");
                     out.print(rs.getString(2)+"</td><td>");
                     out.print(rs.getString(3)+"</td>");
                     max = rs.getInt(3);
                     
                     out.print("<td> <input type='number' name='qauntity' max="+max+" min=0></td>");
                     out.print("<input type='hidden' name='product' value="+rs.getString(2)+">");
                     out.print("<td><input type='submit' value='Add to Cart' onclick='insertdB()'></td>");
                     out.print("</tr>");
                     out.print("</form>");
                     
                }
                out.print("</table>");
                
                
                // closing all objects
                rs.close();
                stm.close();
                conn.close();
   
                

        
      out.write("\n");
      out.write("        \n");
      out.write("    \n");
      out.write("                \n");
      out.write("\n");
      out.write("        \n");
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
