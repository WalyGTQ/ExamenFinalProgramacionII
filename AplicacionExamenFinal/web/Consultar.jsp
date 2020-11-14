<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Proyectos</title>
    </head>
    <body>
        <h1 align="center">Listado de Proyectos</h1>
        <table align="center" border = "1" width="900">
            <tr bgcolor="skyblue">
                <th colspan="6">Mantenimiento de Proyectos</th>
                <th>
                    <a href="Nuevo.jsp"> <img src="Iconos/add.png" width="30" height="30">  </a > </th> 
            </tr>
            <tr bgcolor="skyblue">
                <th>Codigo</th><th>NombreProyecto</th><th>Fecha Inicio</th><th>Fecha Final</th><th>Porcentaje Avance</th><th>Estatus Proyecto</th><th>Acciones</th>
            </tr>
            <%
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs =null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 
                    
                sta = cnx.createStatement();
                rs= sta.executeQuery("Select * from proyecto");
                
                while(rs.next()){
                    %>
                    <tr>
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getString(5)%></th>
                        <th><%=rs.getString(6)%></th>
                        <th>
                            <a href="Editar.jsp?cod=<%=rs.getString(1)%>"><img src="Iconos/mod.png" width="30" height="30"></a> ||
                            <a href="eliminar.jsp?cod=<%=rs.getString(1)%>"><img src="Iconos/del.jpg" width="30" height="30"> </a>
                        </th> 
                    </tr> 
                    <%
                }
                
                }catch(Exception e){}

                %>
        </table>
    </body>
</html>
