

<%@page import="models.ThemeDTO"%>
<%@page import="models.BonusServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="models.LocationDTO"%>
<%@page import="models.PackageDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Shop Item - Start Bootstrap Template</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="cs/style.css" rel="stylesheet" />
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap');

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif;
            }

            i {
                font-size: 24px;
            }

            a {
                text-decoration: none;
                font-size: 18px;
                color: #232325;
            }

            header .side-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 120px;
            }

            header .side-bar .logo {
                width: 217px;
                height: 38px;
                max-width: 100vw;
            }

            header .side-bar .logo img {
                position: relative;
                bottom: 45px;
                left: 35px;
                width: 100%;
                height: 120px;
            }

            header .side-bar .search-bar {
                position: relative;
                display: flex;
                width: 30%;
                padding: 8px;
                border-radius: 250px;
                border: 1px solid #919191;
                border-color: #5773ff;
            }

            header .side-bar .search-bar form {
                display: flex;
                gap: 12px;
                width: 100%;
            }

            header .side-bar .search-bar button {
                border: none;
                background-color: #fff;
            }

            header .side-bar .search-bar input {
                width: 100%;
                border: none;
                outline: none;
                background-color: transparent;
                font-size: 18px;
            }

            header .side-bar .search-bar:hover i{
                color: #5773ff;
            }

            header .side-bar .profile {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 8px;
                padding: 30px;
            }

            header .side-bar .profile .login-pro i,
            header .side-bar .profile .sign-pro i {
                cursor: pointer;
            }

            header .side-bar .profile .login-pro:hover i,
            header .side-bar .profile .login-pro:hover a {
                color: #5773ff;
            }

            header .side-bar .profile .sign-pro:hover i,
            header .side-bar .profile .sign-pro:hover a {
                color: #5773ff;
            }

            header .side-bar .user-logined {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 35px;
                padding: 30px;
            }

            header .side-bar .user-logined .logined,
            header .side-bar .user-logined .cart-items{
                display: flex;
                justify-items: center;
                align-items: center;
            }

            header .side-bar .user-logined i {
                cursor: pointer;
            }

            header .side-bar .user-logined .logined:hover i,
            header .side-bar .user-logined .logined:hover a {
                color: #5773ff;
            }

            header .side-bar .user-logined .cart-items:hover i,
            header .side-bar .user-logined .cart-items:hover a {
                color: #5773ff;
            }

            .container main {
                display: grid;
                grid-template-columns: 1fr 5fr 1fr;
            }

            .menu-ic li:hover a,
            .menu-ic li:hover i {
                color: #5773ff;
            }

            .menu-ic {
                list-style: none;
                display: flex;
                flex-direction: column;
                padding: 10px 50px;
            }

            .menu-ic li {
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                gap: 20px;
                cursor: pointer;
            }

            .menu-ic li a {
                font-size: 16px;
                transition: all 0.3s ease;
            }

            @media screen and (max-width: 992px) {
                .container {
                    grid-template-columns: 3fr 2fr;
                }

                .container .sidebar {
                    position: absolute;
                    left: -100%;
                }

                .nav-link {
                    display: flex;
                }

            }




            .model {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: 200ms ease-in-out;
                border: 1px solid black;
                border-radius: 10px;
                z-index: 10;
                background-color: white;
                width: 500px;
                max-width: 80%;
            }

            .model.active {
                transform: translate(-50%, -50%) scale(1);
            }

            .model-header {
                padding: 10px 15px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid black;
            }

            .model-header .title {
                font-size: 1.25rem;
                font-weight: bold;
            }

            .model-header .close-button {
                cursor: pointer;
                border: none;
                outline: none;
                background: none;
                font-size: 1.25rem;
                font-weight: bold;
            }

            .model-body {
                padding: 10px 15px;
            }

            #overlay {
                position: fixed;
                opacity: 0;
                transition: 200ms ease-in-out;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, .5);
                pointer-events: none;
            }

            #overlay.active {
                opacity: 1;
                pointer-events: all;
            }




            div.elem-group {
                margin: 20px 0;
            }

            div.elem-group.inlined {
                width: 49%;
                display: inline-block;
                float: left;
                margin: 3% 0;

            }

            label {
                display: block;
                font-family: 'Nanum Gothic';
                padding-bottom: 10px;
                font-size: 1.25em;
            }

            input, select, textarea {
                border-radius: 2px;
                border: 2px solid #777;
                box-sizing: border-box;
                font-size: 1.25em;
                font-family: 'Nanum Gothic';
                width: 100%;
                padding: 10px;
            }

            div.elem-group.inlined input {
                width: 95%;
                display: inline-block;
            }

            textarea {
                height: 250px;
            }

            hr {
                border: 1px dotted #ccc;
            }

            #checkout{
                height: 50px;
                background: #3498db;
                border: none;
                color: white;
                font-size: 1.25em;
                font-family: 'Nunito','Helvetica Neue',Helvetica,Arial,sans-serif;
                border-radius: 4px;
                cursor: pointer;
                width: 40%;

                font-weight: 700;
                text-align: center;
                letter-spacing: .05em;
                text-transform: uppercase;
                color: #fff;
                border-radius: 18px;
            }
            #checkout:hover
            {
                background-color: #2980b9;
            }


            button:hover {
                border: 2px solid black;
            }

            .model-body
            {

                justify-items: center;
                align-items: center;
            }

            #checkout-class
            {
                text-align: center;
                margin-bottom: 10px;
            }

            #theme-selection{
                height: 54px;
            }


        </style>
    </head>
    <body>


        <header>
            <aside class="side-bar">
                <div class="logo">

                    <a href="home.jsp"> <img src="image/LogoCN.png" alt="logo" ></a>
                </div>

                <div class="search-bar">
                    <form action="SearchServlet">
                        <button>
                            <i class='bx bx-search'></i>
                        </button>
                        <input type="text" placeholder="Type here to search">
                    </form>
                </div>


                <div class="profile">
                    <div class="login-pro">
                        <i class='bx bx-user'></i>
                        <a href="login.jsp">Login</a>
                    </div>

                    <span> / </span>

                    <div class="sign-pro">
                        <i class='bx bx-lock-alt'></i>
                        <a href="#">Sign Up</a>
                    </div>

                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill" >0</span>
                        </button>
                    </form>
                </div>

            </aside>
        </header>



        <script >

            function updateCartCount()
            {
                var packgeInfo = localStorage.getItem("packageInfo");

                if (packgeInfo !== null)
                {
                    var localStorageLength = localStorage.length;
                    if (localStorageLength !== 0)
                    {
                        document.getElementById("numsOfCart").innerHTML = localStorageLength;
                    } else
                    {
                        document.getElementById("numsOfCart").innerHTML = 0;
                    }
                }
            }
            
            updateCartCount();

        </script>

    </body>
</html>
