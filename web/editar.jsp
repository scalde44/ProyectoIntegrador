<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Utils.ConexionBD"%>
<%@page import="java.sql.Connection"%>
<%
    String usu = "";
    HttpSession sesionOkk = request.getSession();
    if (sesionOkk.getAttribute("administrador") == null) {
%>
<jsp:forward page="Login.jsp">
    <jsp:param name="msg" value="Ingresa Primero"/>
</jsp:forward>
<%
    } else {
        usu = (String) sesionOkk.getAttribute("administrador");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Iconos/logo.png">
        <link href="estilos.css" rel="stylesheet" type="text/css">
        <title>Meeting Office</title>
    </head>
    <body background="Iconos/fondo1.png">
       <h1 align="center"> 
            <font size="7" color="white">EDITAR USUARIOS</font>
        </h1>
        <br><br><br><br><br><br><br>
        <%
            String codigo = request.getParameter("codigo");
            Connection cnx = null;
            PreparedStatement sta = null;
            ResultSet rs = null;
            try {
                 
                cnx = ConexionBD.getConexion();
                sta = cnx.prepareStatement("select * from usuarios");
                 
                rs = sta.executeQuery();
                rs = sta.executeQuery("select * from usuarios where codigo='" + codigo + "'");
                while (rs.next()) {

        %>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Codigo:</td>
                    <td><input type="text" name="txtCodigo" value="<%=rs.getString(1)%>"readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNombre" value="<%=rs.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td><input type="text" name="txtCorreo" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td><input type="text" name="txtContrasena" value="<%=rs.getString(4)%>"readonly="readonly"></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btnGrabar"
                               value="Editar Usuario"></th>
                </tr>
            </table>
        </form>

        <%
                }
            } catch (Exception e) {}
            if(request.getParameter("btnGrabar")!=null){
            String cod=request.getParameter("txtCodigo");
            String nom=request.getParameter("txtNombre");
            String email=request.getParameter("txtCorreo");
            String pass=request.getParameter("txtContrasena");
            
                sta = cnx.prepareStatement("update usuarios set nombre=?,correo=?,contrasena=? where codigo=?");
                sta.setString(1, nom);
                sta.setString(2, email);
                sta.setString(3, pass);
                sta.setString(4, cod);
                sta.executeUpdate();
            request.getRequestDispatcher("principal.jsp").forward(request, response);}
        %>

    </body>
</html>
