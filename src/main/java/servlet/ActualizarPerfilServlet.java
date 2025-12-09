/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class ActualizarPerfilServlet extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioObj");
        
        if (usuario == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            request.setCharacterEncoding("UTF-8");
            
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String passwordNueva = request.getParameter("password");

            usuario.setNombre(nombre);
            usuario.setCorreo(correo);
            usuario.setTelefono(telefono);
            usuario.setDireccion(direccion);

            if (passwordNueva != null && !passwordNueva.trim().isEmpty()) {
                usuario.setPassword(passwordNueva);
            }

            UsuarioDAO dao = new UsuarioDAO();
            boolean exito = dao.actualizarUsuario(usuario);

            if (exito) {
                session.setAttribute("usuarioObj", usuario);
                session.setAttribute("usuarioLogueado", usuario.getNombre());
                
                response.sendRedirect("Perfil.jsp?status=updated");
            } else {
                response.sendRedirect("MisDatos.jsp?error=db");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("MisDatos.jsp?error=unknown");
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
