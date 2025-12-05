package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ErnestoLpz_252663
 */
public class Consultas extends Conexion {

    public Consultas() throws SQLException {
    }

    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuario where nombre = ? and password = ?";
            System.out.println("La consulta es: " + consulta);
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                // if(getConexion() != null) getConexion().close();
            } catch (Exception e) {
                System.out.println("Error al cerrar recursos: " + e);
            }
        }
        return false;
    }

    public boolean registrar(String nombre, String password, String correo, String telefono, String direccion, String tipo) {
        Connection con = null;
        PreparedStatement pst = null;
        
        String sql = "INSERT INTO usuario (nombre, correo, password, direccion, telefono, tipo_usuario) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            con = getConexion(); 
            pst = con.prepareStatement(sql);

            pst.setString(1, nombre);
            pst.setString(2, correo);
            pst.setString(3, password);
            pst.setString(4, telefono);
            pst.setString(5, direccion);
            pst.setString(6, tipo);

            int filas = pst.executeUpdate();

            if (filas > 0) {
                con.commit(); 
                return true;
            }
            
        } catch (Exception e) {
            System.err.println("Error al registrar: " + e);
            try {
                if (con != null) con.rollback(); 
            } catch (SQLException ex) { }
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) { }
        }
        return false;
    }

    public void cerrarConexion() {
        try {
            if (getConexion() != null) {
                getConexion().close();
                System.out.println("Conexión cerrada.");
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e);
        }
    }
    
    public boolean esAdministrador(String usuario) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean esAdmin = false;
        
        String sql = "SELECT tipo_usuario FROM usuario WHERE nombre = ?";
        
        try {
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, usuario);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                String tipo = rs.getString("tipo_usuario");
                if ("admin".equalsIgnoreCase(tipo)) {
                    esAdmin = true;
                }
            }
        } catch (Exception e) {
            System.err.println("Error de SQL al verificar rol: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
            } catch (Exception e) {
                System.out.println("Error al cerrar recursos: " + e);
            }
        }
        return esAdmin;
    }
}
