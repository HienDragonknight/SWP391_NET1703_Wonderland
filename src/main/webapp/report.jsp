<%-- 
    Document   : report
    Created on : Feb 8, 2024, 10:51:54 AM
    Author     : Le Huu Huy
--%>

<%@page import="models.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<UserDTO> host = (List<UserDTO>) request.getAttribute("SEARCH_RESULT");
            if (host != null) {
                for (UserDTO dto : host) {
                %>
        <div class="container">
            <header>Profile</header>
            <form action="AdminServlet" method="POST">
                <%= dto.getEmail() %>
                <input type="hidden" name="txtEmail" value="<%= dto.getEmail() %>" />
                <input type="text" name="txtReport" value="<%= dto.getReported() %>" />
                <input type="submit" value="Report" name="action"/>
            </form>
        </div>
        <%
            }
            }
        %>
    </body>
</html>
