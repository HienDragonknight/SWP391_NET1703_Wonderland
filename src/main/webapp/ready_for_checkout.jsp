

<%@page import="models.ThemeDTO"%>
<%@page import="models.BonusServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="models.LocationDTO"%>
<%@page import="models.PackageDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Shop Item - Start Bootstrap Template</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="cs/style.css" rel="stylesheet" />
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


            .checkout-container
            {
                display: flex;
                justify-content: space-evenly;

            }


        </style>
    </head>
    <body>

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

                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill" >0</span>
                        </button>
                    </form>
                </div>

            </aside>
        </header>


        <section>
            <div class="column-content">
                <div class="add-ab">
                    <a href="home.jsp">Home</a><span> &#10095; Booking</span>
                </div>

                <h1>Party Booking</h1>


                <div class="column">

                    <div class="checkout-container">

                        <div class="order-info">
                            <div class="order-info-block" >
                                <span class="order-info-title">Order Information</span>
                            </div>

                            <div class="content minicart-items" data-role="content">
                                <div class="minicart-items-wrapper">



                                    <div class="product">

                                        <span class="product-image-container"  style="height: 97px; width: 97px;">
                                            <span class="product-image-wrapper">
                                                <img src="image/packages/package_1.png" width="160" height="200" alt="TINIWORLD LOTTE TÂY HỒ" title="TINIWORLD LOTTE TÂY HỒ">
                                            </span>
                                        </span>

                                        <div class="product-item-details">

                                            <div class="product-item-inner">
                                                <div class="product-item-name-block">
                                                    <strong class="product-item-name" data-bind="html: getNameUnsanitizedHtml($parent)">WONDERLAND CITY</strong>
                                                    <div class="product options">
                                                        <div class="content">

                                                        </div>
                                                    </div>
                                                    <div class="details-qty">
                                                        <span class="number_of_children">0</span>
                                                    </div>
                                                </div>

                                                <div class="subtotal">


                                                    <span class="cart-price">
                                                        <span class="price">120.000&nbsp;₫</span>
                                                    </span>

                                                </div>

                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>


                            <div class="order-info-subtotal">
                                <span class="subtotal-text" >Price</span>
                                <span class="subtotal-price" >500</span>
                            </div>

                            <div class="block-summary-content">
                                <tbody>
                                    <tr class="totals sub">
                                        <th data-bind="i18n: 'Provisional'" class="mark" scope="row">Tạm tính</th>
                                        <td class="amount">
                                            <span class="price" data-bind="text: getValue(), attr: {'data-th': title}" data-th="Tổng cộng">150.000&nbsp;₫</span>
                                        </td>
                                    </tr> <br>

                                <tr class="totals shipping excl">
                                    <th class="mark" scope="row">
                                        <span class="label" data-bind="i18n: 'Transport fee'">Discount</span>

                                        <span class="value" data-bind="text: getShippingMethodTitle()">50</span>
                                    </th>
                                    <td class="amount">

                                        <span class="price" data-bind="text: getValue(), attr: {'data-th': title}" data-th="Vận chuyển">0&nbsp;₫</span>

                                    </td>
                                </tr>  <br>

                                <tr class="grand totals">
                                    <th class="mark" scope="row">
                                        <strong data-bind="i18n: 'Total'">Tổng cộng</strong>
                                    </th>
                                    <td data-bind="attr: {'data-th': title}" class="amount" data-th="Tổng đơn đặt hàng">
                                        <strong><span class="price" data-bind="text: getValue()">150.000&nbsp;₫</span></strong>
                                    </td>
                                </tr>
                                </tbody>

                            </div>

                        </div>



                        <div class="customer-info">
                            <div class="customer-info-block" >
                                <span class="customer-info-title">Customer Information</span>
                            </div>

                            <div class="checkout-login" data-bind="visible: !window.isCustomerLoggedIn">
                                <span data-bind="i18n: 'Have an account?'">Have an account?</span>
                                <a class="login action"  href="login.jsp">Login</a>
                            </div>


                            <div class="customer-info-details" >

                                <form action="#" method="POST">
                                    <div class="control"">

                                        <input class="input-text" type="text"  name="fullName" placeholder="Họ và Tên"><br>
                                        <input class="input-text" type="email"  name="email" placeholder="Email"><br>
                                        <input class="input-text" type="tel"  name="phone" placeholder="Phone"><br>
                                        <textarea class="input-text" id="order-note" name="description" rows="5" maxlength="200" placeholder="Note (optional)" style=""></textarea><br>
                                        <button  type="submit" class="button action continue primary">
                                            <span>Payment</span>
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>


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


    <script >

        function updateCartCount()
        {
            var packgeInfo = localStorage.getItem("packageInfo");

            if (packgeInfo !== null)
            {
                var localStorageLength = localStorage.length;
                if (localStorageLength !== 0)
                {
                    document.getElementById("numsOfCart").innerHTML = localStorageLength;
                } else
                {
                    document.getElementById("numsOfCart").innerHTML = 0;
                }
            }
        }

        updateCartCount();


        
        function updateOrderInfomation()
        {
            
        }


    </script>

</body>
</html>
