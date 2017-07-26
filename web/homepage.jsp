

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
       
         <%
             HttpSession sess = request.getSession(false);
            String username =sess.getAttribute("username").toString();
             if(username.equals(null)){
                response.sendError(654, "Login First! then proceed");
            }
             
             out.print("<a href='viewcart.jsp' align='center'> View Cart </a> <br>");
             out.print("<a href='order.jsp' align='center'> order products </a> <br>");
               try{
               
              
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
                ResultSet rs = stm.executeQuery("select * from shops");
                
                int flag = 0;
                out.print("<table>");
                while(rs.next()){
                     out.print("<tr><td>");
                     out.print("<a href='"+rs.getString(1)+".jsp'>");
                     out.print(rs.getString(1)+"</a>");
                     out.print("</tr>");
                }
                out.print("</table>");
                 // closing all objects
                rs.close();
                stm.close();
                conn.close();
                
                 }
               catch(Exception e){
                   
               }
 
        %>
        

    </body>
</html>
