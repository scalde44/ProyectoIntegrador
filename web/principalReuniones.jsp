
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Iconos/logo.png">
        <link href="estilos.css" rel="stylesheet" type="text/css">
        <title>Meeting Office</title>
    </head>
    <body background="Iconos/fondo1.png">
        <h3> 
            INICIO
        </h3>
        <br><br><br><br>
        <h2 align="center">
            <font size="4" color="black">
            BIENVENIDO
            </font>
        </h2>
        <h2 align="center">
            <font size="4" color="black">

            <% out.println(usu);%>
            </font>
        </h2>
        <br><br><br><br>
        <table border="0" width="700" align="center">
            <tr>
                <th><a href="ServletReunion?accion=listar">
                        <img src="Iconos/listaReuniones.png" width="70" height="70">
                    </a>
                    <p>Lista de reuniones</p></th>
                <th><a href="nuevaReunion.jsp">
                        <img src="Iconos/crearReunion.png" width="70" height="70">
                    </a><p>Crear reunion</p></th>
                <th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                <th>
                    <a href="subirArchivo.jsp">
                        <img src="Iconos/subirArchivo.png" width="70" height="70">
                    </a><p>Subir archivos</p>
                </th>
            </tr>
    </table>
    <br><br><br>
    <center>
        <a href="SalirLogin.jsp">
            <img src="Iconos/salirLogin.png" width="50" height="50">
        </a><p>Cerrar Sesión</p>
    </center>
</body>
</html>
