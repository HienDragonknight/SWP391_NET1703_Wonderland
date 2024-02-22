<%-- 
    Document   : register
    Created on : Jan 28, 2024, 1:24:41 PM
    Author     : 84335
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <form action="RegisterServlet" method="POST">
            FullName<input type="text" name="txtName" value="" /><br/>
            Email <input type="text" name="txtEmail" value="" /><br/>
            Password <input type="password" name="txtPassword" value="" /><br/>
            Confirm Password <input type="password" name="txtCfPassword" value="" /><br/>
            Phone <input type="text" name="txtPhone" value="" /><br/>
            <input type="submit" value="Sign Up" name="action" />
        </form>
    </body>
</html>
