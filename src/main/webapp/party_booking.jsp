<%-- 
    Document   : party_booking
    Created on : Feb 5, 2024, 8:41:23 AM
    Author     : Le Huu Huy
--%>

<%@page import="models.BonusServiceDTO"%>
<%@page import="models.ThemeDTO"%>
<%@page import="models.PackageDTO"%>
<%@page import="models.LocationDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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

            .add-ab {
                position: relative;
                top: -4px;
                font-size: 13px;
            }

            .add-ab a {
                font-size: 13px;
            }

            .add-ab a:hover {
                color: #5773ff;
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

            .booking-form {
                margin-top: 30px;
            }

            .booking-form > div {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 10px;
            }

            .booking-form > div h1 {
                background-color: #FEDC72;
                padding: 10px 50px;
                border-radius: 20px;
                font-weight: 500;
                color: #005198;
            }

            .background-booking > div {
                display: flex;
                flex-direction: column;
                padding: 0px 200px;
                background: #FFF3CF;
                border-radius: 10px;
            }

            .background-booking > div h4 {
                text-align: center;
                font-size: 24px;
                color: #00A0F0;
            }

            .background-booking > div p {
                color: #333333;
            }

            .content-form {
                padding: 20px;
                background-color: #fff;
                border-radius: 20px;
                margin-bottom: 30px;
            }

            .content-form form div {
                display: flex;
                gap: 20px;
            }

            .content-form form div > div {
                display: flex;
                flex-direction: column;
                gap: 6px;
                margin-bottom: 5px;
            }

            .list-booking select {
                border: none;
                background-color: #F3F3F3;
                padding: 10px;
                border-radius: 10px;
                font-size: 15px;
            }

            .content-form input {
                border: none;
                background-color: #F3F3F3;
                padding: 10px;
                border-radius: 10px;
                font-size: 15px;
            }

            .content-form form {
                display: flex;
                flex-direction: column;
            }

            .send-btn {
                justify-content: center;
                margin-top: 20px;
            }

            .send-btn input {
                padding: 10px 20px;
                background-color: #00A0F0;
                color: #fff;
                border-radius: 20px;
                cursor: pointer;
            }

            .content-form form > div {
                justify-content: center;
            }

            label {
                color: #00A0F0;
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
                                <a href="ViewBookingServlet">Booking Party</a>
                            </li>
                            <li>
                                <i class='bx bx-info-circle'></i>
                                <a href="about.jsp">About Us</a>
                            </li>
                        </ul>
                    </div>

                    <div class="column-content">
                        <div class="add-ab">
                            <a href="home.jsp">Home</a><span> &#10095; Booking</span>
                        </div>

                        <h1 style="margin-bottom: 5px;">Party Booking</h1>

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
                    </div>
                </div>

                <div class="booking-form">
                    <div>
                        <h1>Booking Party</h1> 
                    </div>

                    <div class="background-booking">
                        <div>
                            <div>
                                <h4 style="margin-top: 20px;">
                                    Send consulting information
                                </h4>
                            </div>

                            <div>
                                <p style="text-align: center;">Please leave your information, tiNi staff will contact you within 24 hours.</p>
                            </div>

                            <div class="content-form">
                                <form>
                                    <div>
                                        <div>
                                            <h2>
                                                User information
                                            </h2>

                                            <div>
                                                <label>Full Name</label>
                                                <input type="text" name="" value="" />
                                            </div>

                                            <div>
                                                <label>Phone Number</label>
                                                <input type="text" name="" value="" />
                                            </div>

                                            <div>
                                                <label>Email</label>
                                                <input type="text" name="" value="" />
                                            </div>
                                        </div>

                                        <%
                                            List<ThemeDTO> themeDTO = (List<ThemeDTO>) request.getAttribute("THEME_LIST");
                                            List<LocationDTO> locationDTO = (List<LocationDTO>) request.getAttribute("LOCATION_LIST");
                                            List<BonusServiceDTO> serviceDTO = (List<BonusServiceDTO>) request.getAttribute("SERVICE_LIST");
                                            List<PackageDTO> packageDTO = (List<PackageDTO>) request.getAttribute("PACKAGE_LIST");
                                        %>

                                        <div class="list-booking">
                                            <h2>
                                                Party Booking Information
                                            </h2>

                                            <div>
                                                <label>Location</label>
                                                <select>
                                                    <%
                                                        for (LocationDTO location : locationDTO) {
                                                    %>
                                                    <option><%= location.getLocationDetails()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>

                                            <div>
                                                <label>Date/Time</label>
                                                <input type="text" name="" value="" />
                                                <input type="text" name="" value="" /> 
                                            </div>

                                            <div>
                                                <label>Amount of Children</label>
                                                <input type="text" name="" value="" />
                                            </div>

                                            <div>
                                                <label>Package</label>
                                                <select>
                                                    <%
                                                        for (PackageDTO packages : packageDTO) {
                                                    %>
                                                    <option><%= packages.getPackageName()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>

                                            <div>
                                                <label>Theme</label>
                                                <select>
                                                    <%
                                                        for (ThemeDTO theme : themeDTO) {
                                                    %>
                                                    <option><%= theme.getThemeName()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>

                                            <div>
                                                <label>Service</label>
                                                <select>
                                                    <%
                                                        for (BonusServiceDTO service : serviceDTO) {
                                                    %>
                                                    <option><%= service.getServiceName()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="send-btn">
                                        <input type="submit" value="Send" name="action" />
                                    </div>
                                </form>
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
                    <a href="ViewBookingServlet">Booking Party</a>
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
            <div class="add-ab">
                <a href="home.jsp">Home</a><span> &#10095; Booking</span>
            </div>

            <h1 style="margin-bottom: 5px;">Party Booking</h1>

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
        </div>
    </div>

    <div class="booking-form">
        <div>
            <h1>Booking Party</h1> 
        </div>

        <div class="background-booking">
            <div>
                <div>
                    <h4 style="margin-top: 20px;">
                        Send consulting information
                    </h4>
                </div>

                <div>
                    <p style="text-align: center;">Please leave your information, tiNi staff will contact you within 24 hours.</p>
                </div>

                <div class="content-form">
                    <form>
                        <div>

                            <%
                                List<ThemeDTO> themeDTO = (List<ThemeDTO>) request.getAttribute("THEME_LIST");
                                List<LocationDTO> locationDTO = (List<LocationDTO>) request.getAttribute("LOCATION_LIST");
                                List<BonusServiceDTO> serviceDTO = (List<BonusServiceDTO>) request.getAttribute("SERVICE_LIST");
                                List<PackageDTO> packageDTO = (List<PackageDTO>) request.getAttribute("PACKAGE_LIST");
                            %>

                            <div class="list-booking">
                                <h2>
                                    Party Booking Information
                                </h2>

                                <div>
                                    <label>Location</label>
                                    <select>
                                        <%
                                            for (LocationDTO location : locationDTO) {
                                        %>
                                        <option><%= location.getLocationDetails()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div>
                                    <label>Date/Time</label>
                                    <input type="text" name="" value="" />
                                </div>

                                <div>
                                    <label>Amount of Children</label>
                                    <input type="text" name="" value="" />
                                </div>

                                <div>
                                    <label>Package</label>
                                    <select>
                                        <%
                                            for (PackageDTO packages : packageDTO) {
                                        %>
                                        <option><%= packages.getPackageName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div>
                                    <label>Theme</label>
                                    <select>
                                        <%
                                            for (ThemeDTO theme : themeDTO) {
                                        %>
                                        <option><%= theme.getThemeName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div>
                                    <label>Service</label>
                                    <select>
                                        <%
                                            for (BonusServiceDTO service : serviceDTO) {
                                        %>
                                        <option><%= service.getServiceName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="send-btn">
                            <input type="submit" value="Send" name="action" />
                        </div>
                    </form>
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
