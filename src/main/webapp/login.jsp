<%-- 
    Document   : login
    Created on : Jan 20, 2024, 8:55:25 PM
    Author     : 84335
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="icon" href="image/LogoTron.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
        <style>
            body {
                background-image: url('https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/1600/900/75/dam/disneyland/attractions/disneyland/sleeping-beauty-castle-walkthrough/sleeping-beauty-castle-exterior-16x9.jpg?1699632197159');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--        <form action="LoginServlet" method="POST">
        
        
        ${sessionScope.ERROR}
        Email <input type="text" name="txtEmail"  /><br/>
        Password <input type="password" name="txtPassword"  /><br/>

        <input type="submit" value="Login" name="action" /> 

    </form>-->

        <%
            String errorMessage = (String) session.getAttribute("ERROR_INFO");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= errorMessage%>
        </div>
        <%
                session.removeAttribute("ERROR_INFO");
            }
        %>

        <div class="container-fluid position-relative d-flex p-0">
            <div class="container-fluid">
                <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                    <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                        <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <a href="./LoginServlet" class="" style="text-decoration: none">
                                    <h3 class="text-primary" style="color: aqua !important;"><i class="fa fa-user-edit me-2" style="color: aqua"></i>Wonderland</h3>
                                </a>
                                <h3>Sign In</h3>
                            </div>
                            <form action="LoginServlet" method="POST">
                                <div class="form-floating mb-3">
                                    <% Cookie[] cookies = request.getCookies();
                                        String cuValue = "";
                                        String cpValue = "";
                                        String crChecked = "";
                                        if (cookies != null) {
                                            for (Cookie cookie : cookies) {
                                                if ("cEmail".equals(cookie.getName())) {
                                                    cuValue = cookie.getValue();
                                                } else if ("cPassword".equals(cookie.getName())) {
                                                    cpValue = cookie.getValue();
                                                } else if ("cRemember".equals(cookie.getName())) {
                                                    crChecked = "checked";
                                                }
                                            }
                                        }
                                    %>
                                    <input type="email" name="txtEmail" class="form-control" id="floatingInput" aria-describedby="emailHelp" placeholder="Enter email" value="<%=cuValue%>" required="required">
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <input type="password" name="txtPassword" class="form-control" id="floatingPassword" placeholder="Password" value="<%= cpValue%>" required="required">
                                    <label for="floatingPassword">Password</label>
                                </div>

                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="form-check">
                                        <input type="checkbox" <%= crChecked%> name="RememberMe" value="ON" class="form-check-input" id="exampleCheck1" style="border-color: aqua; background-color: aqua;">
                                        <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                    </div>
                                    <a href="ForgotPasswordServlet" style="color: aqua;">Forgot Password</a>
                                </div>
                                <button type="submit" class="btn btn-primary py-3 w-100 mb-4" style="background-color: aqua; border-color: aqua;">Sign In</button>
                                <p class="text-center mb-0">Don't have an Account? <a href="./register" style="color: aqua;">  <input type="submit" value="Login" name="action" /> </a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
