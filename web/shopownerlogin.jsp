<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.lang.*"%>

<%
    String shopname = request.getParameter("shopname");
    String password = request.getParameter("password");
   
    
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
                int flag = 1;
                ResultSet rs = stm.executeQuery("select password from shopowners where shopname='"+shopname+"'");
                while(rs.next()){
                    String dbpass = rs.getString(1);
                    if(dbpass.equals(password)){
                        flag=1;
                    }
                }
                if(flag==1){
                    HttpSession sess = request.getSession();
                    sess.setAttribute("shopowner", shopname);
                    response.sendRedirect("showorders.jsp");
                }
                else{
                    response.sendError(1500, "Wrong username or password! try again");
                }
    
%>
