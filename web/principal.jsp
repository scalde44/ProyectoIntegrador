
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Iconos/logo.png">
        <link href="estilos.css" rel="stylesheet" type="text/css">
        <title>Meeting Office</title>
    </head>
    <body background="Iconos/fondo1.png">
        <h3 > 
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
        <br><br>

        <table border="0" width="700" align="center">
            <tr>
                <th><a href="ServletMantenimiento?accion=listar">
                        <img src="Iconos/listaUsuarios.png" width="70" height="70">
                    </a>
                    <p>Lista de usuarios</p></th>
                <th><a href="consulta.jsp">
                        <img src="Iconos/consultarUsuario.png" width="70" height="70">
                    </a><p>Consultar usuarios</p></th>

                <th colspan="2">
                    <a href="nuevo.jsp">
                        <img src="Iconos/insertarUsuario2.png" width="70" height="70">
                    </a><p>Insertar usuarios</p>
                </th>
            </tr>
            <tr>
                <th><a href="ServletMantenimiento?accion=listarAdmin">
                        <img src="Iconos/listaAdmin.png" width="70" height="70">
                    </a>
                    <p>Lista de administradores</p></th>
                <th><a href="consultarAdmin.jsp">
                        <img src="Iconos/consultarAdmin.png" width="70" height="70">
                    </a><p>Consultar administradores</p></th>

                <th colspan="2">
                    <a href="nuevoAdmin.jsp">
                        <img src="Iconos/insertarAdmi.png" width="70" height="70">
                    </a><p>Insertar administrador</p>
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
