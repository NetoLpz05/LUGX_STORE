package Modelo;

/**
 *
 * @author ErnestoLpz_252663
 */
public class CarritoItem {
    private int idItem;
    private int idUsuario;
    private Videojuego videojuego;
    private int cantidad;
    private double precioTotal;

    public CarritoItem(){

    }

    public CarritoItem(int idItem, int idUsuario, Videojuego videojuego, int cantidad) {
        this.idItem = idItem;
        this.idUsuario = idUsuario;
        this.videojuego = videojuego;
        this.cantidad = cantidad;
        this.precioTotal = videojuego.getPrecio() * cantidad;
    }

    // Getters
    public int getIdItem() {
        return idItem;
    }
    public int getIdUsuario() {
        return idUsuario;
    }
    public Videojuego getVideojuego() {
        return videojuego;
    }
    public int getCantidad() {
        return cantidad;
    }
    public double getPrecioTotal() {
        return precioTotal;
    }

    //Setters
    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public void setVideojuego(Videojuego videojuego) {
        this.videojuego = videojuego;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
        this.precioTotal = this.videojuego.getPrecio() * cantidad;
    }
    public void setPrecioTotal(double precioTotal) {
        this.precioTotal = precioTotal;
    }
}
