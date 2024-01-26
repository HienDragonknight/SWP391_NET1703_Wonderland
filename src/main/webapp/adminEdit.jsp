<%-- 
    Document   : adminEdit
    Created on : Jan 25, 2024, 8:30:38 PM
    Author     : Le Huu Huy
--%>

<%@page import="java.util.List"%>
<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<UserDTO> result = (List<UserDTO>) request.getAttribute("USER_PRO");
            if (result != null) {
                for (UserDTO dto : result) {
        %>
            <h2><%= dto.getFullName()%></h2>
        
        <%
                }
            }
        %>
    </body>
</html>
