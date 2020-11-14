<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditarResponsable</title>
    </head>
    <body>
        <h2 align="center">Editar Responsable</h2>
        <%
            String cod = request.getParameter("cod");
            
                Connection cnx = null;
                Statement sta= null;
                ResultSet rs=null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 
                    
                sta = cnx.createStatement ();
                rs= sta.executeQuery("select * from responsable where IdResponsableProyecto='"+cod+"'");
                
                while(rs.next()){
            %>
        
        <form action="">
            <table border="1" whidth="250" align="center">
                <tr>
                    <td>Codigo:</td>
                    <td><input type="text" name="txtCod" readonly="readonly" value="<%=rs.getString(1)%>"></td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="txtApe" value="<%=rs.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNom" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td>Codigo Profesion:</td>
                    <td><input type="text" name="txtPro" value="<%=rs.getString(4)%>"></td>
                </tr>
                
                <tr>
                    <th align="center" colspan="2">
                        <input type="submit" name="btnGrabar" value="Editar Responsable"></td>
                </tr>
                
            </table>
        </form>
                    <%
                    }
                    }catch(Exception e){}
                    if (request.getParameter("btnGrabar")!=null) {
                    
                    String codu =request.getParameter("txtCod");
                    String pro =request.getParameter("txtApe");
                    String ini = request.getParameter("txtNom"); 
                    String fin =request.getParameter("txtPro");
                    
                    sta.executeUpdate("update responsable set ApellidoResponsableProyecto='"+pro+"', NombreResponsableProyecto='"+ini+"', IdProfesion='"+fin+"'where IdResponsableProyecto='"+codu +"'");
                    request.getRequestDispatcher("Consulta2.jsp").forward(request,response);
                     

                    }
                     %>
    </body>
</html>
