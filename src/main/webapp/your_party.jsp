<%-- 
    Document   : admin
    Created on : Jan 24, 2024, 3:01:36 PM
    Author     : Le Huu Huy
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.OrderDetailDTO"%>
<%@page import="models.OrderDTO"%>
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
                height: 200px;
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

            .avatar-image {
                width: 400px; /* Adjust the width as per your requirement */
                height: 200px; /* Maintains the aspect ratio */
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
                width: 100%;
                max-width: 80%;
                max-height: 200px;
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

            .modal-body>div {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .modal-body a {
                margin-top: 20px;
                border: 1px solid #CAFFFF;
                padding: 10px 15px;
                background-color: #CAFFFF;
            }

            .table-wrapper {
                overflow-y: auto;
                height: 450px;
            }

            #notificationContainer {
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: red;
                color: white;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 5px #666;
            }

            #notificationContainer button {
                margin-left: 20px;
                cursor: pointer;
            }


            .button-update-order
            {
                font-size: 20px;
                cursor: pointer;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                text-align: center;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                transition: all 0.3s ease 0s;
                box-shadow: 0 0 5px rgba(0,0,0,0.2), 0 1px 10px rgba(0,0,0,0.19);
                margin: 5%;

            }


            .order-counter {
                margin-top: 65%;
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
                            <a href="ViewUserServlet">
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

                <div class="admin-container">
                    <div class="add-ab">
                        <a href="home.jsp">Home</a><span> &#10095; Your Party</span>
                    </div>
                    <h1>Your Party</h1>
                    <%
                        List<UserDTO> result = (List<UserDTO>) request.getAttribute("LIST_USER");
                        int totalUsers = 0; // Counter for total users
                        if (result != null) {
                            for (UserDTO dto : result) {
                                totalUsers++;
                            }
                        }
                    %>

                    <div>
                        <ul class="insights">

                            <li>
                                <i class='bx bx-user'></i>
                                <a href="view_your_party_servlet?status=going" class="info">
                                    <p>On Going</p>
                                </a>
                            </li>
                            <li>
                                <i class='bx bx-face'></i>
                                <a href="view_your_party_servlet?status=success" class="info">
                                    <p>Completed</p>
                                </a>
                            </li>
                            <li>
                                <i class='bx bx-face'></i>
                                <a href="view_your_party_servlet?status=cancelled" class="info">
                                    <p>Cancelled</p>
                                </a>
                            </li>
                        </ul>
                    </div>


                    <%
                        String updateStatus = (String) request.getAttribute("UPDATE_STATUS");
                        if (updateStatus == null) {
                            updateStatus = "";
                        }
                    %>
                    <%= updateStatus%>
                    <%
                        String deleteStatus = (String) request.getAttribute("DELETE_STATUS");
                        if (deleteStatus == null)
                            deleteStatus = "";
                    %>
                    <%= deleteStatus%>


                    <!-- Users Table -->
                    <div class="bottom-data">

                        <div class="orders">

                            <%
                                List<OrderDetailDTO> listOrder = (List<OrderDetailDTO>) request.getAttribute("ORDER_LIST");
                                if (listOrder.size() != 0) {
                                    int countOrder = 1;
                            %>
                            <div class="header">
                                <i class='bx bx-receipt'></i>
                                <h3>Party</h3>

                            </div>
                            <form action="update_delete_action_paid_order" method="POST">
                                <div class="table-wrapper">

                                    <table>

                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Your Package</th>
                                                <th>Location</th>    
                                                <th>Date Start</th>
                                                <th>Time Start</th>
                                                <th>Create At</th>                                                  
                                                <th>Total Price</th>      
                                                <th>Status</th>    
                                            </tr>
                                        </thead>


                                        <%
                                            for (OrderDetailDTO dto : listOrder) {
                                        %>
                                        <tbody class="scrollable">

                                            <tr>    
                                                <td class="order-counter"><%= countOrder++%></td>
                                                <td><%= dto.getPackageName()%></td>
                                                <td style="width: 330px;" ><%= dto.getLocaltionDetails()%></td>        
                                                <td>
                                                    <%-- Check if 'status' parameter is 'cancelled' or 'success' --%>
                                                    <% String status = request.getParameter("status");
                                                        if (status != null && (status.equals("cancelled") || status.equals("success"))) {%>
                                                    <input type="date" id="checkin-date" name="checkin-date" value="<%= dto.getDateStart()%>" style="width: 150px;" disabled />
                                                    <% } else {%>
                                                    <input type="date" id="checkin-date"  name="checkin-date" value="<%= dto.getDateStart()%>"  style="width: 150px;" />
                                                    <% } %>
                                                </td>

                                                <td>
                                                    <%-- Check if 'status' parameter is 'cancelled' or 'success' --%>
                                                    <% if (status != null && (status.equals("cancelled") || status.equals("success"))) {%>
                                                    <input type="time" id="checkin-time" name="checkin-time" value="<%= dto.getTimeStart()%>" style="width: 110px;" disabled />
                                                    <% } else {%>
                                                    <input type="time" id="checkin-time" name="checkin-time" value="<%= dto.getTimeStart()%>" style="width: 110px;" />
                                                    <% }%>
                                                </td>
                                                <td><%= dto.getDateOrder()%></td>        
                                                <td><%= dto.getTotalPrice()%></td>        
                                                <td><%= dto.getStatus()%></td>   
                                                <td style="width: 245px"; >
                                                    <%
                                                        if (status != null && status.equals("going")) {
                                                    %>
                                                    <input type="submit" name="action" value="Update"  class="button-update-order" style="width: 90px; cursor: pointer; background-color: #4CAF50; color: white; border: none; border-radius: 5px; padding: 10px 20px; text-align: center; display: inline-block; font-size: 16px; margin: 4px 2px; transition: all 0.3s ease 0s; box-shadow: 0 0 5px rgba(0,0,0,0.2), 0 1px 10px rgba(0,0,0,0.19); margin: 5%;" />                                                  

                                                    <input type="submit" nam="action" value="Delete" class="button-update-order" style="width: 90px; cursor: pointer; background-color: red; color: white; border: none; border-radius: 5px; padding: 10px 20px; text-align: center; display: inline-block; font-size: 16px; margin: 4px 2px; transition: all 0.3s ease 0s; box-shadow: 0 0 5px rgba(0,0,0,0.2), 0 1px 10px rgba(0,0,0,0.19); margin: 5%;" />                                                   
                                                    <%
                                                        }
                                                    %>
                                                </td>

                                                <td>

                                                </td>   
                                        <input type="hidden"  name="orderDetail-Id" value="<%= dto.getOrderDetailId()%>"> 
                                        <input type="hidden"  name="orderID" value="<%= dto.getOrderId()%>"> 

                                        </tr>
                                        <%
                                            }
                                        } else {

                                        %>

                                        <div style="text-align: center">
                                            <i class='bx bx-notification-off'></i>
                                            <p>There is no party</p>
                                        </div>


                                        <%                                            }

                                        %>

                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Notification Container -->
            <div id="notificationContainer" style="display:none; position:fixed; top:20px; right:20px; background-color:red; color: white; padding:15px; border-radius:5px; box-shadow:0 0 5px #666;">
                <span id="notificationMessage">This order starts in less than 2 days.</span>
                <span id="countdownTimer" style="margin-left: 10px; display: none"></span>
            </div>
        </div>

        <script>
            function confirmCancel(dateStartStr) {
                var dateStart = new Date(dateStartStr);
                var now = new Date();
                var timeDiff = dateStart.getTime() - now.getTime();
                var dayDiff = timeDiff / (1000 * 3600 * 24);

                if (dayDiff < 2) {
                    var notificationContainer = document.getElementById('notificationContainer');
                    var countdownTimer = document.getElementById('countdownTimer');
                    var notificationMessage = document.getElementById('notificationMessage');

                    // Show the custom notification
                    notificationContainer.style.display = 'block';
                    notificationMessage.innerHTML = 'This order starts in less than 2 days.';

                    // Set timer for 5 seconds
                    var secondsLeft = 3;
                    countdownTimer.innerHTML = secondsLeft;
                    var countdownInterval = setInterval(function () {
                        secondsLeft--;
                        countdownTimer.innerHTML = secondsLeft;
                        if (secondsLeft <= 0) {
                            clearInterval(countdownInterval);
                            closeNotification();
                        }
                    }, 1000);
                }
            }

            // Function to close the notification
            function closeNotification() {
                document.getElementById('notificationContainer').style.display = 'none';
            }





            function isCheckinDateValid() {
                var checkinDate = document.getElementById('checkin-date').value;
                var year = checkinDate.split("-")[0];
                var month = checkinDate.split("-")[1];
                var date = checkinDate.split("-")[2];

                // Ensure leading zero padding for month and date
                month = month.padStart(2, '0');
                date = date.padStart(2, '0');

                var time = document.getElementById('checkin-time').value;
                var hour = time.split(":")[0];
                var minute = time.split(":")[1];

                var dateTimeCheckin = new Date(year, month - 1, date, hour, minute);

                var currentDateTime = new Date();
                var threeHoursAhead = new Date(currentDateTime.getTime() + (3 * 60 * 60 * 1000));

                if (dateTimeCheckin < threeHoursAhead) {
                    alert("Sorry! We cannot set your party order due to early time condition, then try again.");
                    return false; // Prevent form submission
                }

                return true;
            }

            isCheckinDateValid();


            function formatDate()
            {
                return dateBoundary = document.getElementById('checkin-date').value;
            }

            document.getElementById('checkin-date').setAttribute('min', formatDate());


            function setMinDate() {
                var inputDate = document.getElementById("checkin-date").value;
                document.getElementById("checkin-date").min = inputDate;
            }
            setMinDate();






        </script>
    </div>
</body>
</html>
