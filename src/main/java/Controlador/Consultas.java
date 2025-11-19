package Controlador;

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
                // if(getConexion() != null) getConexion().close(); <-- LÍNEA ELIMINADA
            } catch (Exception e) {
                System.out.println("Error al cerrar recursos: " + e);
            }
        }
        return false;
    }

    public boolean registrar(String usuario, String clave, String correo, String tipo) {
        PreparedStatement pst = null;

        try {
            String consulta = "insert into usuario (nombre, correo, password, tipo_usuario) values (?, ?, ?, ?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, correo);
            pst.setString(3, clave);
            pst.setString(4, tipo);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
            try {
                if (pst != null) {
                    pst.close();
                }
                // if(getConexion() != null) getConexion().close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar recursos: " + e);
            }
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
}
