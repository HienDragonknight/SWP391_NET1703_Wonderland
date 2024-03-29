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

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e8ffff;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            #info {
                max-width: 400px;
                margin: 50px auto;
                background-color: #fff;
                padding: 40px ;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                background-color: #34ebeb;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <!--Use the below code snippet to provide real time updates to the live chat plugin without the need of copying and paste each time to your website when changes are made via PBX-->
    <call-us-selector phonesystem-url="https://1111.3cx.cloud" party="wonderland"></call-us-selector>
    <script defer src="https://downloads-global.3cx.com/downloads/livechatandtalk/v1/callus.js" id="tcx-callus-js" charset="utf-8"></script>
    <h1>Edit Your Info</h1>
    <form action="EditCustomerProfileServlet" method="POST" id="info">
        Email <input type="text" name="email" value="${sessionScope.USER_INFO.email}" readonly><br>
        Full Name <input type="text" name="fullname" value="${sessionScope.USER_INFO.fullName}" required><br>
        Phone Number <input type="text" name="phone" value="${sessionScope.USER_INFO.phoneNumber}" required><br>
        Password <input type="password" name="password" value="${sessionScope.USER_INFO.password}" required><br>
        <input type="hidden" name="emailConfirm" value="${sessionScope.USER_INFO.email}" />
        <input type="submit" name="edit" value="Save">
    </form>
</body>
</html>


