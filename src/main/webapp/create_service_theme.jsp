<%-- 
    Document   : host
    Created on : Feb 27, 2024, 8:09:21 AM
    Author     : huY
--%>

<%@page import="models.BonusServiceDTO"%>
<%@page import="models.OrderDetailDTO"%>
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

            .order-details-form {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                margin: 0 auto;
            }

            .order-details-form label {
                font-weight: 600;
                color: #333;
                display: block;
                margin-bottom: 5px;
            }

            .order-details-form input[type="text"],
            .order-details-form input[type="number"],
            .order-details-form textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .order-details-form input[readonly],
            .order-details-form textarea[readonly] {
                background-color: #e9ecef;
                color: #495057;
                cursor: not-allowed;
            }

            .order-details-form input[type="text"]:focus,
            .order-details-form input[type="number"]:focus,
            .order-details-form textarea:focus {
                border-color: #80bdff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            .order-details-form .btn {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .order-details-form .btn:hover {
                background-color: #0056b3;
            }

            .order-details-form textarea {
                height: 100px;
            }

            .order-details-form p {
                text-align: center;
            }

            .order-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }

            .order-table th, .order-table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .order-table th {
                background-color: #f4f4f4;
                color: #333;
            }

            .order-table tr:hover {
                background-color: #f5f5f5;
            }

            .order-table td {
                background-color: #ffffff;
            }
            .order-details-section{
                margin-top: 37px;
                margin-left: 95px;
                border: 1px solid grey;
                border-radius: 20px;
                padding: 23px;
                font-family: 'Roboto';
                font-size: 20px;
            }
            .max18{
                width : 18%
            }
        </style>
        <style>
            /* CSS cho các form */
            .form-container {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                margin: 0 auto;
            }

            .form-container label {
                font-weight: 600;
                color: #333;
                display: block;
                margin-bottom: 5px;
            }

            .form-container input[type="text"],
            .form-container input[type="number"],
            .form-container textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-container input[readonly],
            .form-container textarea[readonly] {
                background-color: #e9ecef;
                color: #495057;
                cursor: not-allowed;
            }

            .form-container input[type="text"]:focus,
            .form-container input[type="number"]:focus,
            .form-container textarea:focus {
                border-color: #80bdff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            .form-container .btn {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .form-container .btn:hover {
                background-color: #0056b3;
            }

            .form-container textarea {
                height: 100px;
            }

            .form-container p {
                text-align: center;
            }

            /* CSS cho form được chọn */
            .selected {
                display: block;
            }

            .hidden {
                display: none;
            }
       /* Paste your CSS here */
body {
    background-color: #00c0ff24;
}

#h1 {
    padding: 30px 2px 0px 113px;
    font-size: 34px;
}

.top37 {
    margin-top: 37px;
}

.buttonA {
    background-color: #f8d569;
    border: solid #e2b907;
    color: white;
    font-size: 18px;
    font-weight: 600;
    padding: 10px;
    border-radius: 10px;
}

.inputA {
    border: solid white;
    border-radius: 14px;
    width: 100%;
    padding: 15px;
    margin-bottom: 20px;
}

.imgFile {
    padding: 40px;
    vertical-align: middle;
    border-style: none;
    width: 100%;
    background-color: white;
    margin-bottom: 120px
}

#hinhAnh {
    margin-bottom: 31px;
    padding: 20px;
    background-color: white;
}

#loaiSanPham,
#status {
    appearance: auto;
    border: solid white;
    border-radius: 14px;
    width: 100%;
    height: 60px;
    margin-bottom: 40px;
}

.row{
    display: 
        flex;
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
                            <a href="PartyHostServlet">${sessionScope.USER_INFO.fullName}</a>
                        </div>
                        <div class="cart-items">
                            <i class='bx bx-cart' ></i>
                            <a href="#">Cart</a>
                        </div>
                    </div>
                </aside>
            </header>


            <main>
                <%@include file="views/menu.jsp" %>

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

                    <%                        int report = 2;
                        if (session.getAttribute("report") != null) {
                            report = (int) session.getAttribute("report");
                        }
                    %>

                    <!-- Form Container -->
                    <p class="report" value="<%=report%>"></p>

                  <div class="form-container hidden" id="bonusServiceForm">
    <!-- Form Manage Bonus Service -->
    <form action="AddBonusServiceServlet" method="POST" enctype="multipart/form-data">
        <h1 id="h1">Add new service</h1>
<!--        <p class="report" value="<%=report%>"></p>-->
<!--        <div class=" alert hide ">
            <span class="fas fa-exclamation-circle"></span>
            <span class="msg">Warning: !</span>
            <div class="close-btn">
                <span class="fas fa-times"></span>
            </div>
        </div>-->
        <div class="container padding-top-60 mb-3">
            <div class="row">
                <div class="col-md-4">
                    <input type="file" class="inputA top37" id="image" name="image" accept="image/*" required>
                    <div>
                        <img class="imgFile" src="https://th.bing.com/th/id/OIP.RgZdMqNzMgkH3o8rsku6BAAAAA?rs=1&pid=ImgDetMain" alt="" id="previewImage">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="text" class="inputA" id="serviceName" name="serviceName" placeholder="Service Name" required>
                    </div>
                    <div class="form-group">
                        <input type="number" class="inputA" id="servicePrice" name="servicePrice" placeholder="Service Price" step="0.01" min="0" required>
                    </div>
                    <div class="form-group">
                        <textarea class="inputA" id="descriptions" name="descriptions" rows="3" placeholder="Description" required></textarea>
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" class="buttonA">Add Service</button>
    </form>
</div>

                    </div>

                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            var reportValue = document.querySelector('.report').getAttribute('value');

                            // Nếu giá trị là 0, hiển thị form bonusService
                            if (reportValue === '2') {
                                document.getElementById('bonusServiceForm').classList.remove('hidden');
                            }
                        });
                    </script>
                    <%session.removeAttribute("report");%>
                    <!-- JavaScript để chỉ hiển thị một trong hai form -->


                    <!-- Bootstrap JS, Popper.js, and jQuery -->
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


            </main>
        </div>
    </body>
</html>
