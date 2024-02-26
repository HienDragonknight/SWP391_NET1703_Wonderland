<%-- 
    Document   : testCookie
    Created on : Feb 6, 2024, 1:37:51 AM
    Author     : bao.kun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <button id="checkout">Checkout</button>
    </body>


    <script>
        document.getElementById("checkout").addEventListener("click", function ()
        {
            localStorage.setItem("Name", "Bao");
            console.log(localStorage.getItem("Name"));

        });






    </script>

</html>
