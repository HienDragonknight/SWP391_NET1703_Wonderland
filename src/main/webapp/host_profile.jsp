<%-- 
    Document   : host_profile
    Created on : Feb 2, 2024, 7:14:16 AM
    Author     : phanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Host's Profile Page</title>
    </head>
    <body>
        <h1>Host's Profile</h1>
        <form action="EditHostProfileServlet" method="POST">
            Full Name <input type="text" name="fullname" required><br>
            Phone Number <input type="text" name="phone" required><br>
            Avatar <input type="text" name="avatar" required><br>
            <input type="submit" name="edit" value="edit">
        </form>
    </body>
</html>
