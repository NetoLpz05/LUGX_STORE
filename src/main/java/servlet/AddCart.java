package servlet;

import Modelo.Articulo;
import Modelo.Videojuego;
import Modelo.VideojuegoDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LABCISCO-PC007
 */
@WebServlet(name = "AddCart", urlPatterns = {"/agregarproducto"})
public class AddCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Recibir ID y Cantidad
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int idproducto = Integer.parseInt(request.getParameter("id"));
        
        // 2. BUSCAR EL JUEGO COMPLETO (Esto es necesario para el nuevo Articulo)
        VideojuegoDAO dao = new VideojuegoDAO();
        Videojuego juego = dao.obtenerPorId(idproducto);
        
        if (juego != null) {
            HttpSession sesion = request.getSession(true);
            ArrayList<Articulo> carrito = (ArrayList<Articulo>) sesion.getAttribute("carrito");
            
            if (carrito == null) {
                carrito = new ArrayList<>();
            }
            
            boolean existe = false;
            for (Articulo a : carrito) {
                if (a.getVideojuego().getIdJuego() == idproducto) {
                    a.setCantidad(a.getCantidad() + cantidad);
                    existe = true;
                    break;
                }
            }
            
            if (!existe) {
                carrito.add(new Articulo(juego, cantidad)); 
            }
            sesion.setAttribute("carrito", carrito);
        }
        response.sendRedirect("cart.jsp");
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
