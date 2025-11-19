package Modelo;

import Controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author LABCISCO-PC007
 */
public class ModeloProducto extends Conexion{
    
    public ModeloProducto() throws SQLException{
        super();
    }
//    
//    public ArrayList<Videojuego> getAllProductos() throws SQLException{
//        ArrayList<Videojuego> productos = new ArrayList<>();
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try{
//            String sql = "call selectProductos()";
//            pst = getConexion().prepareCall(sql);
//            rs = pst.executeQuery();
//            while(rs.next()){
//                productos.add(new Videojuego(rs.getInt("id_producto"), rs.getString("nombre"),
//                rs.getString("img_producto"), rs.getDouble("precio"), rs.getInt("stock")));
//            }
//        } catch(SQLException e){
//            
//        } finally{
//            try{
//                if(rs != null){
//                    rs.close();
//                }
//                if(pst != null){
//                    pst.close();
//                }
////                if(getConexion() != null){
////                    getConexion().close();
////                }
//            }   catch(Exception e){
//                System.err.println("Error en la consulta SQL:" + e.getMessage());
//                e.printStackTrace();
//            }
//            
//        }
//        return productos;
//    }
//    
//    public Videojuego getProducto(int id){
//        Videojuego producto = null;
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try{
//            String sql = "call selectProducto(?)";
//            pst = getConexion().prepareCall(sql);
//            pst.setInt(1, id);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                producto = new Videojuego(rs.getInt("id_producto"), rs.getString("nombre"),
//                rs.getString("img_producto"), rs.getDouble("precio"), rs.getInt("stock"));
//            }
//        }catch (Exception e){
//            
//        } finally{
//            try{
//                if(rs != null){
//                    rs.close();
//                }
//                if(pst != null){
//                    pst.close();
//                }
////                if(getConexion() != null){
////                    getConexion().close();
////                }
//            }   catch(Exception e){
//                System.err.println("Error en la consulta SQL:" + e.getMessage());
//                e.printStackTrace();
//            }
//            
//        }
//        return producto;
//    }
    
}
