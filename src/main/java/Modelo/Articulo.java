package Modelo;

/**
 *
 * @author LABCISCO-PC007
 */
public class Articulo {
    private Videojuego videojuego;
    private int cantidad;

    public Articulo(Videojuego videojuego, int cantidad) {
        this.videojuego = videojuego;
        this.cantidad = cantidad;
    }

    public double getImporte() {
        return videojuego.getPrecio() * cantidad;
    }

    // Getters y Setters
    public Videojuego getVideojuego() {
        return videojuego;
    }

    public void setVideojuego(Videojuego videojuego) {
        this.videojuego = videojuego;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}