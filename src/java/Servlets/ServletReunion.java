/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import UsuarioBEANS.Reuniones;
import UsuarioBEANS.Usuario;
import Utils.ConexionBD;
import Utils.ConexionBDReunion;
import java.io.IOException;
import static java.lang.String.format;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author steve
 */
@WebServlet(name = "ServletReunion", urlPatterns = {"/ServletReunion"})
public class ServletReunion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public ResultSet mostrar() throws SQLException {
        Connection cnxr = ConexionBD.getConexion();

        PreparedStatement sta = cnxr.prepareStatement("select * from usuarios");
        ResultSet rs = sta.executeQuery();
        return rs;

    }
    // Parse fecha

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        Connection cnxr = ConexionBDReunion.getConexion();
        if (accion.equals("listar")) {
            try {
                PreparedStatement sta = cnxr.prepareStatement("select * from reunion");
                ResultSet rs = sta.executeQuery();

                ArrayList<Reuniones> lista = new ArrayList<Reuniones>();
                while (rs.next()) {
                    Reuniones r = new Reuniones(rs.getString(1), rs.getString(2), rs.getString(3),rs.getDate(4),rs.getTime(5),rs.getString(6),rs.getString(7));
                    lista.add(r);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("listaReuniones.jsp").forward(request, response);
            } catch (Exception e) {
            }

        } else if (accion.equals("crear")) {

            String nombre = request.getParameter("txtNombreReunion");
            String lugar = request.getParameter("txtLugar");
            String asunto = request.getParameter("txtAsunto");
            String fechaString = request.getParameter("txtFecha");
            String horaString = request.getParameter("txtHora");
            String estado = "Activa";
            //  Castear Fecha
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
            Date parsed = format.parse(fechaString);
            java.sql.Date fecha = new java.sql.Date(parsed.getTime());
            //  Castear Hora
            DateFormat formatter = new SimpleDateFormat("HH:mm");
            java.sql.Time hora = new java.sql.Time(formatter.parse(horaString).getTime());
            //
            String[] seleccion;
            seleccion = request.getParameterValues("combo");
            String invitados = "";
            try {

                PreparedStatement sta = cnxr.prepareStatement("insert into reunion values(?,?,?,?,?,?,?)");
                sta.setString(1, nombre);
                sta.setString(2, lugar);
                sta.setString(3, asunto);
                sta.setDate(4, fecha);
                sta.setTime(5, hora);
                if (seleccion != null) {
                    for (int i = 0; i < seleccion.length; i++) {
                        invitados += " " + seleccion[i] + " ";
                    }
                }

                sta.setString(6, invitados);
                sta.setString(7, estado);
                sta.executeUpdate();
                request.getRequestDispatcher("principalReuniones.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("msg", "Ya hay una reunion creada con ese nombre");
                request.getRequestDispatcher("nuevaReunion.jsp").forward(request, response);
            }

        } else if (accion.equalsIgnoreCase("desactivarReunion")) {
            String nombre = request.getParameter("nombre");
            String estado= "Inactiva";
            try {
                PreparedStatement staEl = cnxr.prepareStatement("update reunion set estado=? where nombreReunion=?");
                staEl.setString(1, estado);
                staEl.setString(2, nombre);
                staEl.executeUpdate();
                request.getRequestDispatcher("ServletReunion?accion=listar").forward(request, response);
            } catch (Exception e) {
            }
        }else if (accion.equalsIgnoreCase("activarReunion")) {
            String nombre = request.getParameter("nombre");
            String estado= "Activa";
            try {
                PreparedStatement staEl = cnxr.prepareStatement("update reunion set estado=? where nombreReunion=?");
                staEl.setString(1, estado);
                staEl.setString(2, nombre);
                staEl.executeUpdate();
                request.getRequestDispatcher("ServletReunion?accion=listar").forward(request, response);
            } catch (Exception e) {
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ServletReunion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ServletReunion.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
