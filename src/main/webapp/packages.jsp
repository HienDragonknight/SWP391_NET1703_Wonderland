<%-- 
    Document   : packages
    Created on : Jan 19, 2024, 3:26:31 PM
    Author     : Le Huu Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wonderlands</title>
        <link rel="icon" href="image/img1.jpg"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap');

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Roboto', sans-serif;
            }

            a {
                text-decoration: none;
                color: #232325;
            }

            i {
                cursor: pointer;
            }

            .sidebar .logo img {
                height: 90px;
            }

            html, body {
                height: 100vh;
            }

            .container {
                width: 100%;
                display: grid;
                grid-template-columns: 1fr 5fr 1fr;
            }

            .sidebar {
                height: 100vh;
                background-color: #fff;
                padding: 20px 36px;
                display: flex;
                flex-direction: column;
                z-index: 1000;
                transition: all 0.6s ease;
            }

            .logo {
                display: flex;
                align-items: center;
                gap: 6px;
            }

            .logo img {
                position: relative;
                bottom: 20px;
                width: 100%;
            }

            main header .nav-link button,
            .sidebar .logo {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            i {
                font-size: 24px;
                transition: all 0.3s ease;
            }

            .menu-ic li:hover a,
            .menu-ic li:hover i {
                color: #5773ff;
            }

            .menu-ic {
                list-style: none;
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

            .nav-link {
                display: none;
                align-items: center;
            }

            .search form {
                position: relative;
                top: 25px;
                left: 350px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 30px;
                width: 50%;
                padding: 8px;
                border-radius: 250px;
                border: 2px solid #919191;
                border-color: #5773ff;
            }

            header {
                padding-bottom: 50px;
            }

            .search:hover input,
            .search:hover i{
                color: #5773ff;
            }

            .search form input {
                width: 80%;
                border: none;
                outline: none;
                background-color: transparent;
                font-size: 18px;
            }

            .right-section .profile {
                position: relative;
                top: 8px;
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: 8px;
                padding: 30px;
                position: relative;
                bottom: 1px;
                font-size: 17px;
            }

            .right-section .profile i {
                font-size: 18px;
            }

            .profile .login:hover a,
            .profile .login:hover i{
                color: #5773ff;
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
        </style>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <div class="logo">
                    <img src="image/LogoCN.png" width="217" height="38" alt="img2"/>
                </div>

                <div class="menu">
                    <ul class="menu-ic">
                        <li>
                            <i class='bx bx-home-alt-2' ></i>
                            <a href="home.jsp">Home</a>
                        </li>
                        <li>
                            <i class='bx bx-location-plus' ></i>
                            <a href="location.jsp">Location</a>
                        </li>
                        <li>
                            <i class='bx bx-package' ></i>
                            <a href="packages.jsp">Packages</a>
                        </li>
                        <li>
                            <i class='bx bx-bell'></i>
                            <a href="#">Sale</a>
                        </li>
                        <li>
                            <i class='bx bx-party' ></i>
                            <a href="#">Order Party</a>
                        </li>
                        <li>
                            <i class='bx bx-info-circle' ></i>
                            <a href="#">About Us</a>
                        </li>
                    </ul>
                </div>
            </aside>

            <main>
                <header>
                    <div class="nav-link">
                        <button class="menu-btn" id="menu-open" style="height: 30px">
                            <i class='bx bx-menu'></i>
                        </button>
                        <img src="image/LogoCN.png" width="217" height="90" alt="LogoCN"/>
                    </div>

                    <div class="search">
                        <form action="SearchServlet">
                            <i class='bx bx-search' ></i>
                            <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" placeholder="Type here to search"/>
                        </form>
                    </div>
                </header>
            </main>

            <div class="right-section">
                <div class="profile">
                    <div class="login">
                        <i class='bx bx-user'></i>
                        <a href="#">Login</a>
                    </div>
                    <span>/</span>
                    <div class="login">
                        <i class='bx bx-lock-alt' ></i>
                        <a href="#"> Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
