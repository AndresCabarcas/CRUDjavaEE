<%-- 
    Document   : Estudiante
    Created on : 12/06/2019, 07:29:53 PM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="layouts/head.html"/>
    </head>
    <body class="">
        <jsp:useBean class="Modelo.Consultas" id="gruposDao"></jsp:useBean>
        <jsp:include page="layouts/header.jsp"/>
        <link href="modal.css" rel="stylesheet" type="text/css"/>
        <link href="modaldos.css" rel="stylesheet" type="text/css"/>
        <%
            HttpSession sesion = request.getSession();
            String Usuario = String.valueOf(sesion.getAttribute("user"));
            String Contraseña = String.valueOf(sesion.getAttribute("contra"));
            if (gruposDao.LoginEstudiantes(Usuario, Contraseña)) {
                System.out.println("good");
                System.out.println("u: " + Usuario);
                System.out.println("c: " + Contraseña);
            } else {
                out.print("<script>location.replace('index.jsp');</script>");
            }
        %>
        <!-- Breadcomb area Start-->
        <div class="breadcomb-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcomb-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-app"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h1>Materias</h1>
                                            <p>Bienvenido <span class="bread-ntd"><%out.print(Usuario);%></span></p>
                                            <a href="" data-toggle="modal" data-target="#darkModalForm" class="btn btn-sm btn-sm">Contactar al Admin<i class="notika-icon notika-mail"></i> </a>
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
                                            <th>Creditos</th>
                                            <th>Carrera</th>
                                            <th>Descripcion</th>
                                            <th>Semestre</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <c:forEach items="${gruposDao.ListarMaterias()}" var="grupo">
                                                <td>${grupo.id} </td>
                                                <td>${grupo.nombre} </td>
                                                <td>${grupo.creditos} </td>
                                                <td>${grupo.carrera}</td>
                                                <td>${grupo.descripcion}</td>
                                                <td>${grupo.semestre}</td>
                                                <td>
                                                    <a href="ServletMaterias?accion=listar&id=${grupo.id}&nombre=${grupo.nombre}&creditos=${grupo.creditos}&carrera=${grupo.carrera}&semestre=${grupo.semestre}&descripcion=${grupo.descripcion}&#popup" class="btn btn-info btn-sm"> <i class="notika-icon notika-edit"></i> </a>
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
        <!--Modal-->
        <div class="modal-wrapper" id="popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog form-dark" role="document">
                <!--Content-->
                <div class="modal-content card card-image">
                    <div class="text-white rgba-stylish-strong py-5 px-5 z-depth-4">

                        <div class="modal-body">
                            <h3>InfoMateria</h3>
                            <form action="ServletMaterias" method="editar">
                                <input type="hidden" name="accion" value="editar">
                                <td><input hidden="true" type="text" name="id" value="${id}"></td>

                                <label>Nombre</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="nombre" value="${nombre}">
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                                <label>Creditos</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="creditos" value="${creditos}">
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                                <label>Carrera</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="carrera" value="${carrera}">
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                                <label>Semestre</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="semestre" value="${semestre}">
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                                <label>Descripcion</label>
                                <div class="md-form pb-3">
                                    <textarea name="descripcion" rows="8" cols="20" class="form-control validate white-text">${descripcion}</textarea>
                                    <!--<label data-error="wrong" data-success="right" for="Form-pass5">Descripcion</label>-->
                                </div>
                                <br>
                            </form>
                            <a class="popup-cerrar" href="#">X</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

            </div>
        </div>
                                    
        <!-- Modal -->
        
        
        <!--Modal Agg-->
        <!-- Modal -->
        <div class="modal fade" id="darkModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog form-dark" role="document">
                <!--Content-->
                <div class="modal-content card card-image">
                    <div class="text-white rgba-stylish-strong py-5 px-5 z-depth-4">
                        <!--Header-->
                        <div class="modal-header text-center pb-4">
                            <h3 class="modal-title w-100 white-text font-weight-bold" id="myModalLabel"><strong>Enviar</strong> <a
                                    class="green-text font-weight-bold"><strong>PQRS</strong></a></h3>
                            <button type="button" class="close white-text" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <!--Body-->
                        <div class="modal-body">
                            <form action="ServletContacto" method="POST">
                                <input type="hidden" name="accion" value="doPost">
                                
                                <!--Body-->
                                <label>Nombre</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="name" >
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                                <label>Correo</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="email" >
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                                <label>telefono</label>
                                <div class="md-form mb-5">
                                    <input type="text" id="Form-email5" class="form-control validate white-text" name="phone" >
                                    <!-- <label data-error="wrong" data-success="right" for="Form-email5">Nombre</label>-->
                                </div>
                    
                                <label>Mensaje</label>
                                <div class="md-form pb-3">
                                    <textarea name="message" rows="8" cols="20" class="form-control validate white-text"></textarea>
                                    <!-- <label data-error="wrong" data-success="right" for="Form-pass5">Descripcion</label>-->
                                </div>

                                <hr>
                                <!--Grid row-->
                                <div class="row d-flex align-items-center mb-4">

                                    <!--Grid column-->
                                    <div class="text-center mb-3 col-md-12">
                                        <button type="submit" class="btn btn-success btn-block btn-rounded z-depth-1">Enviar</button>
                                    </div>

                                    <!--Grid column-->

                                </div>
                            </form>
                            <!--Grid row-->

                            <!--Grid row-->
                            <div class="row">

                            </div>
                            <!--Grid row-->

                        </div>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <!-- Modal -->
        <jsp:include page="layouts/scripts.html"/>
    </body>
</html>
