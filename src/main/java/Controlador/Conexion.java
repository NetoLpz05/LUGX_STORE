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
    private String PASSWORD = "WidenfsmostWanted12";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "lugx";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
    private Connection con;

    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error en; " + e);
        } catch (SQLException e) {
            System.err.println("Error en; " + e);
        }
    }

    public Connection getConexion() throws SQLException {
        Connection con = null;
        try {
            // La conexión se establece DENTRO de este método
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            // 🚨 Crucial: Desactivamos auto-commit, forzando a que el DAO use con.commit()
            // Si el DAO no hace commit, los datos no se guardan.
            con.setAutoCommit(false); 
            
        } catch (SQLException e) {
            System.err.println("ERROR SQL: Falló la conexión a la base de datos.");
            System.err.println("URL: " + URL + ", User: " + USERNAME);
            e.printStackTrace();
            // Re-lanzamos la excepción para que el DAO la capture y maneje el error.
            throw e; 
        }
        return con;
    }
}
