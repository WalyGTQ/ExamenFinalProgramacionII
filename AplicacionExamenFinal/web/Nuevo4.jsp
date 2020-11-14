<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Nuevo</title>
    </head>
    <body>
        <h2 align="center">Registro de Estado</h2>
        <form action="">
            <table border="1" whidth="250" align="center">
                <tr>
                    <td>Codigo:</td>
                    <td><input type="text" name="txtCod"></td>
                </tr>
                <tr>
                    <td>Descripcion Estado:</td>
                    <td><input type="text" name="txtNom"></td>
                </tr>
               
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btnGrabar" value="Registrar Nuevo"></td>
                </tr>
                
            </table>
        </form>
        <%
            if(request.getParameter("btnGrabar")!=null){
                String cod=request.getParameter("txtCod");
                String nom=request.getParameter("txtNom");

                Connection cnx = null;
                Statement sta= null;
                ResultSet rs=null;

                try{
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 

                    sta = cnx.createStatement ();
                    sta.executeUpdate("insert into statusproyecto values('"+cod+"','"+nom+"')");
                    request.getRequestDispatcher("Consulta4.jsp").forward(request,response);
                    
                sta.close();
                rs.close();
                cnx.close();

                }catch(Exception e){out.println(e);}
            }

            %>
    </body>
</html>
