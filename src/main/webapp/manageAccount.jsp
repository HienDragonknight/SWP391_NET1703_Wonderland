<%-- 
    Document   : manageAccount
    Created on : Jan 27, 2024, 12:53:06 PM
    Author     : Le Huu Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Manage Account</h1>
        <form action="ManageAccountServlet" method="POST">
            Email: <input type="email" name="txtEmail" value="" /><br/>
            fullName: <input type="text" name="txtName" value="" /><br/>
            
        </form>
    </body>
</html>
