<%-- 
    Document   : adminOrder
    Created on : Feb 1, 2024, 10:15:00 AM
    Author     : Le Huu Huy
--%>

<%@page import="models.OrderDetailDTO"%>
<%@page import="models.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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

            .insights {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
                grid-gap: 24px;
                margin-top: 36px;
            }

            .insights li {
                padding: 24px;
                background: #f6f6f9;
                border-radius: 20px;
                display: flex;
                align-items: center;
                grid-gap: 24px;
                cursor: pointer;
            }

            .insights li .bx {
                width: 80px;
                height: 80px;
                border-radius: 10px;
                font-size: 36px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .insights li:nth-child(1) .bx {
                background: #CFE8FF;
                color: #1976D2;
            }

            .insights li:nth-child(2) .bx {
                background: #FFF2C6;
                color: #FBC02D;
            }

            .insights li:nth-child(3) .bx {
                background: #BBF7D0;
                color: #388E3C;
            }

            .insights li:nth-child(4) .bx {
                background: #FECDD3;
                color: #D32F2F;
            }

            .insights li .info h3 {
                font-size: 24px;
                font-weight: 600;
                color: #363949;
            }

            .insights li .info p {
                color: #363949;
            }

            .bottom-data {
                display: flex;
                flex-wrap: wrap;
                grid-gap: 24px;
                margin-top: 24px;
                width: 100%;
                color: #363949;
            }

            .bottom-data>div {
                border-radius: 20px;
                background: #f6f6f9;
                padding: 24px;
                overflow-x: auto;
            }

            .bottom-data .header {
                display: flex;
                align-items: center;
                grid-gap: 16px;
                margin-bottom: 24px;
            }

            .bottom-data .header h3 {
                margin-right: auto;
                font-size: 24px;
                font-weight: 600;
            }

            .bottom-data .header bx {
                cursor: pointer;
            }

            .bottom-data .orders{
                flex-grow: 1;
                flex-basis: 500px;
            }

            .bottom-data .orders table{
                width: 100%;
                border-collapse: collapse;
            }

            .bottom-data .orders table th{
                padding-bottom: 12px;
                font-size: 13px;
                text-align: left;
                border-bottom: 1px solid #eee;
            }

            .bottom-data .orders table td{
                padding: 16px 0;
            }

            .bottom-data .orders table tr td:first-child{
                display: flex;
                align-items: center;
                grid-gap: 12px;
                padding-left: 6px;
            }

            .bottom-data .orders table tbody tr{
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .bottom-data .orders table tbody tr:hover{
                background: #eee;
            }

            .bottom-data .orders table tr td .status.completed{
                background: #388E3C;
            }

            .admin-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
            }

            .admin-header a {
                height: 36px;
                padding: 0 16px;
                border-radius: 36px;
                background: #1976D2;
                color: #f6f6f9;
                display: flex;
                align-items: center;
                justify-content: center;
                grid-gap: 10px;
                font-weight: 500;
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

            .view-detail {
                font-size: 16px;
                text-decoration: underline;
                color: blue;
            }

            .modal {
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

            .modal.active {
                transform: translate(-50%, -50%) scale(1);
            }

            .modal-header {
                padding: 10px 15px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid black;
            }

            .modal-header .title {
                font-size: 1.25rem;
                font-weight: bold;
            }

            .modal-header .close-button {
                cursor: pointer;
                border: none;
                outline: none;
                background: none;
                font-size: 1.25rem;
                font-weight: bold;
            }

            .modal-body {
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

            .modal-body ul li {
                display: flex;
                gap: 10px;
                margin-bottom: 10px;
            }

            .modal-body button {
                border: none;
                padding: 20px 50px;
                border-radius: 10px;
                font-size: 15px;
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

                    <div class="admin-container">
                        <div class="admin-header">
                            <h1>Admin Dashboard</h1>
                            <a href="manageAccount.jsp">Manage Account</a>
                        </div>
                        <%
                            List<OrderDetailDTO> result = (List<OrderDetailDTO>) request.getAttribute("LIST_ORDER");

                            double totalIncome = 0;
                            if (result != null) {
                                for (OrderDetailDTO dto : result) {
                                    totalIncome += dto.getTotalPrice();
                                }
                            }
                        %>

                        <div>
                            <ul class="insights">
                                <li>
                                    <i class='bx bx-box'></i>
                                    <a href="ViewOrderServlet" class="info">
                                        <p>Order</p>
                                    </a>
                                </li>
                                <li>
                                    <i class='bx bx-user'></i>
                                    <a href="ViewUserServlet" class="info">
                                        <p>User</p>
                                    </a>
                                </li>
                                <li>
                                    <i class='bx bx-money'></i>
                                    <a href="ViewUserServlet" class="info">
                                        <h3 style="font-size: 20px;">
                                            <%= totalIncome%>
                                        </h3>
                                        <p>Income</p>
                                    </a>
                                </li>
                                <li>
                                    <i class='bx bx-face'></i>
                                    <a href="profile.jsp" class="info">
                                        <p>Profile</p>
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <!-- Users Table -->
                        <div class="bottom-data">
                            <div class="orders">
                                <div class="header">
                                    <i class='bx bx-receipt'></i>
                                    <h3>Users</h3>
                                    <i class='bx bx-filter'></i>
                                    <i class='bx bx-search'></i>
                                </div>

                                <form action="AdminServlet" method="POST">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>User</th>
                                                <th>Date Order</th>
                                                <th>Party Name</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                int countOrder = 1;
                                                if (result != null) {
                                                    for (OrderDetailDTO dto : result) {

                                            %>
                                            <tr>
                                                <td><%= countOrder++%></td>
                                                <td><%= dto.getFullName()%></td>
                                                <td><%= dto.getDateOrder()%></td>
                                                <td><%= dto.getPackageName()%></td>
                                                <td><%= dto.getTotalPrice()%></td>
                                                <td style="color: <%= dto.getStatus().equals("Success") ? "#72FC3E" : dto.getStatus().equals("In-progress") ? "blue" : "defaultColor"%>">
                                                    <%= dto.getStatus()%>
                                                </td>
                                                <td>
                                                    <a data-modal-target="#modal<%= countOrder%>">View Details</a>
                                                    <div class="modal" id="modal<%= countOrder%>">
                                                        <div class="modal-header">
                                                            <div class="title"><%= dto.getFullName()%></div>
                                                        </div>

                                                        <div class="modal-body" style="display: flex; flex-direction: column; align-items: center;">
                                                            <ul style="list-style: none; width: 100%; text-align: center;">
                                                                <li>
                                                                    <p style="font-weight: bold">Party Name: </p> <%= dto.getPackageName()%>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold">Party Start: </p> <%= dto.getDateStart()%>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold">Service: </p> <%= dto.getServiceName()%>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold">Theme: </p> <%= dto.getThemeName()%>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold">Amount Of People: </p> <%= dto.getAmountOfPeople()%>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold;">Email: </p> <span style="display: <%= (dto.getEmail() != null && !dto.getEmail().isEmpty()) ? "block" : "none"%>;"><%= dto.getEmail()%></span>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold;">Phone: </p> <span style="display: <%= (dto.getPhone() != null && !dto.getPhone().isEmpty()) ? "block" : "none"%>;"><%= dto.getPhone() %></span>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold">Note: </p> <%= dto.getNotes()%>
                                                                </li>

                                                                <li>
                                                                    <p style="font-weight: bold">Location: </p> <%= dto.getLocation()%>
                                                                </li>
                                                            </ul>
                                                            <button style="align-self: center; background-color: <%= dto.getStatus().equals("Success") ? "#72FC3E" : dto.getStatus().equals("In-progress") ? "blue" : "defaultColor"%>;">
                                                                <%= dto.getStatus()%>
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
                                </form>
                            </div>
                        </div>


                    </div>

            </main>
        </div>

        <script>
            const openModalButtons = document.querySelectorAll('[data-modal-target]');
            const closeModalButtons = document.querySelectorAll('[data-close-button]');
            const overlay = document.getElementById('overlay');

            openModalButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const modal = document.querySelector(button.dataset.modalTarget);
                    openModal(modal);
                });
            });

            overlay.addEventListener('click', () => {
                const modals = document.querySelectorAll('.modal.active');
                modals.forEach(modal => {
                    closeModal(modal);
                });
            });

            closeModalButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const modal = button.closest('.modal');
                    closeModal(modal);
                });
            });

            function openModal(modal) {
                if (modal === null)
                    return;
                modal.classList.add('active');
                overlay.classList.add('active');
            }

            function closeModal(modal) {
                if (modal === null)
                    return;
                modal.classList.remove('active');
                overlay.classList.remove('active');
            }
        </script>

    </body>
</html>
