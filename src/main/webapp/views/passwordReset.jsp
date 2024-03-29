<%@page import="models.PasswordResetError"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Password Reset</title>
    </head>
    <body>
        <%    PasswordResetError errors = (PasswordResetError) request.getAttribute("ERROR");
        %>
        <h2>Password Reset</h2>

        <form action="PasswordResetServlet" method="post">
            <input type="hidden" name="token" value="${token}"> <!-- The token received from the request attribute -->
            <input type="hidden" name="email" value="${email}"> <!-- The token received from the request attribute -->
            <p>Email: ${email}</p>
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <%
                if (errors != null && errors.getNewPasswordError() != null) {
            %>
            <font style="color:red">
            <%= errors.getNewPasswordError()%>
            </font><br>      
            <%
                }
            %>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <%
                if (errors != null && errors.getConfirmPasswordError()!= null) {
            %>
            <font style="color:red">
            <%= errors.getConfirmPasswordError()%>
            </font><br>      
            <%
                }
            %>

            <input type="submit" value="Reset Password">
        </form>

    </body>
</html>
