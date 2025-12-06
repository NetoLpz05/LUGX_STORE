/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Modelo.Videojuego;
import Modelo.VideojuegoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class Buscador extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String busqueda = request.getParameter("q");
        
        if (busqueda != null && busqueda.length() > 0) {
            VideojuegoDAO dao = new VideojuegoDAO();
            List<Videojuego> lista = dao.buscarPorNombre(busqueda);
            
            if (!lista.isEmpty()) {
                out.println("<ul class='search-results-list'>");
                for (Videojuego v : lista) {
                    out.println("<li>");
                    // Link: Puedes cambiar 'shop.jsp' por tu página de detalles
                    out.println("<a href='detalles.jsp?id=" + v.getIdJuego() + "'>");
                    out.println("<img src='" + v.getImagen() + "' alt='img'>");
                    out.println("<div class='info'>");
                    out.println("<span class='name'>" + v.getNombre() + "</span>");
                    out.println("<span class='price'>$" + v.getPrecio() + "</span>");
                    out.println("</div>");
                    out.println("</a>");
                    out.println("</li>");
                }
                out.println("</ul>");
            } else {
                out.println("<div class='no-results'>No se encontraron juegos.</div>");
            }
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

}
