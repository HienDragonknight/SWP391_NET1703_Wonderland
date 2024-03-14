<%-- 
    Document   : customer
    Created on : Jan 19, 2024, 3:26:31 PM
    Author     : phanv
--%>


<%@page import="models.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="icon" href="image/img1.jpg"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href='https://unpkg.com/css.gg@2.0.0/icons/css/profile.css' rel='stylesheet'>
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
                max-width: 12000px;
                margin: 20px 0px 10px 0px;
                background-color: #f6f6f9;
                padding: 40px ;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-right: auto;
            }

            .profile-content {
                display: block;
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
            .orders {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .orders-data {
                display: flex;
                flex-wrap: wrap;
                grid-gap: 24px;
                margin-top: 24px;
                width: 100%;
                color: #363949;
            }

            .orders-data>div {
                border-radius: 20px;
                background: #f6f6f9;
                padding: 24px;
                overflow-x: auto;
            }

            .orders-data .header {
                display: flex;
                align-items: center;
                grid-gap: 16px;
                margin-bottom: 24px;
            }

            .orders-data .header h3 {
                margin-right: auto;
                font-size: 24px;
                font-weight: 600;
            }

            .orders-data .header bx {
                cursor: pointer;
            }

            .orders-data .orders{
                flex-grow: 1;
                flex-basis: 500px;
            }

            .orders-data .orders table{
                width: 100%;
                border-collapse: collapse;
            }

            .orders-data .orders table th{
                padding-bottom: 12px;
                font-size: 13px;
                text-align: left;
                border-bottom: 1px solid #eee;
            }

            .orders-data .orders table td{
                padding: 16px 0;
            }

            .orders-data .orders table tr td:first-child{
                display: flex;
                align-items: center;
                grid-gap: 12px;
                padding-left: 6px;
            }

            .orders-data .orders table tbody tr{
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .orders-data .orders table tbody tr:hover{
                background: #eee;
            }

            .orders-data .orders table tr td .status.completed{
                background: #388E3C;
            }
            .profile-container {
                display: grid;
                justify-content: normal;
            }

            .info-value {
                font-weight: bold;
                border-radius: 4px;
                margin-bottom: 15px;
            }
            .profile-header {
                display: flex;
                justify-content: flex-start;
                gap: 10px;
            }
            .password-container {
                display: flex;
                flex-direction: column;
                margin-bottom: 10px;
            }

            .password-wrapper {
                position: relative;
            }

            input[type="password"] {
                width: calc(100% - 28px);
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .toggle-button {
                position: absolute;
                top: 50%;
                right: 30px;
                transform: translateY(-50%);
                border: 100px;
                background: transparent;
                cursor: pointer;
            }

        </style>
    </head
    <body>
        <!--Use the below code snippet to provide real time updates to the live chat plugin without the need of copying and paste each time to your website when changes are made via PBX-->
    <call-us-selector phonesystem-url="https://1111.3cx.cloud" party="wonderland"></call-us-selector>
    <script defer src="https://downloads-global.3cx.com/downloads/livechatandtalk/v1/callus.js" id="tcx-callus-js" charset="utf-8"></script>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            var showPasswordCheckbox = document.getElementById("showPassword");

            // Nếu checkbox được chọn, hiển thị password
            if (showPasswordCheckbox.checked) {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
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
            <a href="ViewCustomerOrderServlet?email=${sessionScope.USER_INFO.email}">${sessionScope.USER_INFO.fullName}</a>
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
    <div class="profile-container">
        <div class="add-ab">
            <a href="home.jsp">Home</a><span> &#10095; Profile</span>
        </div>
        <div class="profile-content">
            <form action="EditCustomerProfileServlet" method="POST" id="info">
                <div class="profile-header">
                    <i class="gg-profile"></i>
                    <h3>Edit Profile</h3>
                </div></br>
                <div class="info-value">Email: ${sessionScope.USER_INFO.email}</div>
                <input type="hidden" name="email" value="${sessionScope.USER_INFO.email}"/>
                <input type="hidden" name="emailConfirm" value="${sessionScope.USER_INFO.email}"/>
                Full Name <input type="text" name="fullname" value="${sessionScope.USER_INFO.fullName}" required><br>
                Phone Number <input type="text" name="phone" value="${sessionScope.USER_INFO.phoneNumber}" required><br>
                Password <input type="password" name="password" id="password" value="${sessionScope.USER_INFO.password}" required>
                <input type="checkbox" id="showPassword" onclick="togglePassword()"></br></br>                
                <input type="submit" name="edit" value="Save"/>
                <%
                    String msg = (String) request.getAttribute("MESSAGE");
                    if (msg == null) {
                        msg = "";
                    }
                %>
                <%= msg%>
            </form>
        </div>
        <div class="orders-data">
            <div class="orders">
                <div class="header">
                    <i class='bx bx-receipt'></i>
                    <h3>Orders</h3>
                    <i class='bx bx-filter'></i>
                    <i class='bx bx-search'></i>
                </div>

                <form action="ViewCustomerOrderServlet" method="POST">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Date Order</th>
                                    <th>Party Name</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    List<OrderDetailDTO> result = (List<OrderDetailDTO>) request.getAttribute("LIST_CUSTOMER_ORDER");
                                    int countOrder = 1;
                                    if (result != null) {
                                        for (OrderDetailDTO order : result) {

                                %>
                                <tr>
                                    <td><%= countOrder++%></td>
                                    <td><%= order.getFullName()%></td>
                                    <td><%= order.getDateOrder()%></td>
                                    <td><%= order.getPackageName()%></td>
                                    <td><%= order.getTotalPrice()%></td>
                                    <td style="color: <%= order.getStatus().equals("Success") ? "#72FC3E" : order.getStatus().equals("In-progress") ? "blue" : "defaultColor"%>">
                                        <%= order.getStatus()%>
                                    </td>
                                    <td>
                                        <a data-modal-target="#modal<%= countOrder%>">View Details</a>
                                        <div class="modal" id="modal<%= countOrder%>">
                                            <div class="modal-header">
                                                <div class="title"><%= order.getFullName()%></div>
                                            </div>

                                            <div class="modal-body" style="display: flex; flex-direction: column; align-items: center;">
                                                <ul style="list-style: none; width: 100%; text-align: center;">
                                                    <li>
                                                        <p style="font-weight: bold">Party Name: </p> <%= order.getPackageName()%>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold">Party Start: </p> <%= order.getDateStart()%>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold">Service: </p> <%= order.getServiceName()%>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold">Theme: </p> <%= order.getThemeName()%>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold">Amount Of People: </p> <%= order.getAmountOfPeople()%>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold;">Email: </p> <span style="display: <%= (order.getEmail() != null && !order.getEmail().isEmpty()) ? "block" : "none"%>;"><%= order.getEmail()%></span>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold;">Phone: </p> <span style="display: <%= (order.getPhone() != null && !order.getPhone().isEmpty()) ? "block" : "none"%>;"><%= order.getPhone()%></span>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold">Note: </p> <%= order.getNotes()%>
                                                    </li>

                                                    <li>
                                                        <p style="font-weight: bold">Location: </p> <%= order.getLocation()%>
                                                    </li>
                                                </ul>
                                                <button style="align-self: center; background-color: <%= order.getStatus().equals("Success") ? "#72FC3E" : order.getStatus().equals("In-progress") ? "blue" : "defaultColor"%>;">
                                                    <%= order.getStatus()%>
                                                </button>

                                            </div>

                                        </div>

                                        <div id="overlay"></div>
                                    </td>
                                </tr>
                                <%                                                    }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
</div>
<%    }
%>
</body>
</html>
