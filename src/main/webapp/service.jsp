<%-- 
    Document   : service
    Created on : Feb 25, 2024, 3:31:43 PM
    Author     : huY
--%>

<%@page import="java.util.List"%>
<%@page import="models.BonusServiceDTO"%>
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

            .row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .service {
                width: calc(25% - 10px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                display: flex;
                flex-direction: column;
                gap: 20px;
                padding: 20px;
            }

            .service img {
                height: 250px;
                width: 280px;
            }

            .service-content {
                max-height: 200px;
                height: 100px;
            }

            .service-content ul {
                list-style: none;
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .service-content ul li {
                display: flex;
                gap: 10px;
            }

            .service-price {
                display: flex;
                justify-content: center;
            }

            .service-price > div {
                background-color:  #FFDD67;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 5px 16px;
                border-radius: 20px;
            }

            .service-price > div > i {
                font-size: 20px;
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
                                <a href="service.jsp">Service</a>
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

                    <div class="main-contain">
                        <%
                            List<BonusServiceDTO> result = (List<BonusServiceDTO>) request.getAttribute("SERVICE_LIST");

                            if (result != null) {
                                int count = 0;
                                for (BonusServiceDTO serviceDTO : result) {
                                    // Start a new row for every 4th service
                                    if (count % 4 == 0) {
                        %>
                        <div class="row">
                            <% }%>
                            <div class="service">
                                <img src="src" alt="alt" />
                                <div class="service-content">
                                    <ul>
                                        <li>
                                            <p style="font-weight: bold">Name: </p>
                                            <%= serviceDTO.getServiceName()%>
                                        </li>
                                        <li>
                                            <p style="font-weight: bold">Description: </p>
                                            <%= serviceDTO.getDescriptions()%>
                                        </li>
                                    </ul>
                                </div>
                                <div class="service-price">
                                    <div>
                                        <i class='bx bx-dollar'></i> 
                                        <p><%= serviceDTO.getServicePrice()%></p>
                                    </div>
                                </div>
                            </div>
                            <%
                                // End row after every 4th service
                                count++;
                                if (count % 4 == 0 || count == result.size()) {
                            %>
                        </div>
                        <%
                                    }
                                }
                            } %>
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
                <%
                    if (session.getAttribute("USER_INFO") != null && dto.getRoleID().equals("2")) {
                %>
                <a href="ViewUserServlet">${sessionScope.USER_INFO.fullName}</a>
                <%
                } else if (dto.getRoleID().equals("1")) {
                %>
                <a href="customer.jsp">${sessionScope.USER_INFO.fullName}</a>
                <%
                } else {
                %>
                <a href="PartyHostServlet">${sessionScope.USER_INFO.fullName}</a>
                <%
                    }
                %>

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
                    <a href="service.jsp">Service</a>
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

        <div class="main-contain">
            <%
                List<BonusServiceDTO> result = (List<BonusServiceDTO>) request.getAttribute("SERVICE_LIST");

                if (result != null) {
                    int count = 0;
                    for (BonusServiceDTO serviceDTO : result) {
                        // Start a new row for every 4th service
                        if (count % 4 == 0) {
            %>
            <div class="row">
                <% }%>
                <div class="service">
                    <img src="src" alt="alt" />
                    <div class="service-content">
                        <ul>
                            <li>
                                <p style="font-weight: bold">Name: </p>
                                <%= serviceDTO.getServiceName()%>
                            </li>
                            <li>
                                <p style="font-weight: bold">Description: </p>
                                <%= serviceDTO.getDescriptions()%>
                            </li>
                        </ul>
                    </div>
                    <div class="service-price">
                        <div>
                            <i class='bx bx-dollar'></i> 
                            <p><%= serviceDTO.getServicePrice()%></p>
                        </div>
                    </div>
                </div>
                <%
                    // End row after every 4th service
                    count++;
                    if (count % 4 == 0 || count == result.size()) {
                %>
            </div>
            <%
                                    }
                                }
                            } %>
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
</body>
</html>
