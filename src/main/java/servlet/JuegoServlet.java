/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Modelo.Videojuego;
import Modelo.VideojuegoDAO;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author Usuario
 */
public class JuegoServlet extends HttpServlet {

    private VideojuegoDAO videojuegoDAO;
    private UsuarioDAO usuarioDAO;

    // Inicializamos el DAO en el método init()
    @Override
    public void init() throws ServletException {
        super.init();
        videojuegoDAO = new VideojuegoDAO();
        usuarioDAO = new UsuarioDAO();
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

        // 1. Leer la acción primero
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar"; // por defecto, tablero admin
        }

        // 2. Acciones PÚBLICAS (no requieren admin)
        if ("juegosTienda".equals(accion)) {
            // Aquí solo mostramos la tienda para el cliente
            listarTienda(request, response);
            return; // Muy importante: salir del método
        }

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("esAdmin") == null || !(boolean) sesion.getAttribute("esAdmin")) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
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
                case "guardar":
                    guardarOActualizarJuego(request, response);
                    break;
                case "buscar":
                    buscarJuegoPorId(request, response);
                    break;
                case "buscarUsuario":
                    buscarUsuarioPorId(request, response);
                    break;
                case "eliminarUsuario":
                    eliminarUsuario(request, response);
                    break;
                case "listar":
                default:
                    cargarTableroCompleto(request, response);
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

    // 1. LISTAR (READ)
    private void cargarTableroCompleto(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        List<Videojuego> listaJuegos = videojuegoDAO.listarTodos();
        List<Usuario> listaUsuarios = usuarioDAO.listarUsuarios();

        request.setAttribute("listaJuegos", listaJuegos);
        request.setAttribute("listaUsuarios", listaUsuarios);

        RequestDispatcher dispatcher = request.getRequestDispatcher("tableroAdmin.jsp");
        dispatcher.forward(request, response);
    }

    // 2. MOSTRAR FORMULARIO
    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("formularioJuego.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Videojuego juegoExistente = videojuegoDAO.obtenerPorId(id);

        request.setAttribute("juego", juegoExistente);

        RequestDispatcher dispatcher = request.getRequestDispatcher("formularioJuego.jsp");
        dispatcher.forward(request, response);
    }

    private void buscarUsuarioPorId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        System.out.println("--------------------------------------------------");
        System.out.println("INICIO BÚSQUEDA USUARIO");
        System.out.println("ID recibido del formulario: " + idStr);

        List<Usuario> listaUsuarios = new ArrayList<>();

        try {
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);

                Usuario u = usuarioDAO.obtenerPorId(id);

                if (u != null) {
                    System.out.println("¡ÉXITO! Usuario encontrado en BD: " + u.getNombre());
                    listaUsuarios.add(u);
                } else {
                    System.out.println("FALLO: El DAO devolvió NULL. No existe usuario con ID=" + id + " en la tabla 'usuario'.");
                }
            }
        } catch (Exception e) {
            System.out.println("[DEBUG] ERROR BUSCANDO USUARIO: " + e.getMessage());
            e.printStackTrace();
        }

        // Para mantener la tabla de videojuegos visible
        request.setAttribute("listaJuegos", videojuegoDAO.listarTodos());

        request.setAttribute("listaUsuarios", listaUsuarios);

        System.out.println("Enviando " + listaUsuarios.size() + " usuarios al JSP.");
        System.out.println("--------------------------------------------------");

        request.getRequestDispatcher("tableroAdmin.jsp").forward(request, response);
    }

    private void buscarJuegoPorId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        System.out.println("--------------------------------------------------");
        System.out.println("INICIO BÚSQUEDA VIDEOJUEGO");
        System.out.println("ID recibido del formulario: " + idStr);

        List<Videojuego> listaJuegos = new ArrayList<>();

        try {
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);

                // Llamamos al DAO
                Videojuego juego = videojuegoDAO.obtenerPorId(id);

                if (juego != null) {
                    System.out.println("¡ÉXITO! Juego encontrado en BD: " + juego.getNombre());
                    listaJuegos.add(juego);
                } else {
                    System.out.println("FALLO: El DAO devolvió NULL. No existe juego con ID=" + id + " en la tabla 'videojuego'.");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("ERROR: El ID '" + idStr + "' no es un número válido.");
        } catch (Exception e) {
            System.out.println("ERROR CRÍTICO EN SERVLET: " + e.getMessage());
            e.printStackTrace();
        }

        // Para mantener la tabla de usuarios visible
        request.setAttribute("listaUsuarios", usuarioDAO.listarUsuarios());

        // Enviamos la lista (que puede estar vacía o tener 1 juego)
        request.setAttribute("listaJuegos", listaJuegos);

        System.out.println("Enviando " + listaJuegos.size() + " juegos al JSP.");
        System.out.println("--------------------------------------------------");

        request.getRequestDispatcher("tableroAdmin.jsp").forward(request, response);
    }

    // 3. GUARDAR/ACTUALIZAR
    private void guardarOActualizarJuego(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Videojuego juego = extraerDatosFormulario(request);

        String idStr = request.getParameter("idJuego");

        if (idStr != null && !idStr.isEmpty()) {
            int idJuego = Integer.parseInt(idStr);
            juego.setIdJuego(idJuego);
            videojuegoDAO.actualizar(juego);
        } else {
            videojuegoDAO.insertar(juego);
        }

        response.sendRedirect("JuegoServlet");
    }

    // 4. ELIMINAR (DELETE)
    private void eliminarJuego(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        videojuegoDAO.eliminar(id);

        // Redirige al listado
        response.sendRedirect("JuegoServlet");
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        usuarioDAO.eliminarUsuario(id);

        response.sendRedirect("JuegoServlet");
    }

    // AUXILIAR: Extraer datos del formulario
    private Videojuego extraerDatosFormulario(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (Exception e) {
        }

        String nombre = request.getParameter("nombre");
        String genero = request.getParameter("genero");
        String plataforma = request.getParameter("plataforma");

        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        String imagen = request.getParameter("imagen");
        String descripcion = request.getParameter("descripcion");
        String imagenDetalles = request.getParameter("imagenDetalles");

        return new Videojuego(0, nombre, genero, precio, stock, descripcion, imagen, imagenDetalles, plataforma);
    }

    private void listarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Videojuego> listaVideojuegos = videojuegoDAO.listarDisponibles();

        request.setAttribute("listaVideojuegos", listaVideojuegos);

        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}
