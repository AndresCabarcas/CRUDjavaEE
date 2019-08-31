<%-- 
    Document   : LogOut
    Created on : 14/06/2019, 09:04:00 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%request.getSession().invalidate();
        out.print("<script>location.replace('index.jsp');</script>");%>
    </body>
</html>
