/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Controlador.Consultas;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Laboratorios
 */
@WebServlet(name = "InicioSesion", urlPatterns = {"/iniciar"})
public class InicioSesion extends HttpServlet {

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

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("pass");

        Consultas sql = null;

        try {
            sql = new Consultas();

            if (sql.autenticacion(usuario, clave)) {
                
                // 1. Verificar el rol de administrador
                boolean esAdmin = sql.esAdministrador(usuario); 
                
                // 2. Configurar la sesión
                HttpSession objSesion = request.getSession(true);
                
                objSesion.setAttribute("usuarioLogueado", usuario);
                
                if (esAdmin) {
                    objSesion.setAttribute("esAdmin", true);
                    response.sendRedirect("JuegoServlet");
                } else {
                    objSesion.setAttribute("esAdmin", false);
                    response.sendRedirect("inicio.jsp");
                }
                } else {
                    //Autenticación fallida
                    request.setAttribute("mensajeError", "Usuario o contraseña incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

        } catch (SQLException e) {
            System.err.println("Error de SQL al autenticar o verificar rol: " + e);
            request.setAttribute("error", "Error del servidor. Intente más tarde.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } finally {
            if (sql != null) {
                sql.cerrarConexion();
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            processRequest(request, response);
        } catch (ServletException ex) {
            System.getLogger(InicioSesion.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        } catch (IOException ex) {
            System.getLogger(InicioSesion.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
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
