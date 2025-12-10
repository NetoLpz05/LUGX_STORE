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

    VideojuegoDAO dao = new VideojuegoDAO();

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

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "añadirCarrito"; // por defecto, tablero admin
        }

        try {
            switch (accion) {
                case "comprarJuego":
                    comprarJuegos(request, response);
                    break;
                case "añadirCarrito":
                default:
                    meterCarrito(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException("Error en la operación CRUD del JuegoServlet: " + ex.getMessage(), ex);
        }
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

    protected void meterCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int idproducto = Integer.parseInt(request.getParameter("id"));

        Videojuego juego = dao.obtenerPorId(idproducto);

        if (juego != null) {
            HttpSession sesion = request.getSession(true);

            @SuppressWarnings("unchecked")
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

            // Guardar carrito actualizado en sesión
            sesion.setAttribute("carrito", carrito);
        }

        response.sendRedirect("cart.jsp");
    }

    protected void comprarJuegos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);

        if (sesion == null) {
            // No hay sesión, regresamos al carrito o a la tienda
            response.sendRedirect("cart.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        ArrayList<Articulo> carrito = (ArrayList<Articulo>) sesion.getAttribute("carrito");

        if (carrito == null || carrito.isEmpty()) {
            // No hay artículos en el carrito
            response.sendRedirect("cart.jsp");
            return;
        }

        // Recorrer cada artículo y actualizar stock
        for (Articulo articulo : carrito) {
            int idJuego = articulo.getVideojuego().getIdJuego();
            int cantidadComprada = articulo.getCantidad();

            // Este método debe descontar stock en BD
            dao.actualizarStock(idJuego, cantidadComprada);
        }

        // Vaciar carrito en la sesión
        sesion.removeAttribute("carrito");
        // O: sesion.setAttribute("carrito", new ArrayList<Articulo>());

        // Redirigir a página de compra exitosa
        response.sendRedirect("compra_exito.jsp");
    }

}
