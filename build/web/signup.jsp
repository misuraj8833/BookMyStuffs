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
        <title>Sign up jsp</title>
    </head>
    <body>
        
        <% 
                // requesting form text fields values and storing as String.
                String username = request.getParameter("uname");
                String password = request.getParameter("upass");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String mail = request.getParameter("mail");
                String contact = request.getParameter("contact");
                String add = request.getParameter("add");
                
                
                
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
                try{
                // step4) firing queries.
                int i = stm.executeUpdate("insert into users values('"+fname+"','"+lname+"','"+username+"','"+password+"','"+add+"','"+contact+"','"+mail+"');");
               
                // creating cart for user
                int j = stm.executeUpdate("CREATE TABLE `bms`.`"+username+"` ( `productname` VARCHAR(45) NOT NULL,"
                        + " `quantity` DOUBLE NULL, "
                        + "`price` DOUBLE NULL, "
                        + "`shopname` VARCHAR(45) NULL, "
                        + "PRIMARY KEY (`productname`));");
                
                // closing all objects
                stm.close();
                conn.close();
                
                if(i==1 && j==0){
                    // it i==0 means values inserted now redirecting user to login page for log in.
                    response.sendRedirect("login.html");
                   
                }
                else{
                        //if i!=1 means value insertion operation failed. user need to again sign up.
                        response.sendRedirect("signup.html");
                }


                }
                catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
                    
                 out.println("Username already exist");
                 out.println("<a href='signup.html'> Sign up! </a>");
                }
        %>
        
    </body>
</html>
