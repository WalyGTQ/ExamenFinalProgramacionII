<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Profesion</title>
    </head>
    <body>
        <h1 align="center">Listado de profesiones</h1>
        <table align="center" border = "1" width="400">
            <tr bgcolor="skyblue">
                <th colspan="2">Mantenimiento de Profesiones</th>
                <th>
                    <a href="Nuevo3.jsp"> <img src="Iconos/add.png" width="30" height="30">  </a > </th> 
            </tr>
            <tr bgcolor="skyblue">
                <th>Codigo</th><th>Nombre Profesion</th>
            </tr>
            <%
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs =null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 
                    
                sta = cnx.createStatement();
                rs= sta.executeQuery("Select * from profesion");
                
                while(rs.next()){
                    %>
                    <tr>
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th>
                            <a href="Editar3.jsp?cod=<%=rs.getString(1)%>"><img src="Iconos/mod.png" width="30" height="30"></a> ||
                            <a href="Eliminar3.jsp?cod=<%=rs.getString(1)%>"><img src="Iconos/del.jpg" width="30" height="30"> </a>
                        </th> 
                    </tr> 
                    <%
                }
                
                }catch(Exception e){}

                %>
        </table>
    </body>
</html>
