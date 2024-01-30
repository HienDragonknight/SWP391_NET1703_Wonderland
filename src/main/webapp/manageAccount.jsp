<%-- 
    Document   : manageAccount
    Created on : Jan 30, 2024, 7:43:06 AM
    Author     : Le Huu Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account</title>
    </head>
    <body>
        <form action="AdminServlet" method="POST">
            Full name: <input type="text" name="txtName" value="" /><br/>
            Email: <input type="email" name="txtEmail" value="" /><br/>
            Password: <input type="password" name="txtPassword" value="" /><br/>
            Confirm Password: <input type="password" name="txtRePassword" value="" /><br/>
            Phone: <input type="text" name="txtPhone" value="" /><br/>
            <input type="submit" value="Create" name="action" />
        </form>
    </body>
</html>
