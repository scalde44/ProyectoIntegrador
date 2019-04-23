<%@page import="UsuarioBEANS.Reuniones"%>
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

<%@page import="java.util.ArrayList"%>
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
        <h3>REUNIONES</h3>
        
        <br><br><br><br><br><br>
        <table border="1" width="600" align="center">
            <tr bgcolor="gray">
                <th><font   color="black">Nombre reunion</font></th>
                <th><font   color="black">Lugar reunion</font></th>
                <th><font color="black">Asunto</font></th>
                <th><font color="black">Fecha</font></th>
                <th><font color="black">Hora</font></th>
                <th><font color="black">Invitados</font></th>
                <th><font color="black">Estado</font></th>
                <th><font color="black">Accion</font></th>
            </tr>
            <%
                ArrayList<Reuniones> lista
                        = (ArrayList<Reuniones>) request.getAttribute("lista");
                for (int i = 0; i < lista.size(); i++) {
                    Reuniones r = lista.get(i);
            %>
            <tr>
                <th><%=r.getNombreReunion()%></th>
                <th><%=r.getLugarReunion()%></th>
                <th><%=r.getAsuntoReunion()%></th>
                <th><%=r.getFechaReunion()%></th>
                <th><%=r.getHoraReunion()%></th>
                <th><%=r.getInvitados()%></th>
                <th><%=r.getEstado()%></th>
                <th>
                    <a href="ServletReunion?accion=desactivarReunion&nombre=<%=r.getNombreReunion()%>">
                        <img src="Iconos/desactivar.png" width="30" heigth="30">
                    </a>
                    <a href="ServletReunion?accion=activarReunion&nombre=<%=r.getNombreReunion()%>">
                        <img src="Iconos/activar.png" width="30" heigth="30">
                    </a>
                </th>


            </tr>
            <%
                }
            %>
        </table>
        <center>
        <a href="principalReuniones.jsp">
            <regresar>Regresar</regresar>
        </a>
    </center>
    </body>
</html>
