<%@page import="java.sql.ResultSet"%>
<%
    String usu = "";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="Login.jsp">
    <jsp:param name="msg" value="Ingresa Primero"/>
</jsp:forward>
<%
    } else {
        usu = (String) sesionOk.getAttribute("usuario");
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
    <inse>CREAR REUNION</inse>
    <form class="bax">
        <img src="Iconos/crearReunion.png" width="100" height="100">
    </form>
    <a href="principalReuniones.jsp">
            <regresarse>Regresar</regresarse>
        </a>
    <br><br><br><br><br><br><br>
    <form action="ServletReunion" class="reunion">
        <input type="text" name="txtNombreReunion" placeholder="Nombre Reunion" required="">
        <select name="txtLugar" required="">
            <option value="Lidis">Lidis </option>
            <option value="Farallones">Farallones </option>
            <option value="Lago">Lago </option>
        </select>
        <input type="text" name="txtAsunto" placeholder="Asunto" required="required">
        <input type="date" name="txtFecha" min="2019-03-20"
               max="2019-12-31" step="1" required>
        <input type="time" name="txtHora" min="07:00"
               max="21:00" step="60" required>
        <h4>Invitados:</h4>
        <jsp:useBean id="cn" class="Servlets.ServletReunion" scope="page"></jsp:useBean>
        <%
            ResultSet rs = cn.mostrar();
        %>
        <div class="checkbox">

            <%
                while (rs.next()) {

            %>

            <input type="checkbox" name="combo" id="<%=rs.getString("nombre")%>" value="<%=rs.getString("nombre")%>">
            <label for="<%=rs.getString("nombre")%>"><%=rs.getString("nombre")%></label>
            <%
                }
            %>
        </div>
        
        <input type="submit" name="btnl" value="Crear Reunion">
        <input type="hidden" name="accion" value="crear">
        <%
                if (request.getAttribute("msg") != null) {
                    %><h4><%out.println(request.getAttribute("msg"));%></h4><%
                }
            %>
    </form>


</body>
</html>
