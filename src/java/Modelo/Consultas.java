/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Consultas implements InterfaceMetodos{
    
    Connection cn = Conexion.getConexion();
    String Usuario;
    String Contra;

    @Override
    public boolean Login(String Usuario, String Contraseña) {
        boolean validar = true;
        try {
            String sql = "SELECT * FROM usuario";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {

                String Correo = rs.getString(4);
                String Pas = rs.getString(5);
                String rol = rs.getString(6);

                if (Usuario.equals(Correo) && Contraseña.equals(Pas) && rol.equals("Admin")) {
                    validar = true;
                } else {
                    validar = false;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex);
        }
        return validar;
    }

    @Override
    public boolean LoginEstudiantes(String Usuario, String Contraseña) {
                boolean validar = true;
        try {
            String sql = "SELECT * FROM usuario";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {

                String Correo = rs.getString(4);
                String Pas = rs.getString(5);
                String rol = rs.getString(6);

                if (Usuario.equals(Correo) && Contraseña.equals(Pas) && rol.equals("Estudiante")) {
                    validar = false;
                } else {
                    validar = true;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex);
        }
        return validar;
    }

    @Override
    public List<Materia> ListarMaterias() {
        List<Materia> lstAlumnos = new ArrayList<Materia>();
        try {
            String sql = "SELECT * FROM materias";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                int creditos = rs.getInt(3);
                String carrera = rs.getString(4);
                String descripcion = rs.getString(5);
                int semestre = rs.getInt(6);

                Materia alumno = new Materia(id, nombre, creditos, carrera, descripcion, semestre);

                lstAlumnos.add(alumno);
            }

        } catch (Exception e) {
            System.out.println("error de conexion");
        }
        return lstAlumnos;
    }

    @Override
    public String agregarMateria(Materia materia) {
       String mensaje = "";
        try {
            String sql = "INSERT INTO materias VALUES(?,?,?,?,?,?)";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setInt(1, materia.getId());
            pstm.setString(2, materia.getNombre());
            pstm.setInt(3, materia.getCreditos());
            pstm.setString(4, materia.getCarrera());
            pstm.setString(5, materia.getDescripcion());
            pstm.setInt(6, materia.getSemestre());
            pstm.executeUpdate();

            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
        }
        return mensaje;
    }


    @Override
    public boolean eliminarMateria(int id) {
         String sql = "delete from materias where idMaterias=" + id;
        try {
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return false;
    }

    @Override
    public String editarMateria(Materia materia) {
        String mensaje = "";
         String sql = "update materias set Nombre='"+materia.getNombre()+"',Creditos='"+materia.getCreditos()+"',Carrera='"+materia.getCarrera()+"',Descripcion='"+materia.getDescripcion()+"',Semestre='"+materia.getSemestre()+"'where idMaterias=" + materia.getId();
        try {

            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();

        } catch (Exception e) {
            mensaje = e.toString();
        }
        return mensaje;
    }

    @Override
    public List<Contacto> listarContacto() {
                List<Contacto> lstAlumnos = new ArrayList<Contacto>();
        try {
            String sql = "SELECT * FROM contacto";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String Nombre = rs.getString(2);
                String Correo = rs.getString(3);
                String Telefono = rs.getString(4);
                String Mensaje = rs.getString(5);

                Contacto alumno = new Contacto(id, Nombre, Correo, Telefono, Mensaje);

                lstAlumnos.add(alumno);
            }

        } catch (Exception e) {
            System.out.println("error de conexion"+e);
        }
        return lstAlumnos;
    }

    @Override
    public String agregarContacto(Contacto contacto) {
        String mensaje = "";
        try {
            String sql = "INSERT INTO contacto VALUES(?,?,?,?,?)";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setInt(1, contacto.getId());
            pstm.setString(2, contacto.getNombre());
            pstm.setString(3, contacto.getCorreo());
            pstm.setString(4, contacto.getTelefono());
            pstm.setString(5, contacto.getMensaje());
            pstm.executeUpdate();

            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
        }
        return mensaje;
    }

    @Override
    public boolean elimiinarContacto(int id) {
       String sql = "delete from contacto where Id=" + id;
        try {
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return false;
    }

    @Override
    public String ContarMensajes() {
        String respuesta="";
        String consulta = "SELECT count(*) FROM contacto";
       try {
            PreparedStatement pstm = cn.prepareStatement(consulta);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
            respuesta = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return respuesta;
    }
    
}
