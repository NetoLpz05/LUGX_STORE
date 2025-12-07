package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class VideojuegoDAO {

    private static final String INSERTAR = 
        "INSERT INTO videojuego (nombre, genero, precio, stock, descripcion, imagen, imagenDetalles, plataforma) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECCIONAR_TODO = 
            "SELECT idJuego, nombre, genero, precio, stock, descripcion, imagen, imagenDetalles, plataforma FROM videojuego";
    private static final String SELECCIONAR_X_ID = 
            "SELECT idJuego, nombre, genero, precio, stock, descripcion, imagen, imagenDetalles, plataforma FROM videojuego WHERE idJuego = ?";
    private static final String ACTUALIZAR = 
            "UPDATE videojuego SET nombre=?, genero=?, precio=?, stock=?, descripcion=?, imagen=?, imagenDetalles=?, plataforma=? WHERE idJuego = ?";
    private static final String ELIMINAR_X_ID = 
            "DELETE FROM videojuego WHERE idJuego = ?";
    private static final String BUSCAR_X_NOMBRE = 
            "SELECT * FROM videojuego WHERE nombre LIKE ? LIMIT 5";
    
    /**
     * Método auxiliar para mapear un ResultSet a un objeto Juego
     */
    private Videojuego crearJuegoDesdeResultSet(ResultSet rs) throws SQLException {
        int idJuego = rs.getInt("idJuego");
        String nombre = rs.getString("nombre");
        String genero = rs.getString("genero");
        double precio = rs.getDouble("precio");
        int stock = rs.getInt("stock");
        String descripcion = rs.getString("descripcion");
        String imagen = rs.getString("imagen");
        String imagenDetalles = rs.getString("imagenDetalles");
        String plataforma = rs.getString("plataforma");
        
        return new Videojuego(idJuego, nombre, genero, precio, stock, descripcion, imagen, imagenDetalles, plataforma);
    }
    
    // 1. READ: Obtener todos los juegos
    public List<Videojuego> listarTodos() throws RuntimeException {
        List<Videojuego> lista = new ArrayList<>();

        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(SELECCIONAR_TODO);
             ResultSet rs = ps.executeQuery()) { 

            while (rs.next()) {
                lista.add(crearJuegoDesdeResultSet(rs));
            }
        } catch (SQLException e) {
            System.err.println("ERROR FATAL en VideojuegoDAO.listarTodos: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error en la Base de Datos al listar videojuegos.", e);
        }
        return lista;
    }

    // 2. READ: Obtener un juego por ID
    public Videojuego obtenerPorId(int id) {
        Videojuego juego = null;
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(SELECCIONAR_X_ID)) {
            
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    juego = crearJuegoDesdeResultSet(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener juego por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return juego;
    }
    
    // 3. CREATE: Insertar un nuevo juego
    public boolean insertar(Videojuego juego) {
        int filasAfectadas = 0;
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(INSERTAR)) {
            
            ps.setString(1, juego.getNombre());
            ps.setString(2, juego.getGenero());
            ps.setDouble(3, juego.getPrecio());
            ps.setInt(4, juego.getStock());
            ps.setString(5, juego.getDescripcion());
            ps.setString(6, juego.getImagen());
            ps.setString(7, juego.getImagenDetalles());
            ps.setString(8, juego.getPlataforma());

            filasAfectadas = ps.executeUpdate();
            
            if (filasAfectadas > 0) {
                con.commit(); 
            }
            
        } catch (SQLException e) {
            System.err.println("Error al insertar juego: " + e.getMessage());
            e.printStackTrace();
        }
        return filasAfectadas > 0;
    }

    // 4. UPDATE: Actualizar un juego existente
    public boolean actualizar(Videojuego juego) {
        int filasAfectadas = 0;
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(ACTUALIZAR)) {
            
            ps.setString(1, juego.getNombre());
            ps.setString(2, juego.getGenero());
            ps.setDouble(3, juego.getPrecio());
            ps.setInt(4, juego.getStock());
            ps.setString(5, juego.getDescripcion());
            ps.setString(6, juego.getImagen());
            ps.setString(7, juego.getImagenDetalles());
            ps.setString(8, juego.getPlataforma());
            ps.setInt(9, juego.getIdJuego());
            
            filasAfectadas = ps.executeUpdate();
            
            if (filasAfectadas > 0) {
                con.commit(); 
            }
            
        } catch (SQLException e) {
            System.err.println("Error al actualizar juego: " + e.getMessage());
            e.printStackTrace();
        }
        return filasAfectadas > 0;
    }

    // 5. DELETE: Eliminar un juego
    public boolean eliminar(int id) {
        int filasAfectadas = 0;
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(ELIMINAR_X_ID)) {
            
            ps.setInt(1, id);
            
            filasAfectadas = ps.executeUpdate();
            
            if (filasAfectadas > 0) {
                con.commit(); 
            }
            
        } catch (SQLException e) {
            System.err.println("Error al eliminar juego: " + e.getMessage());
            e.printStackTrace();
        }
        return filasAfectadas > 0;
    }
    
    public List<Videojuego> buscarPorNombre(String texto) {
        List<Videojuego> lista = new ArrayList<>();

        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(BUSCAR_X_NOMBRE)) {

            ps.setString(1, "%" + texto + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Videojuego v = new Videojuego();
                    v.setIdJuego(rs.getInt("idJuego"));
                    v.setNombre(rs.getString("nombre"));
                    v.setImagen(rs.getString("imagen"));
                    v.setPrecio(rs.getDouble("precio"));
                    v.setImagenDetalles(rs.getString("imagenDetalles"));
                    lista.add(v);
                }
            }

        } catch (SQLException e) {
            System.err.println("Error en búsqueda por nombre: " + e.getMessage());
            e.printStackTrace();
        }

        return lista;
    }
}