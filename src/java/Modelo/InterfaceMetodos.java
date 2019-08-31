/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.List;

/**
 *
 * @author User
 */
public interface InterfaceMetodos {
    public boolean Login(String Usuario, String Contraseña);
    public boolean LoginEstudiantes(String Usuario, String Contraseña);
    public List<Materia> ListarMaterias();
    public String agregarMateria(Materia materia);
    public boolean eliminarMateria(int id);
    public String editarMateria(Materia materia);
    public List<Contacto> listarContacto();
    public String agregarContacto(Contacto contacto);
    public boolean elimiinarContacto(int id);
    public String ContarMensajes();
}
