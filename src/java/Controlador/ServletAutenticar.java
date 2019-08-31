/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Conexion;
import Modelo.Consultas;
import Modelo.Usuario;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "ServletAutenticar", urlPatterns = {"/ServletAutenticar"})
public class ServletAutenticar extends HttpServlet {

    Consultas in = new Consultas();
    Connection cn = Conexion.getConexion();

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
        Usuario obj = new Usuario();

        HttpSession sesion = request.getSession();

        String Usuario = request.getParameter("login");
        String Contraseña = request.getParameter("password");

        sesion.setAttribute("user", Usuario);
        sesion.setAttribute("contra", Contraseña);

        obj.setUsuario(Usuario);
        obj.setContraseña(Contraseña);

        if (in.Login(obj.getUsuario(), obj.getContraseña())) {
            request.getRequestDispatcher("Admin.jsp").forward(request, response);
        } else {
            boolean respuesta =in.LoginEstudiantes(obj.getUsuario(), obj.getContraseña()) ;
            System.out.println("Entre"+respuesta);
            if (in.LoginEstudiantes(obj.getUsuario(), obj.getContraseña())) {
                request.getRequestDispatcher("Estudiante.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
