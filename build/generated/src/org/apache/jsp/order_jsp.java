package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Vector;
import java.sql.*;
import javax.sql.*;
import java.lang.*;

public final class order_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");

        
                HttpSession sess = request.getSession(false);
                    String username =sess.getAttribute("username").toString();


                    Vector v = new Vector();
                    if(username.equals(null)){
                        response.sendError(654, "Login First! then proceed");
                    }
      
            

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
                Statement stm2 = conn.createStatement();
                Statement stm3 = conn.createStatement();
                Statement stm4 = conn.createStatement();
                Statement stm5 = conn.createStatement();
                
                String productname,shopname;
                double quantity,price,oldquantity=0,diff=0;
                // step4) firing queries.
                ResultSet rs = stm.executeQuery("select * from "+username+"");
                
                while(rs.next()){
                    productname = rs.getString(1);
                    quantity = rs.getDouble(2);
                    price = rs.getDouble(3);
                    shopname = rs.getString(4);
                    
                        ResultSet rs1 = stm2.executeQuery("select quantity from "+shopname+" where productname='"+productname+"'");
                        while(rs1.next()){
                            oldquantity = rs1.getDouble(1);
                        }
                        diff = oldquantity-quantity;
                        int i  = stm3.executeUpdate("update "+shopname+" set quantity="+diff+" where productname="+productname+"");
                        out.print("insert into "+shopname+"order ('username','productname','quantity','price') values ('"+username+"','"+productname+"',"+quantity+","+price+") ");
                }
                
                int k = stm5.executeUpdate("truncate table "+username+"");
                out.print("Order placed successfully");
                out.print("<br><a href='homepage'> Go to Home </a>");

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
