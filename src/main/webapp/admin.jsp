<%-- 
    Document   : admin
    Created on : Jan 24, 2024, 3:01:36 PM
    Author     : Le Huu Huy
--%>

<%@page import="java.util.List"%>
<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="icon" href="image/LogoTron.png"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                gap: 30px;
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

            .container .column {
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

            .slide-container {
                position: relative;
                width: 100%;
                max-width: 100vw;
                height: 650px;
                max-height: 100vh;
                margin: auto;
            }

            .slide-container .slides {
                width: 100%;
                height: 100%;
                position: relative;
                overflow: hidden;
            }

            .slide-container .slides img{
                width: 100%;
                height: 100%;
                position: absolute;
                object-fit: cover;
                border-radius: 50px;
            }

            .slide-container .slides img:not(.active) {
                top: 0;
                left: -100%;
            }

            span.next, span.prev {
                display: none;
            }

            .dotsContainer {
                position: absolute;
                bottom: 5px;
                z-index: 3;
                left: 50%;
                transform: translateX(-50%);
                padding: 10px;
            }

            .dotsContainer .active {
                background-color: #5773ff;
            }

            .dotsContainer .dot {
                width: 15px;
                height: 15px;
                margin: 0px 2px;
                border: 3px solid #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
                cursor: pointer;
            }

            .column-about {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 50px;
            }

            .column-about img {
                width: 40%;
                border-radius: 50px;
            }

            .column-about .column-about-container {
                padding: 0px 100px;
            }

            .column-about .column-about-container button {
                padding: 10px;
                border-radius: 50px;
                background-color: #0b96d3;
                cursor: pointer;
                border: none;
            }

            .column-about .column-about-container button a {
                display: flex;
                justify-content: center;
                align-items: center;
                color: #fff;
                gap: 8px;
            }

            .logout {
                list-style: none;
                display: flex;
                flex-direction: column;
                padding: 10px 50px;
            }

            .logout li a{
                color: red;
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                gap: 20px;
                cursor: pointer;
            }

            @keyframes next1 {
                from {
                    left: 0%;
                }
                to {
                    left: -100%;
                }
            }

            @keyframes next2 {
                from {
                    left: 100%;
                }
                to {
                    left: 0%;
                }
            }

            @keyframes prev1 {
                from {
                    left: 0%;
                }
                to {
                    left: 100%;
                }
            }

            @keyframes prev2 {
                from {
                    left: -100%;
                }
                to {
                    left: 0%;
                }
            }

            @media screen and (max-width: 992px) {
                .container main {
                    grid-template-columns: 3fr 2fr;
                }

                .menu {
                    position: absolute;
                    left: -100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
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

                    <div class="user-logined">
                        <div class="logined">
                            <i class='bx bx-user-circle'></i>
                            <a href="ViewUserServlet">${sessionScope.USER_INFO.fullName}</a>
                        </div>
                        <div class="cart-items">
                            <i class='bx bx-cart' ></i>
                            <a href="#">Cart</a>
                        </div>
                    </div>
                </aside>
            </header>

            <main>
                <div class="column">
                    <div class="menu">
                        <ul class="menu-ic">
                            <li>
                                <i class='bx bx-home-alt-2'></i>

                                <a href="home.jsp">Home</a>
                            </li>

                            <li>
                                <i class='bx bx-location-plus'></i>
                                <a href="ViewLocation">Location</a>
                            </li>
                            <li>
                                <i class='bx bx-package'></i>
                                <a href="ViewPackage">Packages</a>

                            </li>
                            <li>
                                <i class='bx bx-bell'></i>
                                <a href="#">Service</a>
                            </li>
                            <li>
                                <i class='bx bx-party'></i>
                                <a href="#">Order Party</a>
                            </li>
                            <li>
                                <i class='bx bx-info-circle'></i>
                                <a href="about.jsp">About Us</a>
                            </li>
                        </ul>
                        <ul class="logout">
                            <li>
                                <a href="#">
                                    <i class='bx bx-log-out-circle' ></i>
                                    <span>Logout</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="admin-container">
                        <div>
                            <h1>Admin Dashboard</h1>
                        </div>

                        <%
                            List<UserDTO> result = (List<UserDTO>) request.getAttribute("LIST_USER");

                            if (result != null) {
                                int count = 0;
                                for (UserDTO dto : result) {
                                    String urlRewriting = "DispatchServlet"
                                            + "?btAction=admin"
                                            + "&pk=" + dto.getFullName();
                        %>
                        <form action="ViewUserServlet" method="POST">
                            <h2><%= dto.getFullName() %></h2>
                            <h2><%= dto.getEmail() %></h2>
                        </form>  
                        <%
                                }
                            }
                        %>
                    </div>
                </div>

            </main>
        </div>
    </body>
</html>
