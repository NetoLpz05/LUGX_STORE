/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Modelo.Videojuego; 
import Modelo.VideojuegoDAO;

import java.util.List;

/**
 *
 * @author Usuario
 */
public class JuegoServlet extends HttpServlet {

    private VideojuegoDAO videojuegoDAO; 

    // Inicializamos el DAO en el método init()
    @Override
    public void init() throws ServletException {
        super.init();
        videojuegoDAO = new VideojuegoDAO(); 
    }
    
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
        
        // 1. 🛡️ VERIFICACIÓN DE SEGURIDAD
        HttpSession sesion = request.getSession(false);
        // Si no hay sesión, no es admin, o el atributo no está seteado: redirige.
        if (sesion == null || sesion.getAttribute("esAdmin") == null || !(boolean)sesion.getAttribute("esAdmin")) {
            // Redirigir al login o a la página de acceso denegado
            response.sendRedirect(request.getContextPath() + "/index.jsp"); 
            return;
        }
        
        // 2. 🚦 OBTENER ACCIÓN
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar"; // Acción por defecto
        }

        try {
            switch (accion) {
                case "nuevo":
                    mostrarFormulario(request, response);
                    break;
                case "eliminar":
                    eliminarJuego(request, response);
                    break;
                case "editar":
                    mostrarFormularioEditar(request, response);
                    break;
                case "guardar": // Maneja tanto INSERT como UPDATE
                    guardarOActualizarJuego(request, response); 
                    break;
                case "listar": // Caso por defecto
                default: 
                    listarJuegos(request, response);
                    break;
            }
        } catch (Exception ex) {
            // Captura errores del DAO o del procesamiento
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

    // --------------------------------------------------------------------------------
    // 1. LISTAR (READ)
    // --------------------------------------------------------------------------------
    private void listarJuegos(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        
        List<Videojuego> listaJuegos = videojuegoDAO.listarTodos();
        
        request.setAttribute("listaJuegos", listaJuegos);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("tableroAdmin.jsp");
        dispatcher.forward(request, response);
    }

    // --------------------------------------------------------------------------------
    // 2. MOSTRAR FORMULARIO (CREATE & UPDATE SETUP)
    // --------------------------------------------------------------------------------
    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirige al formulario vacío para AÑADIR (CREATE)
        RequestDispatcher dispatcher = request.getRequestDispatcher("formularioJuego.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Videojuego juegoExistente = videojuegoDAO.obtenerPorId(id);
        
        // Pasa el objeto para rellenar los campos (modo EDITAR)
        request.setAttribute("juego", juegoExistente); 
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("formularioJuego.jsp");
        dispatcher.forward(request, response);
    }

    // --------------------------------------------------------------------------------
    // 3. GUARDAR/ACTUALIZAR (CREATE & UPDATE EXECUTION)
    // --------------------------------------------------------------------------------
    private void guardarOActualizarJuego(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        Videojuego juego = extraerDatosFormulario(request);

        String idStr = request.getParameter("idJuego");
        
        if (idStr != null && !idStr.isEmpty()) {
            // UPDATE: Actualiza el objeto existente
            int idJuego = Integer.parseInt(idStr);
            juego.setIdJuego(idJuego);
            videojuegoDAO.actualizar(juego);
        } else {
            // INSERT: Inserta un nuevo objeto
            videojuegoDAO.insertar(juego);
        }
        
        // Redirige al listado
        response.sendRedirect("JuegoServlet");
    }

    // --------------------------------------------------------------------------------
    // 4. ELIMINAR (DELETE)
    // --------------------------------------------------------------------------------
    private void eliminarJuego(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        videojuegoDAO.eliminar(id);
        
        // Redirige al listado
        response.sendRedirect("JuegoServlet");
    }

    // --------------------------------------------------------------------------------
    // AUXILIAR: Extraer datos del formulario
    // --------------------------------------------------------------------------------
    private Videojuego extraerDatosFormulario(HttpServletRequest request) {
        try {
            // Asegurar que los caracteres especiales se manejen correctamente
            request.setCharacterEncoding("UTF-8"); 
        } catch (Exception e) {}
        
        String nombre = request.getParameter("nombre");
        String genero = request.getParameter("genero");
        String plataforma = request.getParameter("plataforma");
        
        // Parsear números
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        
        String imagen = request.getParameter("imagen");
        String descripcion = request.getParameter("descripcion");
        
        // Usamos 0 como ID temporal para la inserción
        return new Videojuego(0, nombre, genero, precio, stock, descripcion, imagen, plataforma);
    }
}