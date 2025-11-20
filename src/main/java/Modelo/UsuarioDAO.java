package Modelo;

import Controlador.Conexion;
import Enum.tipoUsuario;
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
public class UsuarioDAO {
    private static final String SELECT_ALL = "SELECT * FROM usuario";
    private static final String DELETE = "DELETE FROM usuario WHERE idUsuario = ?";
    private static final String SELECCIONAR_X_ID = "SELECT * FROM usuario WHERE idUsuario = ?";
    
    public List<Usuario> listarUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Usuario u = new Usuario();
                
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
                u.setDireccion(rs.getString("direccion"));
                u.setTelefono(rs.getString("telefono"));
                
                String rolString = rs.getString("tipo_usuario");
                if (rolString != null) {
                    try {
                        u.setRol(tipoUsuario.valueOf(rolString.toUpperCase()));
                    } catch (IllegalArgumentException e) {
                        System.err.println("Rol desconocido en BD: " + rolString);
                    }
                }
                
                lista.add(u);
            }
        } catch (SQLException e) {
            System.err.println("Error al listar usuarios: " + e);
        }
        return lista;
    }
    
    public Usuario obtenerPorId(int id) {
        Usuario u = null;
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(SELECCIONAR_X_ID)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new Usuario();
                    u.setIdUsuario(rs.getInt("idUsuario"));
                    u.setNombre(rs.getString("nombre"));
                    u.setCorreo(rs.getString("correo"));
                    u.setPassword(rs.getString("password"));

                    // Conversión de Rol
                    String rolString = rs.getString("tipo_usuario");
                    if (rolString != null) {
                        try {
                            u.setRol(tipoUsuario.valueOf(rolString.toUpperCase()));
                        } catch (IllegalArgumentException e) {}
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar usuario por ID: " + e);
        }
        return u;
    }

    public boolean eliminarUsuario(int id) {
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(DELETE)) {
            
            ps.setInt(1, id);
            
            int rows = ps.executeUpdate();
            
            if(rows > 0) {
                con.commit(); 
            }
            return rows > 0;
            
        } catch (SQLException e) {
            System.err.println("Error al eliminar usuario: " + e);
            return false;
        }
    }
}