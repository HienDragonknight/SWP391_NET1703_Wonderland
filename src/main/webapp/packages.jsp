<%-- 
    Document   : packages
    Created on : Jan 19, 2024, 3:26:31 PM
    Author     : Le Huu Huy
--%>


<%@page import="models.PackageDTO"%>
<%@page import="java.util.List"%>
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
            packages {
                display: flex;
                gap: 15px;
            }

            .container-packages {
                background-color: #f0fafc;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                overflow: hidden;
                padding: 20px 20px 20px 20px;
                min-height: 260px;
                max-height: 260px;
                min-width: 400px;
                max-width: 400px;
                position: relative;
            }

            .white-container {
                background-color: #fff;
                margin-bottom: 10px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
                border: 1px solid #3a913a;
            }

            .packages-list {
                display: flex;
                flex-wrap: inherit;
                gap: 20px;
                justify-content: space-between;
            }

            .container-packages .packages-detail #more-detail {
                position: absolute;
                bottom: 20px;
                left: 20px;
                color: #333;
                transition: color 0.3s ease;
            }

            .container-packages:hover .packages-detail #more-detail {
                color: #fff;
            }
            #more-detail {
                background-color: #76def5;
                color: #fff;
                border: 0px solid;
                border-radius: 10px;
                padding: 10px 20px;
                margin: 0px;
                font-family: 'Arial', sans-serif;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s, color 0.3s;
            }

            #more-detail:hover {
                background-color: #0cc5f0;
                color: #fff;
            }

        </style>
    </head
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
                            <a href="#">Sign Up</a>
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
                                <a href="#">Service</a>
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

                </div>
                <div class="packages">
                    <div class="add-ab">
                        <a href="home.jsp">Home</a><span> &#10095; Packages</span>
                    </div>
                    <h1>Packages</h1></br>
                    <div class="packages-list">
                        <%
                            List<PackageDTO> listPackage = (List<PackageDTO>) request.getAttribute("LIST_PACKAGE");
                            if (listPackage != null && listPackage.size() > 0) {
                                for (PackageDTO packages : listPackage) {
                        %>
                        <div class="green-container">
                            <div class="container-packages">
                                <div class="packages-detail">
                                    <h2><%= packages.getPackageName()%></h2></br>
                                    <h3>Price: <%= packages.getUnitPrice()%>$</h3>
                                    <h3>Description: <%= packages.getDescription()%></h3></br>
                                    <a href="PackageItemServlet?packageID=[<%= packages.getPackageID()%>]" ><button id="more-detail">More Detail</button></a>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
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
                    <a href="#">Service</a>
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
                    <a href="#">
                        <i class='bx bx-log-out-circle' ></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="packages">
        <div class="add-ab">
            <a href="home.jsp">Home</a><span> &#10095; Packages</span>
        </div>
        <h1>Packages</h1></br>
        <div class="packages-list">
            <%
                List<PackageDTO> listPackage = (List<PackageDTO>) request.getAttribute("LIST_PACKAGE");
                if (listPackage != null && listPackage.size() > 0) {
                    for (PackageDTO packages : listPackage) {
            %>
            <div class="green-container">
                <div class="container-packages">
                    <div class="packages-detail">
                        <h2><%= packages.getPackageName()%></h2></br>
                        <h3>Price: <%= packages.getUnitPrice()%>$</h3>
                        <h3>Description: <%= packages.getDescription()%></h3></br>
                        <a href="PackageItemServlet?packageID=[<%= packages.getPackageID()%>]" ><button id="more-detail">More Detail</button></a>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</main>
</div>
<%    }
%>
</body>
</html>
