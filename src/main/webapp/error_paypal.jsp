<%-- 
    Document   : error_paypal
    Created on : Feb 21, 2024, 8:47:58 AM
    Author     : bao.kun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PayPal Error</title>
    </head>
    <body>

        <div align="center" >
            <h1>Payment Error:</h1>
            <br>
            <h3>${requestScope.ERROR_MESSAGE}</h3>
        </div>
    </body>
</html>
