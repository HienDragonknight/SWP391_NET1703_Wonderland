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
            /* Tạo kiểu cho các nút */
            .btn {
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-primary {
                background-color: #007bff;
                color: white;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .btn-warning {
                background-color: #ffc107;
                color: #212529;
                border: none;
            }

            .btn-warning:hover {
                background-color: #e0a800;
                color: #212529;
            }

            .btn-outline-danger {
                color: #dc3545;
                border-color: #dc3545;
            }

            .btn-outline-danger:hover {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
            }

            /* Tạo kiểu cho bảng */
            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table th,
            .table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #dee2e6;
            }

            .table th {
                background-color: #f8f9fa;
                color: #6c757d;
            }

            .table tr:hover {
                background-color: rgba(0, 0, 0, 0.075);
            }
            /* CSS cho các nút */
            /* CSS cho phần Action */
            .action-container {
                display: flex;
                align-items: center; /* Canh chỉnh các phần tử vào giữa */
            }



            /* CSS cho nút khi hover */

            /* CSS cho phần Action */
            .action-container {
                display: flex;
                align-items: center; /* Canh chỉnh các phần tử vào giữa */
            }


            .action-container .btn-update {
                padding: 10px 20px;
                color: #ffc107;
                border: 1px solid #ffc107;
                border-radius: 4px;
                cursor: pointer;
                transition: all 0.3s ease;
            }


            .action-container .btn-delete {
                padding: 10px 20px;
                color: #dc3545;
                border: 1px solid #dc3545;
                border-radius: 4px;
                cursor: pointer;
                transition: all 0.3s ease;
            }


            .action-container .btn-create {
                padding: 10px 20px;
                color: #28a745;
                border: 1px solid #28a745;
                border-radius: 4px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .action-container .btn-update:hover {
                background-color: #ffc107;
                box-shadow: 0px 0px 0px 3px rgba(255, 193, 7, 0.5);
            }

            .action-container .btn-delete:hover {
                background-color: #dc3545;
                box-shadow: 0px 0px 0px 3px rgba(220, 53, 69, 0.5);
            }

            .action-container .btn-create:hover {
                background-color: #28a745;
                box-shadow: 0px 0px 0px 3px rgba(40, 167, 69, 0.5);
            }

            .magin80{
                margin-top: 80px;
            }

            .btnDeltete{
                padding: 10px 23px;
                font-size: 17px;
                margin-left: 20px;
            }

            .pagination {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }

            .pagination button {
                padding: 10px 20px;
                border: 2px solid #4CAF50; /* Màu viền */
                background-color: #4CAF50; /* Màu nền */
                color: white; /* Màu chữ */
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .pagination button:hover {
                background-color: #45a049; /* Màu nền hover */
                border-color: #45a049; /* Màu viền hover */
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

                    <!-- Modal -->


                    <div class="container mt-3">
                        <!-- Create button -->

                        <!-- Table -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Service ID</th>
                                    <th scope="col">Service Name</th>
                                    <th scope="col">Service Price</th>
                                    <th scope="col">Descriptions</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                 List<BonusServiceDTO> result1 = (List<BonusServiceDTO>) request.getAttribute("SERVICE_LIST");

                                    if (result1 != null) {
                                        int count = 0;
                                        for (BonusServiceDTO serviceDTO : result1) {
                                            // Start a new row for every 4th service

                                %>

                                <!-- Repeat this block for each service -->
                                <tr>
                                    <td><%= serviceDTO.getServiceID()%></td>
                                    <td> <%= serviceDTO.getServiceName()%></td>
                                    <td>$<%= serviceDTO.getServicePrice()%></td>
                                    <td> <%= serviceDTO.getDescriptions()%></td>
                                    <td> <%= serviceDTO.getImage()%></td>
                                    <td class="action-container">
                                        <a href="UpdateBonusService?serviceID=<%=  serviceDTO.getServiceID()%>" class="btn btn-warning btn-updatebtn-sm">Update</a>
                                        <form action="DeleteBonusServiceSevlet" onsubmit="return confirm('Are you sure you want to delete this Service?');">
                                            <input type="hidden" name="serviceID" value="<%=  serviceDTO.getServiceID()%>">  
                                            <button type="submit" class="btn btn-outline-danger .btnDeltete m-2">Delete</button>
                                        </form>
                                    </td>

                                </tr>
                                <%
                                        }
                                    }
                                %>
                                <!-- ... other service rows ... -->
                            </tbody>
                        </table>
                        <div class="pagination"></div>

                        <script>
                            // Đặt biến global cho trang hiện tại và số lượng sản phẩm trên mỗi trang
                            let thisPage = 1;
                            let limit = 5; // Đổi số lượng sản phẩm trên mỗi trang tại đây

                            // Hàm loadItem() sẽ hiển thị các dịch vụ tương ứng với trang hiện tại
                            function loadItem() {
                            // Tính chỉ số bắt đầu và kết thúc của dịch vụ trên trang này
                            let beginGet = limit * (thisPage - 1);
                            let endGet = limit * thisPage - 1;
                            // Lấy tất cả các dịch vụ từ bảng
                            let services = document.querySelectorAll('.table tbody tr');
                            // Duyệt qua tất cả các dịch vụ và ẩn hoặc hiển thị chúng dựa trên trang hiện tại
                            services.forEach((service, index) => {
                            if (index >= beginGet && index <= endGet) {
                            service.style.display = 'table-row';
                            } else {
                            service.style.display = 'none';
                            }
                            });
                            // Gọi hàm listPage() để cập nhật thanh phân trang
                            listPage();
                            }

                            // Gọi hàm loadItem() để hiển thị dịch vụ ban đầu
                            loadItem();
                            // Hàm listPage() sẽ tạo ra các nút phân trang
                            function listPage() {
                            // Lấy số lượng dịch vụ từ bảng
                            let totalServices = document.querySelectorAll('.table tbody tr').length;
                            // Tính tổng số trang dựa trên số lượng dịch vụ và giới hạn trên mỗi trang
                            let totalPages = Math.ceil(totalServices / limit);
                            // Lấy phần tử HTML để chứa thanh phân trang
                            let pagination = document.querySelector('.pagination');
                            pagination.innerHTML = ''; // Xóa nội dung cũ

                            // Tạo nút "PREV" nếu trang hiện tại không phải là trang đầu tiên
                            if (thisPage > 1) {
                            let prevButton = document.createElement('button');
                            prevButton.innerText = 'PREV';
                            prevButton.addEventListener('click', () => {
                            if (thisPage > 1) {
                            thisPage--;
                            loadItem();
                            }
                            });
                            pagination.appendChild(prevButton);
                            }

                            // Tạo nút cho mỗi trang
                            for (let i = 1; i <= totalPages; i++) {
                            let pageButton = document.createElement('button');
                            pageButton.innerText = i;
                            pageButton.addEventListener('click', () => {
                            thisPage = i;
                            loadItem();
                            });
                            pagination.appendChild(pageButton);
                            }

                            // Tạo nút "NEXT" nếu trang hiện tại không phải là trang cuối cùng
                            if (thisPage < totalPages) {
                            let nextButton = document.createElement('button');
                            nextButton.innerText = 'NEXT';
                            nextButton.addEventListener('click', () => {
                            if (thisPage < totalPages) {
                            thisPage++;
                            loadItem();
                            }
                            });
                            pagination.appendChild(nextButton);
                            }
                            }
                        </script>

                        <form action="./AddBonusServiceServlet">
                            <button class="btn btn-primary mb-3 btn-create">Create</button>
                        </form>

                    </div>
 <%session.removeAttribute("alert");%>

                    <!-- Bootstrap JS, Popper.js, and jQuery -->
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            </main>
        </div>
    </body>
</html>
