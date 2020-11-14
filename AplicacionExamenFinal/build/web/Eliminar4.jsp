<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EliminarEstado</title>
    </head>
    <body>
        <%
            
            String cod=request.getParameter("cod");
           

            Connection cnx = null;
            Statement sta= null;
            ResultSet rs=null;

            try{
            Class.forName("com.mysql.jdbc.Driver");    
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 

            sta = cnx.createStatement();
            sta.executeUpdate("delete from statusproyecto where IdStatusProyecto='"+cod+"'");
            request.getRequestDispatcher("Consulta4.jsp").forward(request,response);
            
            sta.close();
            rs.close();
            cnx.close();

            }catch(Exception e){out.println(e);}
            %>
    </body>
</html>
