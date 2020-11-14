<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Responsable</title>
    </head>
    <body>
        <h1 align="center">Listado de Responsables</h1>
        <table align="center" border = "1" width="700">
            <tr bgcolor="skyblue">
                <th colspan="4">Mantenimiento de Responsables</th>
                <th>
                    <a href="Nuevo2.jsp"> <img src="Iconos/add.png" width="30" height="30">  </a > </th> 
            </tr>
            <tr bgcolor="skyblue">
                <th>Codigo</th><th>Apellido</th><th>Nombre</th><th>Codigo Profesion</th>
            </tr>
            <%
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs =null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 
                    
                sta = cnx.createStatement();
                rs= sta.executeQuery("Select * from responsable");
                
                while(rs.next()){
                    %>
                    <tr>
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th>
                            <a href="Editar2.jsp?cod=<%=rs.getString(1)%>"><img src="Iconos/mod.png" width="30" height="30"></a> ||
                            <a href="Eliminar2.jsp?cod=<%=rs.getString(1)%>"><img src="Iconos/del.jpg" width="30" height="30"> </a>
                        </th> 
                    </tr> 
                    <%
                }
                
                }catch(Exception e){}

                %>
        </table>
    </body>
</html>
