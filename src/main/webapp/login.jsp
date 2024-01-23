<%-- 
    Document   : login
    Created on : Jan 20, 2024, 8:55:25 PM
    Author     : 84335
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginServlet" method="POST">
            <h3>${sessionScope.ERROR}</h3>
            Email <input type="text" name="txtEmail" value="" /><br/>
            Password <input type="password" name="txtPassword" value="" /><br/>
            <input type="submit" value="Login" name="action" /> 
        </form>
    </body>
</html>