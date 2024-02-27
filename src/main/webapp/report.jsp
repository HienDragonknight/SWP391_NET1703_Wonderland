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
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            
            body {
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: #f0f0f0;
            }
            
            .container {
                position: relative;
                width: 460px;
                height: 300px;
                border-radius: 12px;
                padding: 20px 30px 120px;
                background: #303f9f;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            
            header {
                font-size: 30px;
                text-align: center;
                color: #fff;
                font-weight: 600;
                cursor: pointer;
            }
            
            .container form {
                display: flex;
                flex-direction: column;
                gap: 20px;
                margin-top: 30px;
            }
            
            form input {
                outline: none;
                border: none;
                padding: 10px 15px;
                font-size: 16px;
                color: #333;
                font-weight: 400;
                border-radius: 8px;
                background: #fff;
            }
            
            .btn {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
            List<UserDTO> host = (List<UserDTO>) request.getAttribute("SEARCH_RESULT");
            if (host != null) {
                for (UserDTO dto : host) {
                %>
        <div class="container">
            <header><%= dto.getFullName() %></header>
            <form action="AdminServlet" method="POST">
                <input type="text" name="txtEmail" value="<%= dto.getEmail() %>" readonly/>
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
