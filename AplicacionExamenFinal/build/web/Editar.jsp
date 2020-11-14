<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        <h2 align="center">Editar Proyecto</h2>
        <%
            String cod = request.getParameter("cod");
            
                Connection cnx = null;
                Statement sta= null;
                ResultSet rs=null;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx=DriverManager.getConnection("jdbc:mysql://localhost/examenfinal?user=root&password="); 
                    
                sta = cnx.createStatement ();
                rs= sta.executeQuery("select * from proyecto where IdProyecto='"+cod+"'");
                
                while(rs.next()){
            %>
        
        <form action="">
            <table border="1" whidth="250" align="center">
                <tr>
                    <td>Codigo:</td>
                    <td><input type="text" name="txtCod" readonly="readonly" value="<%=rs.getString(1)%>"></td>
                </tr>
                <tr>
                    <td>Nombre Proyecto:</td>
                    <td><input type="text" name="txtNom" value="<%=rs.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Fecha Inicio:</td>
                    <td><input type="text" name="txtIni" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td>Fecha Final:</td>
                    <td><input type="text" name="txtFin" value="<%=rs.getString(4)%>"></td>
                </tr>
                <tr>
                    <td>% Avance:</td>
                    <td><input type="text" name="txtAva" value="<%=rs.getString(5)%>"></td>
                </tr>
                 <tr>
                    <td>Estado:</td>
                    <td><input type="text" name="txtEst" value="<%=rs.getString(6)%>"></td>
                </tr>
                <tr>
                    <th align="center" colspan="2">
                        <input type="submit" name="btnGrabar" value="Editar Proyecto"></td>
                </tr>
                
            </table>
        </form>
                    <%
                    }
                    }catch(Exception e){}
                    if (request.getParameter("btnGrabar")!=null) {
                    
                    String codu =request.getParameter("txtCod");
                    String pro =request.getParameter("txtNom");
                    String ini = request.getParameter("txtIni"); 
                    String fin =request.getParameter("txtFin");
                    String ava = request.getParameter("txtAva");
                    String est = request.getParameter("txtEst");
                    
                    sta.executeUpdate("update proyecto set NombreProyecto='"+pro+"', FechaEstimadaInicio='"+ini+"', FechaEstimadaFinal='"+fin+"', PorcentajeAvance='"+ava+"', EstatusProyecto='"+est+"' where IdProyecto='"+codu +"'");
                    request.getRequestDispatcher("Consultar.jsp").forward(request,response);
                     

                    }
                     %>
    </body>
</html>
