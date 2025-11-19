/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author Usuario
 */
public class Reservacion {
    private int idReservacion;
    private int idUsuario;
    private Videojuego juego;
    private int cantidad;
    private Date fechaReservacion;
    private boolean completada; //True si la reservacion se ha completado, false si no

    public Reservacion() {}

    public Reservacion(int idReservacion, int idUsuario, Videojuego juego, int cantidad, Date fechaReservacion, boolean completada) {
        this.idReservacion = idReservacion;
        this.idUsuario = idUsuario;
        this.juego = juego;
        this.cantidad = cantidad;
        this.fechaReservacion = fechaReservacion;
        this.completada = completada;
    }

    // Getters
    public int getIdReservacion() { 
        return idReservacion; 
    }

    public int getIdUsuario() { 
        return idUsuario; 
    }

    public Videojuego getJuego() { 
        return juego; 
    }

    public int getCantidad() { 
        return cantidad; 
    }

    public Date getFechaReservacion() { 
        return fechaReservacion; 
    }

    //Setters
    public void setIdReservacion(int idReservacion) { 
        this.idReservacion = idReservacion; 
    }

    public void setIdUsuario(int idUsuario) { 
        this.idUsuario = idUsuario; 
    }

    public void setJuego(Videojuego juego) { 
        this.juego = juego; 
    }

    public void setCantidad(int cantidad) { 
        this.cantidad = cantidad; 
    }

    public void setFechaReservacion(Date fechaReservacion) { 
        this.fechaReservacion = fechaReservacion; 
    }

    public boolean isCompletada() { 
        return completada; 
    }

    public void setCompletada(boolean completada) { 
        this.completada = completada; 
    }
}
