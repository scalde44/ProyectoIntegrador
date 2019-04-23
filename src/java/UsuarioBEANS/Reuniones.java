/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UsuarioBEANS;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author steve
 */
public class Reuniones {
     private String nombreReunion,lugarReunion,asuntoReunion;
     private Date fechaReunion;
     private Time horaReunion;
     private String invitados;
     private String estado;

    
    //

    public Reuniones(String nombreReunion, String lugarReunion, String asuntoReunion, Date fechaReunion, Time horaReunion, String invitados,String estado) {
        this.nombreReunion = nombreReunion;
        this.lugarReunion = lugarReunion;
        this.asuntoReunion = asuntoReunion;
        this.fechaReunion = fechaReunion;
        this.horaReunion = horaReunion;
        this.invitados = invitados;
        this.estado = estado;
    }
    //

    public String getNombreReunion() {
        return nombreReunion;
    }

    public void setNombreReunion(String nombreReunion) {
        this.nombreReunion = nombreReunion;
    }

    public String getLugarReunion() {
        return lugarReunion;
    }

    public void setLugarReunion(String lugarReunion) {
        this.lugarReunion = lugarReunion;
    }

    public String getAsuntoReunion() {
        return asuntoReunion;
    }

    public void setAsuntoReunion(String asuntoReunion) {
        this.asuntoReunion = asuntoReunion;
    }

    public Date getFechaReunion() {
        return fechaReunion;
    }

    public void setFechaReunion(Date fechaReunion) {
        this.fechaReunion = fechaReunion;
    }

    public Time getHoraReunion() {
        return horaReunion;
    }

    public void setHoraReunion(Time horaReunion) {
        this.horaReunion = horaReunion;
    }

    public String getInvitados() {
        return invitados;
    }

    public void setInvitados(String invitados) {
        this.invitados = invitados;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    

    
    

     
}
