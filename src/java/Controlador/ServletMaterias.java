/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Consultas;
import Modelo.Materia;
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
@WebServlet(name = "ServletMaterias", urlPatterns = {"/ServletMaterias"})
public class ServletMaterias extends HttpServlet {

    Consultas in=new Consultas();
    Materia p=new Materia();
    Consultas dao=new Consultas();
    String listar = "Admin.jsp";
    
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
         String acceso = "";
         
      if (accion.equalsIgnoreCase("doPost")) {
            doPost(request, response);
        }else {
            if (accion.equalsIgnoreCase("eliminar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                p.setId(id);
                dao.eliminarMateria(id);
                acceso = listar;
                RequestDispatcher vista = request.getRequestDispatcher(acceso);
                vista.forward(request, response);
            } else {
                if (accion.equalsIgnoreCase("editar")) {
                    
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nombre = request.getParameter("nombre");
                    int creditos = Integer.parseInt(request.getParameter("creditos"));
                    String carrera = request.getParameter("carrera");
                    String dato = request.getParameter("descripcion");
                    int semestre = Integer.parseInt(request.getParameter("semestre"));
                    

                    Materia m = new Materia();

                    m.setId(id);
                    m.setNombre(nombre);
                    m.setCreditos(creditos);
                    m.setCarrera(carrera);
                    m.setDescripcion(request.getParameter("descripcion"));
                    m.setSemestre(semestre);

                    String mensaje = in.editarMateria(m);

                    request.setAttribute("id", id);
                    request.setAttribute("nombre", nombre);
                    request.setAttribute("creditos", creditos);
                    request.setAttribute("carrera", carrera);
                    request.setAttribute("descripcion", dato);
                    request.setAttribute("semestre", semestre);
                    
                    System.out.println("mensaje: " + mensaje);

                    request.getRequestDispatcher("Admin.jsp").forward(request, response);

                }else{
                
                    if (accion.equalsIgnoreCase("listar")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nombre = request.getParameter("nombre");
                    int creditos = Integer.parseInt(request.getParameter("creditos"));
                    String carrera = request.getParameter("carrera");
                    String dato = request.getParameter("descripcion");
                    int semestre = Integer.parseInt(request.getParameter("semestre"));
                    

                    request.setAttribute("id", id);
                    request.setAttribute("nombre", nombre);
                    request.setAttribute("creditos", creditos);
                    request.setAttribute("carrera", carrera);
                    request.setAttribute("descripcion", dato);
                    request.setAttribute("semestre", semestre);
                    

                    request.getRequestDispatcher("Estudiante.jsp").forward(request, response);
                    }
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
        System.out.println("entro al servlet");
        try{
            String nombre = request.getParameter("nombre");
            int Creditos = Integer.parseInt(request.getParameter("creditos"));
            String carrera = request.getParameter("carrera");
            String descripcion = request.getParameter("descripcion");
            int semestre = Integer.parseInt(request.getParameter("semestre"));

            Materia benef = new Materia();

            benef.setNombre(nombre);
            benef.setCreditos(Creditos);
            benef.setCarrera(carrera);
            benef.setDescripcion(descripcion);
            benef.setSemestre(semestre);

            String mensaje = in.agregarMateria(benef);

            if (mensaje.equals("Agregado")) {
                request.setAttribute("mensaje", mensaje);
            } else {
                request.setAttribute("error", mensaje);
            }

            request.getRequestDispatcher("Admin.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("Admin.jsp").forward(request, response);
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
