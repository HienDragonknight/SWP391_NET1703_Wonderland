<%-- 
    Document   : profile
    Created on : Feb 5, 2024, 10:30:35 AM
    Author     : Le Huu Huy
--%>

<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
                height: 500px;
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
        <div class="container">
            <header>Profile</header>
            <form action="AdminServlet" method="POST" enctype="multipart/form-data">
                <input type="text" name="txtName" value="${sessionScope.USER_INFO.fullName}" placeholder="Full Name"/>
                <input type="email" name="txtEmail" value="${sessionScope.USER_INFO.email}" placeholder="Email"/>
                <input type="password" name="txtPassword" value="${sessionScope.USER_INFO.password}" placeholder="Password"/>
                <input type="text" name="txtPhone" value="${sessionScope.USER_INFO.phoneNumber}" placeholder="Phone"/>
                <input type="file" name="txtImage"/>
                <input type="hidden" name="txtCEmail" value="${sessionScope.USER_INFO.email}" />
                <input type="submit" value="Update Account" name="action" class="btn"/>
            </form>
        </div>
    </body>
</html>
