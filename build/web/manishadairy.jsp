

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manisha Dairy</title>
    </head>
    <body>
        <%
               
            HttpSession sess = request.getSession(false);
            String username =sess.getAttribute("username").toString();
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
                
                // step4) firing queries.
                ResultSet rs = stm.executeQuery("select * from manishadairy");
                
                int flag = 0;
                double max,price;
                
                out.print("<table border=1>");
                out.print("<tr>"
                        + "<th>Product name</th>"
                        + "<th>Product Quantity</th>"
                        + "<th>Price</th>"
                        + "<th>Your Quantity</th>"
                        + "</tr>");
                while(rs.next()){
                    
                    max = rs.getDouble(3);
                    price = rs.getDouble(4);
                    out.print("<form action='addtocart.jsp'>");
                    out.print("<input type='hidden' name='shop' value='manishadairy'>");
                     out.print("<tr>");
                     out.print("<td>"+rs.getString(2)+"</td>");
                     out.print("<td>"+rs.getString(3)+"</td>");
                     out.print("<input type='hidden' name='price' value="+rs.getString(4)+">");
                     out.print("<td>"+price+"</td>");
                     out.print("<td> <input type='number' name='quantity' max="+max+" min=0 step=0.01></td>");
                     out.print("<input type='hidden' name='product' value="+rs.getString(2)+">");
                     out.print("<td><input type='submit' value='Add to Cart'></td>");
                     out.print("</tr>");
                     out.print("</form>");
                     
                }
                out.print("</table>");
                
                
                // closing all objects
                rs.close();
                stm.close();
                conn.close();
   
                

        %>
        
    
                

        
    </body>
</html>
