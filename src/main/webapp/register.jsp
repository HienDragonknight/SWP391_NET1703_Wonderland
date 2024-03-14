<%-- 
    Document   : register
    Created on : Jan 28, 2024, 1:24:41 PM
    Author     : phanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="184401035778-2c6dvkkthkd3foi4bu6a2lcsle6atlfn.apps.googleusercontent.com">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
            .col-12 {
                background-color: rgba(255, 255, 255, 0.85);
                border-radius: 20px;
            }
            .link-login-google {
                display: grid;
                text-align: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid position-relative d-flex p-0">
            <div class="container-fluid">
                <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                    <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                        <div class="rounded p-4 p-sm-5 my-4 mx-3">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <a href="./LoginServlet" class="" style="text-decoration: none">
                                    <h3 class="text-primary" style="color: #007bff !important;"><i class="fa fa-user-edit me-2" style="color: #007bff"></i>Wonderland</h3>
                                </a>
                                <h3>Sign Up</h3> <!-- Changed from "Sign In" to "Sign Up" -->
                            </div>
                            <form action="RegisterServlet" method="POST"> <!-- Changed action to "RegisterServlet" -->
                                <div class="form-floating mb-3">
                                    <input type="text" name="txtName" class="form-control" id="floatingName" placeholder="Enter your name" value="" required="required"> <!-- Added name field -->
                                    <label for="floatingName">Full Name</label> <!-- Added label for name field -->
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" name="txtEmail" class="form-control" id="floatingEmail" aria-describedby="emailHelp" placeholder="Enter email" value="" required="required">
                                    <label for="floatingEmail">Email address</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <input type="password" name="txtPassword" class="form-control" id="floatingPassword" placeholder="Password" value="" required="required">
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <input type="password" name="txtCfPassword" class="form-control" id="floatingCfPassword" placeholder="Confirm Password" value="" required="required">
                                    <label for="floatingCfPassword">Confirm Password</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <input type="text" name="txtPhone" class="form-control" id="floatingPhone" placeholder="Enter your phone number" value="" required="required"> <!-- Added phone field -->
                                    <label for="floatingPhone">Phone Number</label> <!-- Added label for phone field -->
                                </div>

                                <input type="submit" value="Sign Up" name="action" class="btn btn-primary py-3 w-100 mb-4"> <!-- Changed button text to "Sign Up" -->
                            </form>
                            <a href="./LoginServlet" style="color: #007bff;">   <p class="text-center mb-0">Already have an Account? Sign In.</p>  </a> <!-- Added link to login page -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
