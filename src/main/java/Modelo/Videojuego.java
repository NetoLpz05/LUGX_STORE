package Modelo;

/**
 *
 * @author ErnestoLpz_252663-PC007
 */
public class Videojuego {
    private int idJuego;
    private String nombre;
    private String genero;
    private double precio;
    private int stock;
    private String descripcion;
    private String imagen;
    private String imagenDetalles;
    private String plataforma;

    public Videojuego() {
    }

    public Videojuego(int idJuego, String nombre, String genero, double precio, int stock, String descripcion, String imagen, String plataforma) {
        this.idJuego = idJuego;
        this.nombre = nombre;
        this.genero = genero;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.plataforma = plataforma;
    }

    public Videojuego(int idJuego, String nombre, String genero, double precio, int stock, String descripcion, String imagen, String imagenDetalles, String plataforma) {
        this.idJuego = idJuego;
        this.nombre = nombre;
        this.genero = genero;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.imagenDetalles = imagenDetalles;
        this.plataforma = plataforma;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public String getNombre() {
        return nombre;
    }

    public String getGenero() {
        return genero;
    }

    public double getPrecio() {
        return precio;
    }

    public int getStock() {
        return stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public String getPlataforma() {
        return plataforma;
    }
    
    public String getImagenDetalles() {
        return imagenDetalles;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }
    
    public void setImagenDetalles(String imagenDetalles) {
        this.imagenDetalles = imagenDetalles;
    }

    @Override
    public String toString() {
        return "Videojuego{" + "idJuego=" + idJuego + ", nombre=" + nombre + ", genero=" + genero + ", precio=" + precio + ", stock=" + stock + ", descripcion=" + descripcion + ", imagen=" + imagen + ", imagenDetalles=" + imagenDetalles + ", plataforma=" + plataforma + '}';
    }
}
