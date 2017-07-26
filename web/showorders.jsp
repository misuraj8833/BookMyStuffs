<%-- 
    Document   : showorders
    Created on : Apr 2, 2017, 8:12:08 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page  import="java.lang.*"%>

<%
            HttpSession sess = request.getSession();
            String shopname = sess.getAttribute("shopowner").toString();
    
                Class.forName("com.mysql.jdbc.Driver");
                
                // step2) Making Connection
                    // parameter to DriverManager.getConnection() is a connection string.
                    // connection string has 3 parameter as 1)url to database 2)username 3)password 
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bms","root","afrid");
                

                // step3) creating statement object
                // statement object is created using object of Connection.
                Statement stm = conn.createStatement();
                
                // step4) firing queries.
                out.print("<br>");
                out.print("<h1 align='center'>"+shopname+" <h1>");
                ResultSet rs = stm.executeQuery("select * from "+shopname+"orders");
                out.print("<br>");
                out.print("<center><table border>");
                out.print("<tr>");
                out.print("<th>Username</th>"
                        + "<th>Productname</th>"
                        + "<th>Quantity</th>"
                        + "<th>Price</th>");
                out.print("</tr>");
                while(rs.next()){
                    out.print("<tr>");
                    out.print("<td>"+rs.getString(2) +"</td>"
                        + "<td>"+rs.getString(3)+"</td>"
                        + "<td>"+rs.getDouble(4) +"</td>"
                        + "<td>"+rs.getDouble(5) +"</td>");
                    out.print("</tr>");
                }
                out.print("</table></center>");
%>
