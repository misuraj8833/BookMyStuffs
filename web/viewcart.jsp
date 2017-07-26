
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>

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
                Statement stm2 = conn.createStatement();
                
                
                // step4) firing queries.
                ResultSet rs = stm.executeQuery("select * from "+username+"");
                
                out.print("<a href='homepage.jsp'> Home </a>");
                out.print("<br><br><br>");
                out.print("<table align='center' border>"
                        + "<th> Product Name</th>"
                        + "<th> Quantity</th>"
                        + "<th> Price</th>"
                        + "<th> Shop Name</th>");
                while(rs.next()){
                    out.print("<tr>");
                    out.print("<td>"+rs.getString(1) +"</td>");
                    out.print("<td>"+rs.getString(2) +"</td>");
                    out.print("<td>"+rs.getString(3) +"</td>");
                    out.print("<td>"+rs.getString(4) +"</td>");
                    out.print("</tr>");
                    
                    
                }
                Double sum=0.0;
                ResultSet rs1 = stm2.executeQuery("select sum(price) from "+username+"");
                while(rs1.next()){
                    sum=rs1.getDouble(1);
                }
                out.print("<td colspan=2 align='center'> total </td>");
                out.print(" <td> "+sum+"/-</td> <td>Rs</td>");
                out.print("</table>");
                out.print("<br><br>");
                
                rs.close();
                stm.close();
                conn.close();
%>