<%@page import="models.UserDTO"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Payment Receipt</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

        <style type="text/css">
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

            table
            {
                border: 0;
                background-color: #F9F9F9;
                width: 50%;
                padding: 20px 50px;
                border-radius: 50px;
            }

            table td {
                padding: 10px 0px;
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
            
            .payment-success{
                padding: 85px 0px;
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
                            <a href="#">Sign Up</a>
                        </div>
                        <div>

                            <form class="d-flex">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    Cart
                                    <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                                </button>
                            </form>
                        </div>

                        <%
                        } else {
                        %>


                        <div class="logined" id="nickname">
                            <i class='bx bx-user-circle'></i>
                            <a href="ViewUserServlet">${sessionScope.USER_INFO.fullName}</a>
                        </div>

                        <div>
                            <form class="d-flex">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    Cart
                                    <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                                </button>
                            </form>
                        </div>


                    </div>
                    <%   }
                    %>

                </aside>
            </header>

            <div class="payment-success" align="center">
                <h1>Payment Done. Thank you for purchasing our products</h1>
                <table >

                    <tr>
                        <td>Merchant</td>
                        <td> ${requestScope.TRANSACTION.description} </td>
                    </tr>
                    <tr>
                        <td>Payer</td>
                        <td> ${requestScope.PAYER.firstName} ${requestScope.PAYER.lastName} </td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td> ${requestScope.TRANSACTION.description} </td>
                    </tr>
                    <tr>
                        <td>Subtotal</td>
                        <td> ${requestScope.TRANSACTION.amount.details.subtotal} </td>
                    </tr>               
                    <tr>
                        <td>Total</td>
                        <td> ${requestScope.TRANSACTION.amount.total} </td>
                    </tr>

                </table>

                </form>
            </div>
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

        <script>

            // Check if localStorage is supported by the browser
            if (typeof (Storage) !== "undefined") {
                // Remove item with key "packageInfo"
                localStorage.removeItem("packageInfo");
                console.log("Item with key 'packageInfo' removed from localStorage.");
            } else {
                console.log("Sorry, your browser does not support web storage...");
            }

        </script>
    </body>
</html>
