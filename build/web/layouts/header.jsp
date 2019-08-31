<%-- 
    Document   : header
    Created on : 21/04/2019, 03:16:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean class="Modelo.Consultas" id="gruposDao"></jsp:useBean>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header-top-area">
      <div class="container">
          <div class="row">
              <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <div class="logo-area">
                      <a href="index.jsp"><img style="width: 52px; " src="" alt="" /><span>InfoMaterias</span></a>
                  </div>
              </div>

              <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                  <div class="header-top-menu">
                      <ul class="nav navbar-nav notika-top-nav">
                   <li class="nav-item nc-al">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                            <span><i class="notika-icon notika-close"></i></span>

                              <div role="menu" class="dropdown-menu message-dd notification-dd animated zoomIn">
                                  <div class="hd-mg-tt">
                                      <h2>InfoMaterias</h2>
                                  </div>
          
                                  <div class="hd-mg-va">
                                      <a href="LogOut.jsp">Cerrar Sesion</a>
                                  </div>
                              </div>
                          </li>
                          <li>
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                              <div class="spinner4 spinner-4"></div>
                              <div class="ntd-ctn"><span>salir</span></div>
                            </a>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
</div>

