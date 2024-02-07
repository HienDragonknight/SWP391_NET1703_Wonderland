<%-- 
    Document   : customer_profile
    Created on : Feb 2, 2024, 8:44:42 AM
    Author     : phanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <h1>Your Profile</h1>
        <form action="EditHostProfileServlet" method="POST">
            Email <input type="text" name="email" value="${sessionScope.USER_INFO.email}" readonly><br>
            Full Name <input type="text" name="fullname" value="${sessionScope.USER_INFO.fullName}" required><br>
            Phone Number <input type="text" name="phone" value="${sessionScope.USER_INFO.phoneNumber}" required><br>
            Avatar <input type="text" name="avatar" value="${sessionScope.USER_INFO.avatar}" required><br>
            Password <input type="text" name="passwordEdit" value="${sessionScope.USER_INFO.password}" required><br>
            <input type="submit" name="edit" value="edit">
        </form>
    </body>
</html>


