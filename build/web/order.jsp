<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>





<%
        
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
                        int i  = stm3.executeUpdate("update "+shopname+" set quantity="+diff+" where productname='"+productname+"'");
                        int j = stm4.executeUpdate("insert into "+shopname+"orders (`username`, `productname`, `quantity`, `price`) values ('"+username+"','"+productname+"',"+quantity+","+price+") ");
                }
                
                int k = stm5.executeUpdate("truncate table "+username+"");
                out.print("Order placed successfully");
                out.print("<br><a href='homepage.jsp'> Go to Home </a>");
%>
