<%-- 
    Document   : EnviarMensajes
    Created on : 14/06/2019, 08:18:25 AM
    Author     : User
--%>

<%@page import="Modelo.Consultas"%>
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
                                            <i class="notika-icon notika-form"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h1>Enviar documento - correo</h2>
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
        <!-- Compose email area Start-->
         
        <div class="inbox-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                        <div class="inbox-left-sd">
                            <div class="compose-ml">
                                <a class="btn" href="sendEmail.jsp">Redactar</a>
                            </div>
                            <%Consultas obj = new Consultas();
                            obj.ContarMensajes();
                            String respuesta = obj.ContarMensajes();%>
                            <div class="inbox-status">
                                <ul class="inbox-st-nav inbox-ft">
                                    <li><a href="Contacto.jsp"><i class="notika-icon notika-mail"></i> Mensajes<span class="pull-right"><% out.println("" + respuesta);%>  </span></a></li>
                                    <li><a href="#"><i class="notika-icon notika-sent"></i> Enviados <span class="pull-right"> {{ numero }} </span></a></li>
                                    <li><a href="#"><i class="notika-icon notika-trash"></i> Eliminados <span class="pull-right"> {{ numero }} </span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                                    
                                   
                    <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                        <div class="view-mail-list sm-res-mg-t-30">
                            <div class="view-mail-hd">
                                <div class="view-mail-hrd">
                                    <h2>Nuevo mensaje</h2>
                                </div>
                            </div>
                           <form action="ServletMensajeria" method="POST">
                                <input type="hidden" name="accion" value="doPost">
                            <div class="cmp-int mg-t-20">
                                <div class="row">
                                    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
                                        <div class="cmp-int-lb cmp-int-lb1 text-right">
                                            <span>De: </span>
                                        </div>
                                    </div>
                                  
                                        <div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
                                            <div class="form-group">
                                                <div class="nk-int-st cmp-int-in cmp-email-over">
                                                    <input type="email" class="form-control" placeholder="infomaterias@gmail.com" disabled>
                                                </div>
                                            </div>
                                        </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
                                        <div class="cmp-int-lb cmp-int-lb1 text-right">
                                            <span>Para: </span>
                                        </div>
                                    </div>
                                    <div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
                                        <div class="form-group">
                                            <div class="nk-int-st cmp-int-in cmp-email-over">
                                                <input type="email" class="form-control" name="para" value="${correo}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
                                        <div class="cmp-int-lb text-right">
                                            <span>Asunto: </span>
                                        </div>
                                    </div>
                                    <div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
                                        <div class="form-group cmp-em-mg">
                                            <div class="nk-int-st cmp-int-in cmp-email-over">
                                                <input type="text" class="form-control" name="Asunto" value="Respuesta Equipo Infomaterias" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="cmp-int-box mg-t-20">
                                <textarea name="mensaje" rows="10" cols="40" class="form-control validate white-text" placeholder="Escriba su mensaje"></textarea>
                            </div>
        
                            <div class="vw-ml-action-ls text-right mg-t-20">
                                <div class="btn-group ib-btn-gp active-hook nk-email-inbox">
                                    <button type="submit" class="btn btn-default btn-sm wditaraves-effect"><i class="notika-icon notika-sent"></i>Enviar</button>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
                                          
       <jsp:include page="layouts/scripts.html"/>
    </body>
</html>
