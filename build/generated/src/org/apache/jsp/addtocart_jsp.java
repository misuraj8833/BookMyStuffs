package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.sql.*;
import java.lang.*;

public final class addtocart_jsp extends org.apache.jasper.runtime.HttpJspBase
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


            HttpSession sess = request.getSession(false);
            String username =sess.getAttribute("username").toString();
                int i=0;
                String shop = request.getParameter("shop");
                String product = request.getParameter("product");
                double qauntity = Double.parseDouble(request.getParameter("qauntity"));
                double price = Double.parseDouble(request.getParameter("price"));
                price = price * qauntity;
//                out.print(shop+product+qauntity);
            
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
                ResultSet rs = stm.executeQuery("select * from "+username+" where productname='"+product+"'");
               if(rs.next()){
                  ResultSet rs1 = stm.executeQuery("select qauntity,price from "+username+" where productname='"+product+"'");
                  while(rs1.next()){
                      i = stm.executeUpdate("update "+username+" set quantity = "+qauntity+", price = "+price+" where productname='"+product+"'");
                  }
               }
               else{
                   i = stm.executeUpdate("insert into "+username+" (`productname`, `quantity`, `price`, `shopname`) values ('"+product+"',"+qauntity+","+price+",'"+shop+"')");
                }

                if(i == 1){
                    out.println(product+"Added to cart");
                    out.println("<a href='homepage.jsp'>Go to Home</a>");
                    out.println("<a href='"+shop+".jsp'></a>");
                }
                else{
                    response.sendError(333, "Failed to add in cart. please try to add again.");
                }


      out.write('\n');
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
