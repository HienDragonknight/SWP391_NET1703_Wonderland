<%-- 
    Document   : home
    Created on : Jan 20, 2024, 11:02:52 AM
    Author     : Le Huu Huy
--%>

<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wonderlands</title>
        <link rel="icon" href="image/LogoTron.png"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

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
                gap: 8px;
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

            .page-footer {
                background-color: #f6f6f9;
                border-top-left-radius: 50%;
                border-top-right-radius: 50%;
                font-family: 'Poppins', sans-serif;
            }

            footer {
                height: 100%;
            }

            .footer-content {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 50px;
                gap: 100px;
                margin-bottom: -50px;
            }

            .footer-content-usp ul {
                list-style: none;
            }

            .footer-content-usp ul li {
                margin-bottom: 20px;
            }

            .footer-header {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .footer-header h2 {
                margin-top: 40px;
            }

            .footer-content-usp a {
                display: flex;
                align-items: center;
            }

            .copy-right {
                background-color: #fff;
            }

            .copy-right-content {
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .logout li form {
                display: flex;
                gap: 20px;
                color: red;
                cursor: pointer
            }

            .logout li form input {
                border: none;
                background-color: #fff;
                font-size: 17px;
                color: red;
                cursor: pointer;
            }

            main {
                margin-bottom: 30px;
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

            .intro-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                padding-left: 100px;
                padding-right: 100px;
                margin-top: 30px;
                gap: 30px;
                margin-bottom: 20px;
            }

            .intro-image {
                width: 50%;
            }

            .intro-image img {
                width: 100%;
                border-radius: 20px;
            }

            .intro-text {
                width: 50%;
            }

            .intro-text p {
                margin-bottom: 20px;
            }

            .intro-text button {
                border: none;
                border-radius: 5px;
            }

            .intro-text button a{
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 8px;
                color: #5773ff;
                gap: 5px;
            }

            .about {
                background: #FFF5CB;
                padding: 50px;
                border-top-left-radius: 25%;
                border-top-right-radius: 25%;
                border-bottom-left-radius: 25%;
                border-bottom-right-radius: 25%;
                margin-bottom: 40px;
            }

            .about .about-top h2 {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 40px;
            }

            .ups-row {
                display: flex;
                justify-content: space-evenly;
            }

            .ups-row-content {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                margin-bottom: 60px;
            }

            .service {
                padding: 60px;
            }

            .service-container {
                margin: 0px 231.5px;
                padding: 0px 7.5px;
            }

            .special-image {
                width: 100%;
                border-radius: 50px;
                margin-top: 20px;
            }

            .service .service-heading{
                text-align: center;
                font-weight: bold;
            }

            .special-title {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                gap: 10px;
            }

            .special-title span {
                font-size: 20px;
                font-weight: bold;
            }

            .special-image {
                margin-bottom: 20px;
            }

            .special-image img {
                width: 100%;
                border-radius: 30px;
            }

            .theme {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                margin-bottom: 20px;
            }

            .theme h4 {
                border: 1px solid #ffa000;
                max-width: 250px;
                padding: 10px 20px;
                border-radius: 30px;
                position: relative;
                top: 20px;
                background: #fff;
            }

            .theme-container {
                background-color: #fff8e0;
                border-radius: 32px;
                padding: 40px;
                margin: 0 auto;
            }

            .service-other {
                display: flex;
                flex-direction: column;
            }

            .services-others-contents {
                border-radius: 32px;
                border: 6px dashed #c0f0ff;
                padding: 30px 0;
                gap: 30px;
                margin-top: 20px;
            }

            .services-other-list {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
                gap: 150px;
            }

            .services-other-item {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .service-desc {
                padding: 20px 0px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .service-btn {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .service-btn button {
                padding: 20px;
                border-radius: 30px;
                background: #00a0e0;
                border: none;
            }

            .service-btn button a {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 5px;
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



                    <%
                        UserDTO dto = (UserDTO) session.getAttribute("USER_INFO");

                        if (dto == null) {
                    %>
                    <div class="profile">
                        <div class="login-pro">
                            <i class='bx bx-user'></i>
                            <a href="login.jsp">Login</a>
                        </div>

                        <span> / </span>

                        <div class="sign-pro">
                            <i class='bx bx-lock-alt'></i>
                            <a href="register.jsp">Sign Up</a>
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
                                <a href="ViewServiceServlet">Service</a>
                            </li>
                            <li>
                                <i class='bx bx-party'></i>
                                <a href="BookingPartyServlet">Booking Party</a>
                            </li>
                            <li>
                                <i class='bx bx-info-circle'></i>
                                <a href="about.jsp">About Us</a>
                            </li>
                        </ul>
                    </div>

                    <div class="column-content">
                        <div class="slide-container">
                            <div class="slides">
                                <img src="image/cover1.jpg" alt="image #1" class="active"/>
                                <img src="image/cover2.jpg" alt="image #2"/>
                                <img src="image/cover3.jpg" alt="image #3"/>
                                <img src="image/cover4.png" alt="image #4"/>
                            </div>

                            <div class="buttons">
                                <span class="next">&#10095;</span>
                                <span class="prev">&#10094;</span>
                            </div>

                            <div class="dotsContainer">
                                <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                                <div class="dot" attr='1' onclick="switchImage(this)"></div>
                                <div class="dot" attr='2' onclick="switchImage(this)"></div>
                                <div class="dot" attr='3' onclick="switchImage(this)"></div>
                            </div>
                        </div>

                        <div class="intro-wrapper">
                            <div class="intro-image">
                                <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/Best%20Party.png" alt="Best Party">
                            </div>
                            <div class="intro-text">
                                <div>
                                    <p>
                                        Is a meaningful and special birthday to mark an important milestone for little angels always something parents wonder about?
                                    </p>
                                    <p>
                                        With a variety of birthday party packages, Wonderlands promises to bring little angels a party full of surprises and memorable moments.
                                    </p>
                                </div>
                                <button>
                                    <a href="#">
                                        <i class='bx bx-cake' ></i>
                                        <span>Contact to book a party</span>
                                    </a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="about">
                    <div class="about-top">
                        <h2 style="color: #005198;">WHY CHOOSE TO BOOK A PARTY AT WONDER?</h2>
                        <div class="ups-row">
                            <div class="ups-row-content">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo1.png" alt="usp-1">
                                <div>
                                    <h3 style="color: #f86080">UNLIMITED FUN</h3>
                                </div>
                            </div>

                            <div class="ups-row-content">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo2.png" alt="usp-1">
                                <div>
                                    <h3 style="color: #f0b000">LOVELY DECORATION</h3>
                                </div>
                            </div>

                            <div class="ups-row-content">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo3.png" alt="usp-1">
                                <div>
                                    <h3 style="color: #20b050">FUN PARTY PROGRAM</h3>
                                </div>
                            </div>
                        </div>

                        <div class="ups-row">
                            <div class="ups-row-content">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo4.png" alt="usp-1">
                                <div>
                                    <h3 style="color: #20b050">DIVERSE GAMES</h3>
                                </div>
                            </div>

                            <div class="ups-row-content">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo5.png" alt="usp-1">
                                <div>
                                    <h3 style="color: #00a0f0">ATTRACTIVE DIVERSE MENU</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="service">
                    <div class="service-container">
                        <div class="service-heading">
                            <h1 style="color: #005198;">SPECIAL SERVICE</h1>
                        </div>

                        <div class="special-title">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/color-wheel%201.png"/>
                            <span style="color: #005198; font-weight: bold">Full decoration according to theme</span>
                        </div>

                        <div class="special-image">
                            <img src="https://tiniworld.com/media/wysiwyg/birthday/birthday_slide-3.png"/>
                        </div>

                        <div class="theme">
                            <h4 style="color: #ffa000; text-align: center">HOT decoration theme</h4>

                            <div class="theme-container">
                                <div class="service-theme">
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(2).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(3).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(4).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(5).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(6).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(7).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(8).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(9).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(10).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(11).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(12).png"/>
                                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(15).png"/>
                                </div>
                            </div>
                        </div>

                        <div class="service-other">
                            <div class="special-title">
                                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/party%201.png"/>
                                <span style="color: #005198; font-weight: bold">Other services</span>
                            </div>

                            <div class="services-others-contents">
                                <div class="services-other-list">
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(1).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Smash Pinata candy</font>
                                    </div>
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(2).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Bubble clown</font>
                                    </div>
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(4).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Giant bubble</font>
                                    </div>
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(6).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">English MC</font>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="services-other-list">
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(8).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Artistic face painting</font>
                                    </div>
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(3).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Magic magic</font>
                                    </div>
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(5).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Lovely cake</font>
                                    </div>
                                    <div class="services-other-item">
                                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(7).png"/>
                                        <br>
                                        <font style="font-size: 19px; color: #00c2f3">Gift for baby</font>
                                    </div>
                                </div>
                            </div>

                            <div class="service-desc">
                                <font>Please contact Wonder staff for advice on special services</font>
                            </div>

                            <div class="service-btn">
                                <button>
                                    <a href="#">
                                        <i style="color: #FFAC85" class='bx bx-cake' ></i>
                                        <font style="color: #fff">CONTACT FOR CONSULATION</font>
                                    </a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="page-footer">
                <div class="footer-header">
                    <h2>NEW CHILDREN'S TRADING AND SERVICES JOINT STOCK COMPANY</h2>
                </div>

                <div class="footer-content">
                    <div class="footer-content-usp">
                        <ul>
                            <li>History begin</li>
                            <li>Job opportunities</li>
                            <li>Wonder regulation</li>
                            <li>Wonder Partner</li>
                            <li>Wonder Charity Foundation</li>
                        </ul>
                    </div>

                    <div class="footer-content-usp">
                        <ul>
                            <li>
                                <a href="#">
                                    <i class='bx bx-world'></i>
                                    <span>nkidgroup.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class='bx bx-envelope' ></i>
                                    <span>cskh@wonderland.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class='bx bx-phone' ></i>
                                    <span>1900 63 63 28</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class='bx bx-current-location' ></i>
                                    <span>SWP391</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="copy-right">
                    <div class="copy-right-content">
                        <font>Copyright © 2016 N KID CORPORATION - Wonderland amusement park</font>
                    </div>
                </div>
            </footer>
        </div>
        <%
        } else {
        %>
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
                    <a href="ViewServiceServlet">Service</a>
                </li>
                <li>
                    <i class='bx bx-party'></i>
                    <a href="BookingPartyServlet">Booking Party</a>
                </li>
                <li>
                    <i class='bx bx-info-circle'></i>
                    <a href="about.jsp">About Us</a>
                </li>
            </ul>
            <ul class="logout">
                <li>
                    <form action="LogoutServlet" method="POST">
                        <i class='bx bx-log-out-circle'></i>
                        <input type="submit" value="Logout" name="action" />
                    </form>
                </li>
            </ul>
        </div>

        <div class="column-content">
            <div class="slide-container">
                <div class="slides">
                    <img src="image/cover1.jpg" alt="image #1" class="active"/>
                    <img src="image/cover2.jpg" alt="image #2"/>
                    <img src="image/cover3.jpg" alt="image #3"/>
                    <img src="image/cover4.png" alt="image #4"/>
                </div>

                <div class="buttons">
                    <span class="next">&#10095;</span>
                    <span class="prev">&#10094;</span>
                </div>

                <div class="dotsContainer">
                    <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                    <div class="dot" attr='1' onclick="switchImage(this)"></div>
                    <div class="dot" attr='2' onclick="switchImage(this)"></div>
                    <div class="dot" attr='3' onclick="switchImage(this)"></div>
                </div>
            </div>

            <div class="intro-wrapper">
                <div class="intro-image">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/Best%20Party.png" alt="Best Party">
                </div>
                <div class="intro-text">
                    <div>
                        <p>
                            Is a meaningful and special birthday to mark an important milestone for little angels always something parents wonder about?
                        </p>
                        <p>
                            With a variety of birthday party packages, Wonderlands promises to bring little angels a party full of surprises and memorable moments.
                        </p>
                    </div>
                    <button>
                        <a href="#">
                            <i class='bx bx-cake' ></i>
                            <span>Contact to book a party</span>
                        </a>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="about">
        <div class="about-top">
            <h2 style="color: #005198;">WHY CHOOSE TO BOOK A PARTY AT WONDER?</h2>
            <div class="ups-row">
                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo1.png" alt="usp-1">
                    <div>
                        <h3 style="color: #f86080">UNLIMITED FUN</h3>
                    </div>
                </div>

                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo2.png" alt="usp-1">
                    <div>
                        <h3 style="color: #f0b000">LOVELY DECORATION</h3>
                    </div>
                </div>

                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo3.png" alt="usp-1">
                    <div>
                        <h3 style="color: #20b050">FUN PARTY PROGRAM</h3>
                    </div>
                </div>
            </div>

            <div class="ups-row">
                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo4.png" alt="usp-1">
                    <div>
                        <h3 style="color: #20b050">DIVERSE GAMES</h3>
                    </div>
                </div>

                <div class="ups-row-content">
                    <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo5.png" alt="usp-1">
                    <div>
                        <h3 style="color: #00a0f0">ATTRACTIVE DIVERSE MENU</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="service">
        <div class="service-container">
            <div class="service-heading">
                <h1 style="color: #005198;">SPECIAL SERVICE</h1>
            </div>

            <div class="special-title">
                <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/color-wheel%201.png"/>
                <span style="color: #005198; font-weight: bold">Full decoration according to theme</span>
            </div>

            <div class="special-image">
                <img src="https://tiniworld.com/media/wysiwyg/birthday/birthday_slide-3.png"/>
            </div>

            <div class="theme">
                <h4 style="color: #ffa000; text-align: center">HOT decoration theme</h4>

                <div class="theme-container">
                    <div class="service-theme">
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(2).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(3).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(4).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(5).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(6).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(7).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(8).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(9).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(10).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(11).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(12).png"/>
                        <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(15).png"/>
                    </div>
                </div>
            </div>

            <div class="service-other">
                <div class="special-title">
                    <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/party%201.png"/>
                    <span style="color: #005198; font-weight: bold">Other services</span>
                </div>

                <div class="services-others-contents">
                    <div class="services-other-list">
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(1).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Smash Pinata candy</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(2).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Bubble clown</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(4).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Giant bubble</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(6).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">English MC</font>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="services-other-list">
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(8).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Artistic face painting</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(3).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Magic magic</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(5).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Lovely cake</font>
                        </div>
                        <div class="services-other-item">
                            <img src="https://tiniworld.com/static/version1706722373/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(7).png"/>
                            <br>
                            <font style="font-size: 19px; color: #00c2f3">Gift for baby</font>
                        </div>
                    </div>
                </div>

                <div class="service-desc">
                    <font>Please contact Wonder staff for advice on special services</font>
                </div>

                <div class="service-btn">
                    <button>
                        <a href="#">
                            <i style="color: #FFAC85" class='bx bx-cake' ></i>
                            <font style="color: #fff">CONTACT FOR CONSULATION</font>
                        </a>
                    </button>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="page-footer">
    <div class="footer-header">
        <h2>NEW CHILDREN'S TRADING AND SERVICES JOINT STOCK COMPANY</h2>
    </div>

    <div class="footer-content">
        <div class="footer-content-usp">
            <ul>
                <li>History begin</li>
                <li>Job opportunities</li>
                <li>Wonder regulation</li>
                <li>Wonder Partner</li>
                <li>Wonder Charity Foundation</li>
            </ul>
        </div>

        <div class="footer-content-usp">
            <ul>
                <li>
                    <a href="#">
                        <i class='bx bx-world'></i>
                        <span>nkidgroup.com</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-envelope' ></i>
                        <span>cskh@wonderland.com</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-phone' ></i>
                        <span>1900 63 63 28</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-current-location' ></i>
                        <span>SWP391</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="copy-right">
        <div class="copy-right-content">
            <font>Copyright © 2016 N KID CORPORATION - Wonderland amusement park</font>
        </div>
    </div>
</footer>

</div>
<%
    }
%>

<script src="js/slider.js"></script>
</body>
</html>