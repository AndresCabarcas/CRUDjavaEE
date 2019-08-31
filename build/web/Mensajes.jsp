<%-- 
    Document   : Mensajes
    Created on : 14/06/2019, 12:24:35 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="layouts/head.html"/>
    <body>
        <jsp:useBean class="Modelo.Consultas" id="gruposDao"></jsp:useBean>
        <jsp:include page="layouts/header.html"/>
        <jsp:include page="layouts/menu.html"/>
        <%
            HttpSession sesion = request.getSession();
            String Usuario = String.valueOf(sesion.getAttribute("user"));
            String Contraseña = String.valueOf(sesion.getAttribute("contra"));
            if (gruposDao.Login(Usuario, Contraseña)) {
                System.out.println("good");
                System.out.println("u: " + Usuario);
                System.out.println("c: " + Contraseña);
            } else {
                out.print("<script>location.replace('login.jsp');</script>");
            }
        %>
        <div class="breadcomb-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcomb-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-mail"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h1>Mensajeria</h1>
                                            <p>Bienvenido <span class="bread-ntd"><%out.print(Usuario);%></span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcomb area End-->
        <!-- Data Table area Start-->
        <div class="data-table-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="data-table-list">
                            <div class="table-responsive">
                                <table id="data-table-basic" class="table table-striped">
                                    <thead>
                                        <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Email</th>
                                        <th>Telefono</th>
                                        <th>Mensaje</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${gruposDao.listarContacto()}" var="grupo">
                                            <tr>
                                                 <td>${grupo.id}</td>
                                                    <td>${grupo.nombre}</td>
                                                    <td>${grupo.correo}</td>
                                                    <td>${grupo.telefono}</td>
                                                    <td>${grupo.mensaje}</td>
                                                <td>
                                                    <a href="ServletContacto?accion=responder&correo=${grupo.correo}" class="btn btn-info btn-sm"> <i class="notika-icon notika-mail"></i> </a>
                                                    <a href="ServletContacto?accion=eliminar&id=${grupo.id}" class="btn btn-danger btn-sm"> <i class="notika-icon notika-trash"></i> </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layouts/scripts.html"/>
    </body>
</html>
