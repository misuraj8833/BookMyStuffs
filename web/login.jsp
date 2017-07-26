<%-- 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login JSP</title>
    </head>
    <body>
        
        <%
            // requesting form text fields values and storing as String.
                String username = request.getParameter("uname");
                String password = request.getParameter("upass");
                
                
                
                
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
                ResultSet rs = stm.executeQuery("select password from users where username='"+username+"'");
                
                int flag = 0;
                
                while(rs.next()){
                    String databasePassword = rs.getString(1);                    
                    if(databasePassword.equals(password)){
                         HttpSession sess = request.getSession(); 
                            sess.setAttribute("username", username);
                        flag=1;
                    }   
                }
                
                
                // closing all objects
                rs.close();
                stm.close();
                conn.close();
                
                if(flag==1){
                    
                    response.sendRedirect("homepage.jsp");
                }
                else{
                    response.sendRedirect("login.html");
                }
               
                
                
        %>
        
    </body>
</html>
