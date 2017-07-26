
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
            
                int i=0, flag=0;
                String shop = request.getParameter("shop");
                String product = request.getParameter("product");
                double quantity = Double.parseDouble(request.getParameter("quantity"));
                double price = Double.parseDouble(request.getParameter("price"));
                price = price * quantity;
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
               while(rs.next()){
                   flag=1;
               }
                
                if(flag==1){
                   i = stm.executeUpdate("update "+username+" set quantity = "+quantity+", price = "+price+" where productname='"+product+"'");
               }
               else{
                   i = stm.executeUpdate("insert into "+username+" (`productname`, `quantity`, `price`, `shopname`) values ('"+product+"',"+quantity+","+price+",'"+shop+"')");
                }

                if(i == 1){
                    out.println(product+" Added to cart<br>");
                    out.println("<a href='homepage.jsp'>Go to Home</a><br>");
                    out.println("<a href='"+shop+".jsp'> Back</a>");
                }
                else{
                    response.sendError(333, "Failed to add in cart. please try to add again.");
                }
                

                rs.close();
                stm.close();
                conn.close();

%>
