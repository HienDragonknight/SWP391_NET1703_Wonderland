<%-- 
    Document   : customer
    Created on : Jan 19, 2024, 3:26:31 PM
    Author     : phanv
--%>


<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Packages</title>
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

            i {
                font-size: 24px;
            }

            a {
                text-decoration: none;
                font-size: 18px;
                color: #232325;
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
            profile {
                display: flex;
                gap: 15px;
            }

            .white-container {
                background-color: #fff;
                margin-bottom: 10px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
                border: 1px solid #3a913a;
            }

            .logout-button {
                list-style: none;
                display: flex;
                flex-direction: column;
                padding: 10px 50px;
            }

            .logout-button li a{
                color: red;
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                gap: 20px;
                cursor: pointer;
            }

            .logout-button li form {
                display: flex;
                gap: 20px;
                color: red;
                cursor: pointer
            }

            .logout-button li form input {
                border: none;
                background-color: #fff;
                font-size: 17px;
                color: red;
                cursor: pointer;
            }
            #info {
                max-width: 400px;
                margin: 50px;
                background-color: #f6f6f9;
                padding: 40px ;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .profile-content {
                display: flex;
                justify-content: flex-start;
            }

            .profile-content input[type="text"],
            .profile-content input[type="password"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .profile-content input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .profile-content input[type="submit"]:hover {
                background-color: #005dc2;
            }


        </style>
    </head
    <body>
        <!--Use the below code snippet to provide real time updates to the live chat plugin without the need of copying and paste each time to your website when changes are made via PBX-->
    <call-us-selector phonesystem-url="https://1111.3cx.cloud" party="wonderland"></call-us-selector>
    <script defer src="https://downloads-global.3cx.com/downloads/livechatandtalk/v1/callus.js" id="tcx-callus-js" charset="utf-8"></script>
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
        <main class="main">
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

            </div>
            <div class="packages">
                <div class="add-ab">
                    <a href="home.jsp">Home</a><span> &#10095; Profile</span>
                </div>
            </div>
        </main>
    </div>
    <%        } else {
    %>
    <div class="user-logined">
        <div class="logined">
            <i class='bx bx-user-circle'></i>
            <a href="admin.jsp">${sessionScope.USER_INFO.fullName}</a>
        </div>
        <div class="cart-items">
            <i class='bx bx-cart' ></i>
            <a href="#">Cart</a>
        </div>
    </div>
</aside>
</header>
<main class="main">
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
            <ul class="logout-button">
                <li>
                    <form action="LogoutServlet" method="POST">
                        <i class='bx bx-log-out-circle'></i>
                        <input type="submit" value="Logout" name="action" />
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <div class="profile">
        <div class="add-ab">
            <a href="home.jsp">Home</a><span> &#10095; Profile</span>
        </div>
        <div class="profile-content">
            <form action="EditCustomerProfileServlet" method="POST" id="info">
                Email <input type="text" name="email" value="${sessionScope.USER_INFO.email}" readonly><br>
                Full Name <input type="text" name="fullname" value="${sessionScope.USER_INFO.fullName}" required><br>
                Phone Number <input type="text" name="phone" value="${sessionScope.USER_INFO.phoneNumber}" required><br>
                Password <input type="password" name="password" value="${sessionScope.USER_INFO.password}" required><br>
                <input type="hidden" name="emailConfirm" value="${sessionScope.USER_INFO.email}" />
                <input type="submit" name="edit" value="Save">
            </form>
        </div>
    </div>
</main>
</div>
<%    }
%>
</body>
</html>
