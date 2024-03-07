<%-- 
    Document   : host
    Created on : Feb 27, 2024, 8:09:21 AM
    Author     : huY
--%>

<%@page import="models.OrderDTO"%>
<%@page import="models.OrderDTO"%>
<%@page import="models.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Party Host</title>
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
                max-height: 600px;
                height: 600px;
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

            .bottom-data .orders table td input {
                border: none;
                outline: none;
                background: #f6f6f9;
                font-size: 16px;
                width: 100%;
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

            .table-wrapper {
                overflow-y: auto;
                height: 500px;
            }

            .header form {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
            }

            .header .search-btn {
                display: none;
            }

            .header input {
                border: none;
                padding: 5px 20px;
                outline: none;
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

            .btn {
                background-color: transparent;
                border: 1px solid #0dbaec; /* Màu viền */
                border-radius: 5px; /* Border radius */
                color: #0dbaec; /* Màu chữ */
                text-decoration: none; /* Bỏ gạch chân */
                padding: 5px 10px; /* Padding */
                transition: all 0.3s ease; /* Transition */
            }

            .btn:hover {
                background-color: #0dbaec; /* Màu khi hover */
                color: white; /* Màu chữ khi hover */
            }

            .logined img {
                width: 30px;
                border-radius: 50%;
            }

            .logined a {
                display: flex;
                align-items: center;
                justify-content: center;
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

                    <div class="user-logined">
                        <div class="logined">
                            <a href="PartyHostServlet">
                                <img src="image/${sessionScope.USER_INFO.avatar}"/>
                                ${sessionScope.USER_INFO.fullName}
                            </a>
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

                    <%
                        UserDTO hostDTO = (UserDTO) session.getAttribute("USER_INFO");
                    %>

                    <div class="admin-container">
                        <%
                            if (hostDTO.getRoleID().equals("3")) {
                        %>
                        <div class="admin-header">
                            <h1>Party Host Dashboard</h1>
                        </div>
                        <%
                        } else if (hostDTO.getRoleID().equals("2")) {
                        %>
                        <div class="admin-header">
                            <h1>Admin Dashboard</h1>
                            <a href="manageAccount.jsp">Manage Account</a>
                        </div>
                        <%
                            }
                        %>
                        <%
                            List<UserDTO> result = (List<UserDTO>) request.getAttribute("LIST_USER");

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
                                    <a href="PartyHostServlet" class="info">
                                        <p>User</p>
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
                                    <h3>Orders</h3>
                                    <!-- Add your search bar if needed -->
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>User Name</th>
                                                <th>Created At</th>
                                                <th>Total Price</th>
                                                <th>Status</th>
                                                <th>View Details</th>
                                                <th>Send Result</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                    List<OrderDTO> orderList = (List<OrderDTO>) request.getAttribute("ORDER_LIST");
                                                for (OrderDTO order : orderList) {
                                            %>
                                            <tr>
                                                <td><%= order.getOrderID()%></td>
                                                <td><%= order.getUserName()%></td>
                                                <td><%= order.getCreateDate()%></td>
                                                <td><%= order.getTotalPrice()%></td>
                                                <td><%= order.getStatus()%></td>
                                                <td>
                                                    <a href="ViewOrderDetailsServlet?orderID=<%= order.getOrderDetailID()%>" class="btn btn-primary btn-sm">View Details</a>
                                                </td>
                                                <td>
                                                    <a href="CustomerOrder?orderID=<%= order.getOrderID()%>" class="btn btn-primary btn-sm">Send Confirm</a>
                                                </td>

                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
<!--=======
                                            <tbody class="scrollable">
                                                <%                                                    List<UserDTO> searchResult = (List<UserDTO>) request.getAttribute("SEARCH_RESULT");
                                                    if (searchResult == null) {
                                                        int countUser = 1;
                                                        if (result != null) {
                                                            for (UserDTO dto : result) {
                                                                String urlReport = "AdminServlet?action=Update&email=" + dto.getEmail();
                                                %>
                                                <tr>
                                                    <td><%= countUser++%></td>
                                                    <td><%= dto.getFullName()%></td>
                                                    <td><%= dto.getPhoneNumber()%></td>
                                                    <td><%= dto.getEmail()%></td>
                                                    <td><%= dto.getRoleID()%></td>
                                                    <td style="display: <%= (dto.getReported() != null && !dto.getReported().isEmpty()) ? "block" : "none"%>;"><%= dto.getReported()%></td>
                                                    <td><a href="<%= urlReport%>">Report</a></td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                } else {
                                                    int coutUser = 1;
                                                    for (UserDTO searchR : searchResult) {
                                                        String urlReport = "AdminServlet?action=Update&email=" + searchR.getEmail();
                                                %>
                                                <tr>
                                                    <td><%= coutUser++%></td>
                                                    <td><%= searchR.getFullName()%></td>
                                                    <td><%= searchR.getPhoneNumber()%></td>
                                                    <td><%= searchR.getEmail()%></td>
                                                    <td><%= searchR.getRoleID()%></td>
                                                    <td><%= searchR.getReported()%></td>
                                                    <td><a href="<%= urlReport%>">Report</a></td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
>>>>>>> e48aff32085fa6f7ff61e372ac7707e60329f773-->
                            </div>
                        </div>
                    </div>

            </main>
        </div>
    </body>
</html>
