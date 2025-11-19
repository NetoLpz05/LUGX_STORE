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
    
    // --- QUERY STRINGS ---
    private static final String INSERTAR = 
            "INSERT INTO Juego (nombre, genero, precio, stock, descripcion, imagen, plataforma) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECCIONAR_TODO = 
            "SELECT idJuego, nombre, genero, precio, stock, descripcion, imagen, plataforma FROM Juego";
    private static final String SELECCIONAR_X_ID = 
            "SELECT idJuego, nombre, genero, precio, stock, descripcion, imagen, plataforma FROM Juego WHERE idJuego = ?";
    private static final String ACTUALIZAR = 
            "UPDATE Juego SET nombre=?, genero=?, precio=?, stock=?, descripcion=?, imagen=?, plataforma=? WHERE idJuego = ?";
    private static final String ELIMINAR_X_ID = 
            "DELETE FROM Juego WHERE idJuego = ?";

    
    /**
     * Método auxiliar para mapear un ResultSet a un objeto Juego.
     */
    private Videojuego crearJuegoDesdeResultSet(ResultSet rs) throws SQLException {
        int idJuego = rs.getInt("idJuego");
        String nombre = rs.getString("nombre");
        String genero = rs.getString("genero");
        double precio = rs.getDouble("precio");
        int stock = rs.getInt("stock");
        String descripcion = rs.getString("descripcion");
        String imagen = rs.getString("imagen");
        String plataforma = rs.getString("plataforma");
        
        return new Videojuego(idJuego, nombre, genero, precio, stock, descripcion, imagen, plataforma);
    }
    
    // --------------------------------------------------------------------------------
    // 1. READ: Obtener todos los juegos
    // --------------------------------------------------------------------------------
    public List<Videojuego> listarTodos() {
        List<Videojuego> lista = new ArrayList<>();
        // Usamos try-with-resources para asegurar que Connection, PreparedStatement y ResultSet se cierren automáticamente
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(SELECCIONAR_TODO);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(crearJuegoDesdeResultSet(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error al listar juegos: " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }

    // --------------------------------------------------------------------------------
    // 2. READ: Obtener un juego por ID
    // --------------------------------------------------------------------------------
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
    
    // --------------------------------------------------------------------------------
    // 3. CREATE: Insertar un nuevo juego
    // --------------------------------------------------------------------------------
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
            ps.setString(7, juego.getPlataforma());
            
            filasAfectadas = ps.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Error al insertar juego: " + e.getMessage());
            e.printStackTrace();
        }
        return filasAfectadas > 0;
    }

    // --------------------------------------------------------------------------------
    // 4. UPDATE: Actualizar un juego existente
    // --------------------------------------------------------------------------------
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
            ps.setString(7, juego.getPlataforma());
            ps.setInt(8, juego.getIdJuego()); // El ID es el último parámetro en el UPDATE
            
            filasAfectadas = ps.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Error al actualizar juego: " + e.getMessage());
            e.printStackTrace();
        }
        return filasAfectadas > 0;
    }

    // --------------------------------------------------------------------------------
    // 5. DELETE: Eliminar un juego
    // --------------------------------------------------------------------------------
    public boolean eliminar(int id) {
        int filasAfectadas = 0;
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(ELIMINAR_X_ID)) {
            
            ps.setInt(1, id);
            
            filasAfectadas = ps.executeUpdate();
            
        } catch (SQLException e) {
            System.err.println("Error al eliminar juego: " + e.getMessage());
            e.printStackTrace();
        }
        return filasAfectadas > 0;
    }
}



