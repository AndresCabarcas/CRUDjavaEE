/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Consultas;
import Modelo.Contacto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "ServletContacto", urlPatterns = {"/ServletContacto"})
public class ServletContacto extends HttpServlet {
    Contacto p = new Contacto();
    int id;
    Consultas dao=new Consultas();
    Consultas in=new Consultas();
    String listar = "Mensajes.jsp";

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
        String acceso="";
      
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("doPost")) {
            doPost(request, response);
        }else {
            if (accion.equalsIgnoreCase("eliminar")) {
                id = Integer.parseInt(request.getParameter("id"));
                p.setId(id);
                dao.elimiinarContacto(id);
                acceso = listar;
                RequestDispatcher vista = request.getRequestDispatcher(acceso);
                vista.forward(request, response);
            }else {
                if (accion.equalsIgnoreCase("responder")) {

                    String correo = request.getParameter("correo");

                    Contacto grupo = new Contacto();

                    grupo.setCorreo(correo);
                    String contador = in.ContarMensajes();

                    request.setAttribute("correo", correo);
                    request.getRequestDispatcher("EnviarMensajes.jsp").forward(request, response);

                }

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
         try {
            String nombre = request.getParameter("name");
            String correo = request.getParameter("email");
            String telefono = request.getParameter("phone");
            String Mensaje = request.getParameter("message");

            Contacto benef = new Contacto();

            benef.setNombre(nombre);
            benef.setCorreo(correo);
            benef.setTelefono(telefono);
            benef.setMensaje(Mensaje);
            
            String mensaje = in.agregarContacto(benef);
            
            if(mensaje.equals("Agregado")){
                request.setAttribute("mensaje", mensaje);
            }else{
                request.setAttribute("error", mensaje);
            }
            
            request.getRequestDispatcher("Estudiante.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("Estudiante.jsp").forward(request, response);
        }
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
