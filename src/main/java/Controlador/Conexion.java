package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ErnestoLpz_252663
 */
public class Conexion {

    private String USERNAME = "root";
    private String PASSWORD = "itson";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "lugx";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
    private Connection con;

    public Conexion() throws SQLException {
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error en; " + e);
        } catch (SQLException e) {
            System.err.println("Error en; " + e);
        }
    }

    public Connection getConexion() {
        return con;
    }
}
