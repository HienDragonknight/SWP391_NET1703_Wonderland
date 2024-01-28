<%-- 
    Document   : location
    Created on : Jan 19, 2024, 3:37:17 PM
    Author     : Le Huu Huy
--%>


<%@page import="models.PackageDTO"%>
<%@page import="models.ThemeDTO"%>
<%@page import="models.BonusServiceDTO"%>
<%@page import="models.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="models.LocationDTO"%>

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

            .container-location-products {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 40px;
            }

            .container-location-products button {
                padding: 13px;
                border-radius: 50px;
                background-color: #5773ff;
                border: none;
            }

            .container-location-products button a {
                font-weight: bold;
                color: #fff;
            }

            .location-product {
                padding: 10px 0px 20px 0px;
                width: 100%;
                border-bottom: 1px solid grey;
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

            .bx bx-user
            {
                width: 20px;
            }

            /*            .container intro
                        {
                            display: flex;
                        }*/

            .intro-content p:first-child
            {
                color: red;
            }



            .intro-wrapper
            {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .intro-content, .intro-image
            {
                width: 50%;
            }

            .intro-image img{
                position: relative;
                left: 30%;
            }

            .intro-text p{
                width: 60%;
                padding-bottom: 10px;
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

            #title-page
            {
                padding-bottom: 10px;
                font-family: cursive;
            }


            .page-main-fullwidth
            {
                display: flex;
                flex-direction: column;
                justify-content:center;
                align-items: center;
            }

            /*            .usp-rows
                        {
                            display: grid;
                            grid-row: 1fr 1fr ;
                        }*/

            .flex-nowrap
            {
                display: flex;
                justify-content: space-between;
            }

            .usp-content-item .text-center{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }



            h3
            {
                text-align: center;
            }


            .usp-content-item text-center col-4
            {
                padding:  20px;
                margin: 30px;
            }

            .row usp-content flex-nowrap
            {
                margin-bottom: 30px;
            }


            .heading-text
            {
                text-align: center;
                padding: 20px;
            }

            .heading-text span {
                color: blue;
                font-family: cursive;
            }



            #usp{
                width: 100%;
            }

            .usp-content-item text-center col-4 right
            {
                padding-left: 30px;
            }

            .row usp-content flex-nowrap
            {
                width: 90%;
            }


            .booking-form{
                background:     #fffff;
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
                    </div>

                    <%
                        }
                    %>
                </aside>
            </header>




            <main class="ads-content">
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

                    <div class="column-main">
                        <div class="add-ab">
                            <a href="home.jsp">Home</a><span> &#10095; Booking</span>
                        </div>


                        <h1 id="title-page" >Party Booking</h1>

                        <div class="slide-container">
                            <div class="slides">
                                <img src="image/cover1.jpg" alt="image #1" class="active"/>
                                <img src="image/cover2.jpg" alt="image #2"/>
                                <img src="image/cover3.jpg" alt="image #3"/>
                                <img src="image/cover4.png" alt="image #4"/>
                            </div>

                            <div class="buttons">
                                <span class="next">&#10095;</span>
                                <span class="prev">&#10094;</span>
                            </div>

                            <div class="dotsContainer">
                                <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                                <div class="dot" attr='1' onclick="switchImage(this)"></div>
                                <div class="dot" attr='2' onclick="switchImage(this)"></div>
                                <div class="dot" attr='3' onclick="switchImage(this)"></div>
                            </div>
                        </div>
                    </div>




                </div>

            </main>

            <div class="page-main-fullwidth">

                <section id="intro">

                    <div class="intro-wrapper">

                        <div class="intro-image">
                            <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/Best%20Party.png" alt="Best Party">
                        </div>
                        <div class="intro-content">
                            <div class="intro-text">
                                <p>
                                    Một sinh nhật thật ý nghĩa và đặc biệt để đánh dấu cột mốc quan trọng của các thiên thần nhỏ
                                    luôn là
                                    điều bố mẹ băn khoăn?
                                </p>
                                <p>
                                    Với sự đa dạng trong các gói tiệc sinh nhật, tiNi hứa hẹn sẽ mang đến cho các thiên thần nhỏ một
                                    bữa
                                    tiệc đầy bất ngờ và tràn ngập những khoảnh khắc đáng nhớ.
                                </p>
                            </div>
                            <button class="special-button btn btn-primary rounded-pill m-0">
                                <img class="special-button-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/birthday.png" alt="icon-birthday">
                                <span class="special-button-text">
                                    Liên hệ đặt tiệc
                                </span>
                            </button>
                        </div>
                    </div>


                </section>


                <section id="usp">

                    <div class="usp-heading">
                        <h2 class="heading-text">
                            <span class="heading-text-content">
                                Vì sao chọn đặt tiệc tại tiNi ?
                            </span>
                        </h2>
                    </div>

                    <div class="row usp-rows">

                        <div class="row usp-content flex-nowrap">
                            <div class="usp-content-item text-center col-4 right">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo1.png" alt="usp-1">
                                <div class="usp-content-item-text">
                                    <h3 class="usp-content-item-text-title text-pink">
                                        Vui chơi <br class="text-br"> không giới hạn
                                    </h3>
                                </div>
                            </div>

                            <div class="usp-content-item text-center col-4">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo2.png" alt="usp-1">
                                <div class="usp-content-item-text">
                                    <h3 class="usp-content-item-text-title text-yellow">
                                        Trang trí <br class="text-br"> xinh xắn
                                    </h3>
                                </div>
                            </div>

                            <div class="usp-content-item text-center col-4 left">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo3.png" alt="usp-1">
                                <div class="usp-content-item-text">
                                    <h3 class="usp-content-item-text-title text-green">
                                        Chương trình <br class="text-br"> tiệc vui nhộn
                                    </h3>
                                </div>
                            </div>
                        </div>

                        <div class="row usp-content flex-nowrap">
                            <div class="usp-content-item text-center col-4">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo4.png" alt="usp-1">
                                <div class="usp-content-item-text">
                                    <h3 class="usp-content-item-text-title text-green">
                                        Trò chơi <br class="text-br"> đa dạng
                                    </h3>
                                </div>
                            </div>
                            <div class="usp-content-item text-center col-4">
                                <img class="usp-content-item-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/usp-photo5.png" alt="usp-1">
                                <div class="usp-content-item-text">
                                    <h3 class="usp-content-item-text-title text-blue">
                                        Menu đa dạng <br class="text-br"> hấp dẫn
                                    </h3>
                                </div>
                            </div>
                        </div>

                    </div>

                </section>

                <!--
                               <section id="pricing">
                                   <div class="pricing">
                                       <div class="container">
                                           <div class="pricing-heading">
                                               <h2 class="heading-text">
                                                   <span class="heading-text-content">
                                                       Các gói tiệc tiNi
                                                   </span>
                                               </h2>
                                           </div>
                                           <div class="price-card-list">
                                               <div class="price-card border-blue">
                                                   <div class="price-card-image">
                                                       <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/juno-pricing.png" alt="price-card-1">
                                                   </div>
                                                   <div class="price-card-header bg-blue text-blue">
                                                       <div class="price-card-rank">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/basic-rank.png" alt="basic-rank">
                                                       </div>
                                                       <div class="price-card-price">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/199k.png" alt="249k">
                                                       </div>
                                                   </div>
                                                   <div class="price-card-body">
                                                       <ul class="price-card-contents text-blue">
                                                           <li class="price-card-content">
                                                               2 mẫu trang trí cơ bản
                                                           </li>
                                                           <li class="price-card-content">
                                                               Menu 3 món cơ bản
                                                           </li>
                                                           <li class="price-card-content">
                                                               Chương trình tiệc vui nhộn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Vui chơi không giới hạn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Áp dụng tại các trung tâm có giá vé: 60K-80K
                                                           </li>
                                                       </ul>
                                                   </div>
                                                   <div class="price-card-footer">
                                                       <a class="price-card-button bg-button-blue" data-info="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/juno-pricing-info.jpg">
                                                           <span class="fw-bold text-white">
                                                               Xem chi tiết
                                                           </span>
                                                       </a>
                                                   </div>
                                               </div>
                                               <div class="price-card border-pink">
                                                   <div class="price-card-image">
                                                       <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/tera-pricing.png" alt="price-card-2">
                                                   </div>
                                                   <div class="price-card-header bg-pink text-pink">
                                                       <div class="price-card-rank">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/standard-rank.png" alt="standard-rank">
                                                       </div>
                                                       <div class="price-card-price">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/279k.png" alt="299k">
                                                       </div>
                                                   </div>
                                                   <div class="price-card-body">
                                                       <ul class="price-card-contents text-pink">
                                                           <li class="price-card-content">
                                                               2 mẫu trang trí tiêu chuẩn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Menu 3 món ngon
                                                           </li>
                                                           <li class="price-card-content">
                                                               Chương trình tiệc vui nhộn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Vui chơi không giới hạn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Áp dụng tại các trung tâm có giá vé ngày thường từ 80K
                                                           </li>
                                                       </ul>
                                                   </div>
                                                   <div class="price-card-footer">
                                                       <a class="price-card-button bg-button-pink" data-info="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/tera-pricing-info.jpg">
                                                           <span class="fw-bold text-white">
                                                               Xem chi tiết
                                                           </span>
                                                       </a>
                                                   </div>
                                               </div>
                                               <div class="price-card border-yellow">
                                                   <div class="price-card-image">
                                                       <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/pica-pricing.png" alt="price-card-3">
                                                   </div>
                                                   <div class="price-card-header bg-yellow text-yellow">
                                                       <div class="price-card-rank">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/premium-rank.png" alt="premium-rank">
                                                       </div>
                                                       <div class="price-card-price">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/349k.png" alt="399k">
                                                       </div>
                                                   </div>
                                                   <div class="price-card-body">
                                                       <ul class="price-card-contents text-yellow">
                                                           <li class="price-card-content">
                                                               2 mẫu trang trí ĐẶC BIỆT
                                                           </li>
                                                           <li class="price-card-content">
                                                               Menu 4 món no nê
                                                           </li>
                                                           <li class="price-card-content">
                                                               Chương trình tiệc vui nhộn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Vui chơi không giới hạn
                                                           </li>
                                                           <li class="price-card-content">
                                                               Áp dụng tại các trung tâm có giá về ngày thường từ 80K
                                                           </li>
                                                           <li class="price-card-content">
                                                               Thẻ game hoặc tiNiSlime cho bé
                                                           </li>
                                                       </ul>
                                                   </div>
                                                   <div class="price-card-footer">
                                                       <a class="price-card-button bg-button-yellow" data-info="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/pica-pricing-info.jpg">
                                                           <span class="fw-bold text-white">
                                                               Xem chi tiết
                                                           </span>
                                                       </a>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="swiper-container price-card-list-mb swiper-initialized swiper-horizontal">
                                               <div class="swiper-wrapper" id="swiper-wrapper-9927a4922ee3ef910" aria-live="polite" style="transition-duration: 0ms;">
                                                   <div class="swiper-slide price-card border-blue">
                                                       <div class="price-card-header bg-blue text-blue">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/199k-juno.png" alt="price-card-3">
                                                       </div>
                                                       <div class="price-card-body">
                                                           <ul class="price-card-contents text-blue">
                                                               <li class="price-card-content">
                                                                   2 mẫu trang trí cơ bản
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Menu 3 món cơ bản
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Chương trình tiệc vui nhộn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Vui chơi không giới hạn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Áp dụng tại các trung tâm có giá vé: 60K-80K
                                                               </li>
                                                           </ul>
                                                       </div>
                                                       <div class="price-card-footer">
                                                           <a class="price-card-button bg-button-blue" data-info="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/juno-pricing-info.jpg">
                                                               <span class="fw-bold text-white">
                                                                   Xem chi tiết
                                                               </span>
                                                           </a>
                                                       </div>
                                                   </div>
                                                   <div class="swiper-slide price-card border-pink">
                                                       <div class="price-card-header bg-pink text-pink">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/279k-tera.png" alt="price-card-2">
                                                       </div>
                                                       <div class="price-card-body">
                                                           <ul class="price-card-contents text-pink">
                                                               <li class="price-card-content">
                                                                   2 mẫu trang trí tiêu chuẩn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Menu 3 món ngon
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Chương trình tiệc vui nhộn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Vui chơi không giới hạn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Áp dụng tại các trung tâm có giá vé ngày thường từ 80K
                                                               </li>
                                                           </ul>
                                                       </div>
                                                       <div class="price-card-footer">
                                                           <a class="price-card-button bg-button-pink" data-info="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/tera-pricing-info.jpg">
                                                               <span class="fw-bold text-white">
                                                                   Xem chi tiết
                                                               </span>
                                                           </a>
                                                       </div>
                                                   </div>
                                                   <div class="swiper-slide price-card border-yellow">
                                                       <div class="price-card-header bg-yellow text-yellow">
                                                           <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/349k-pica.png" alt="price-card-3">
                                                       </div>
                                                       <div class="price-card-body">
                                                           <ul class="price-card-contents text-yellow">
                                                               <li class="price-card-content">
                                                                   2 mẫu trang trí ĐẶC BIỆT
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Menu 4 món no nê
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Chương trình tiệc vui nhộn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Vui chơi không giới hạn
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Áp dụng tại các trung tâm có giá về ngày thường từ 80K
                                                               </li>
                                                               <li class="price-card-content">
                                                                   Thẻ game hoặc tiNiSlime cho bé
                                                               </li>
                                                           </ul>
                                                       </div>
                                                       <div class="price-card-footer">
                                                           <a class="price-card-button bg-button-yellow" data-info="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/pica-pricing-info.jpg">
                                                               <span class="fw-bold text-white">
                                                                   Xem chi tiết
                                                               </span>
                                                           </a>
                                                       </div>
                                                   </div>
                                               </div>
                                               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                                       </div>
                                   </div>
                               </section>
                               <section id="offer">
                                   <div class="offer">
                                       <div class="container">
                                           <div class="special-title">
                                               <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/shooting-star.png" alt="offer-title">
                                               <span class="special-title-text">
                                                   Ưu đãi cho gói tiệc sinh nhật
                                               </span>
                                           </div>
                                           <div class="offer-contents bg-green">
                                               <div class="offer-text">
                                                   <div class="offer-content">
                                                       <img class="offer-content-img" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/offer_badge1.png" alt="offer-1">
                                                       <li class="offer-content-text-item">
                                                           Áp dụng tiệc <br>
                                                           từ Thứ 2 - Thứ 5
                                                       </li>
                                                   </div>
                                                   <div class="offer-content">
                                                       <img class="offer-content-img" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/offer_badge2.png" alt="offer-2">
                                                       <ul class="offer-content-text">
                                                           <li class="offer-content-text-item">
                                                               Gold: giảm 3%
                                                           </li>
                                                           <li class="offer-content-text-item">
                                                               Diamond: giảm 5%
                                                           </li>
                                                       </ul>
                                                   </div>
                                               </div>
                                               <div class="offer-img">
                                                   <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/kilo-confetti.png" alt="offer-3">
                                               </div>
                                           </div>
                                           <div class="offer-button text-center">
                                               <button class="special-button btn btn-primary rounded-pill">
                                                   <img class="special-button-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/birthday.png" alt="icon-birthday">
                                                   <span class="special-button-text">
                                                       Liên hệ đặt tiệc
                                                   </span>
                                               </button>
                                           </div>
                                       </div>
                                   </div>
                               </section>
                               <section id="services">
                                   <div class="services">
                                       <div class="container">
                                           <div class="services-heading">
                                               <h2 class="heading-text">
                                                   <span class="heading-text-content">
                                                       Các dịch vụ đặc biệt
                                                   </span>
                                               </h2>
                                           </div>
                                           <div class="special-title">
                                               <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/color-wheel%201.png" alt="offer-title">
                                               <span class="special-title-text">
                                                   Trang trí trọn gói theo chủ đề
                                               </span>
                                           </div>
                                            add a block 
               
               
                                           THEMES
                                           <div class="services-themes">
                                               <div class="services-themes-list">
                                                   <div class="themes-title">
                                                       Chủ đề trang trí HOT
                                                   </div>
                                                   <div class="row">
                                                       <div class="col-lg-12 col-xl-6 services-themes-row">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(2).png" alt="theme-2">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(3).png" alt="theme-3">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(4).png" alt="theme-4">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(5).png" alt="theme-5">
                                                       </div>
                                                   </div>
                                                   <div class="row">
                                                       <div class="col-lg-12 col-xl-6 services-themes-row">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(6).png" alt="theme-6">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(7).png" alt="theme-7">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(8).png" alt="theme-8">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(9).png" alt="theme-9">
                                                       </div>
                                                   </div>
                                                   <div class="row">
                                                       <div class="col-lg-12 col-xl-6 services-themes-row">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(10).png" alt="theme-10">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(11).png" alt="theme-11">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(12).png" alt="theme-12">
                                                           <img class="services-themes-image col-3" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/services%20(13).png" alt="theme-13">
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
               
               
                                           BONUS SERVICE
                                           <div class="services-others">
                                               <div class="special-title">
                                                   <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/party%201.png" alt="others-services-title">
                                                   <span class="special-title-text">
                                                       Bonus Service
                                                   </span>
                                               </div>
                                               <div class="services-others-contents row">
                                                   <div class="row services-others-list">
               
                <%
                    List<BonusServiceDTO> bonusServiceList = (List<BonusServiceDTO>) request.getAttribute("BONUS_SERVICE_LIST");
                    if (bonusServiceList != null && bonusServiceList.size() > 0) {

                        int index = 1;
                        for (BonusServiceDTO bonuesService : bonusServiceList) {
                %>

                <div class="services-others-item col-3" id="<%= index++%>"  >
                    <img class="services-others-image" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/other-services%20(7).png" alt="others-1">
                    <div class="services-others-text">
                        <span class="services-others-text-content">
                <%= bonuesService.getServiceName()%>
            </span>
        </div>
    </div>

                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>








    <div class="services-desc">
        Vui lòng liên hệ nhân viên tiNi để được tư vấn các dịch vụ đặc biệt
    </div>
    <div class="text-center">
        <button class="services-button special-button btn btn-primary rounded-pill">
            <img class="special-button-icon" src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/birthday.png" alt="icon-birthday">
            <span class="special-button-text">
                Liên hệ tư vấn và đặt tiệc
            </span>
        </button>
    </div>
</div>
</div>
</section>
<section id="gallery">
<div class="gallery">
<div class="container">
    <div class="gallery-heading">
        <h2 class="heading-text">
            <span class="heading-text-content">
                Lưu giữ cột mốc tuổi thơ
            </span>
        </h2>
    </div>
    <div class="gallery-video text-center">
        <iframe class="gallery-video-iframe" width="1240" height="690" src="https://www.youtube.com/embed/npa-6xyvdJ 4" title="tiNiWorld - Tròn 10 Năm Tuổi, Trọn Tuổi Thơ Vui" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
    </div>
    <div class="gallery-images">
        <div class="row">
            <div class="grid-row">
                <div class="grid-column grid-column-large">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-1.png" alt="Image 1">
                </div>
                <div class="grid-column">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-3.png" alt="Image 3">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-4.png" alt="Image 4">
                </div>
                <div class="grid-column">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-2.png" alt="Image 2">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-5.png" alt="Image 5">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="grid-row">
                <div class="grid-column">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-6.png" alt="Image 6">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-7.png" alt="Image 7">
                </div>

                <div class="grid-column grid-column-large">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-8.png" alt="Image 8">
                </div>

                <div class="grid-column">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-9.png" alt="Image 9">
                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/gallery-10.png" alt="Image 10">
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</section>



                -->
                <section id="booking-form">
                    <div class="booking-form">
                        <div class="container">
                            <div>
                                <h2 class="heading-text booking-form-heading">
                                    <span class="heading-text-content">
                                        liên hệ đặt tiệc
                                    </span>
                                </h2>
                            </div>
                            <div class="phone-badge-text">
                                <a href="tel:+841900636328" class="phone-badge-text-content">
                                    <img src="https://tiniworld.com/static/version1699082497/frontend/Magenest/tiniworld/vi_VN/Magenest_Custom/images/phone.png" alt="phone-icon">
                                    1900 63 63 28
                                </a>
                            </div>
                            <div class="form-heading">
                                <div class="form-heading-title text-blue">
                                    Gửi thông tin tư vấn
                                </div>
                                <div class="form-desc">
                                    Xin vui lòng để lại thông tin của quý khách, nhân viên tiNi sẽ liên hệ lại trong vòng 24h.
                                </div>
                            </div>

                            <form class="form-booking" id="form" method="post" action="https://tiniworld.com/custom/api/bookbirthday/">
                                <div id="alert"></div>

                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="form-info">
                                            <label class="form-title text-pink">
                                                Thông tin phụ huynh
                                            </label>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="parent_name">
                                                    Họ và tên
                                                </label>
                                                <input class="form-input form-control" type="text" id="parent_name" name="parent_name" placeholder="Họ và tên">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="phone">
                                                    Số điện thoại
                                                </label>
                                                <input class="form-input form-control" type="text" id="phone" name="phone" placeholder="Số điện thoại">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="email">
                                                    Email
                                                </label>
                                                <input class="form-input form-control" type="text" id="email" name="email" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-info">
                                            <label class="form-title text-pink">
                                                Thông tin của bé
                                            </label>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="kid_name">
                                                    Họ và tên
                                                </label>
                                                <input class="form-input form-control" type="text" id="kid_name" name="kid_name" placeholder="Họ và tên">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="kid_birthday">
                                                    Ngày sinh
                                                </label>
                                                <input class="form-input form-control" type="date" id="kid_birthday" name="kid_birthday" placeholder="Ngày sinh">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="center">
                                                    Giới tính
                                                </label>
                                                <div class="mb-3 d-flex justify-content-start align-items-center gap-3">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="gender" id="male">
                                                        <label class="form-check-label" for="male">
                                                            Bé trai
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="gender" id="female" checked="">
                                                        <label class="form-check-label" for="female">
                                                            Bé gái
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-12 col-md-6">
                                        <div class="form-info">
                                            <label class="form-title text-pink">
                                                Thông tin đặt tiệc
                                            </label>

                                            <div class="mb-3">
                                                <label class="form-label text-blue">
                                                    Trung tâm WonderLand
                                                </label>
                                                <select class="form-select-input form-control"  name="location_option">   
                                                    <%
                                                        List<LocationDTO> locationList = (List<LocationDTO>) request.getAttribute("LIST_LOCATION");
                                                        if (locationList != null && locationList.size() > 0) {

                                                            //                                                                    int index = 1;
                                                            for (LocationDTO location : locationList) {

                                                    %>
                                                    <option value="<%= location.getLocationID()%>"> <%= location.getLocationDetails()%> </option>

                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                                <input type="hidden" id="center_name" name="location_id">
                                            </div>


                                            <div class="mb-3">
                                                <label class="form-label text-blue">
                                                    Thời gian tổ chức
                                                </label>
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6 mb-3 mb-md-0">
                                                        <input class="form-input form-control" type="date" id="date" name="date" placeholder="Ngày tổ chức">
                                                    </div>
                                                    <div class="col-sm-12 col-md-6 mb-sm-3 mb-md-0">
                                                        <input class="form-input form-control" type="time" id="time" name="time" placeholder="Giờ tổ chức">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="number_of_passengers">
                                                    Số lượng bé tham dự
                                                </label>
                                                <input class="form-input form-control" type="number" id="number_of_passengers" name="number_of_passengers" placeholder="Số lượng bé tham dự">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="package">
                                                    Gói tiệc (tùy chọn)
                                                </label>
                                                <select class="form-select-input form-control" id="package" name="packageType">
                                                    <%
                                                        List<PackageDTO> packageList = (List<PackageDTO>) request.getAttribute("PACKAGE_LIST");
                                                        if (packageList != null && packageList.size() > 0) {

                                                            int index = 1;
                                                            for (PackageDTO packageIndex : packageList) {
                                                    %>
                                                    <option value="<%= packageIndex.getPakageID()%>"> <%= packageIndex.getPakageName()%> </option>

                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label text-blue" for="theme">
                                                    Chủ đề trang trí (tùy chọn)
                                                </label>
                                                <select class="form-select-input form-control" id="theme" name="theme">

                                                    <%
                                                        List<ThemeDTO> themeList = (List<ThemeDTO>) request.getAttribute("THEME_LIST");
                                                        if (themeList != null && themeList.size() > 0) {

                                                            int index = 1;
                                                            for (ThemeDTO theme : themeList) {
                                                    %>
                                                    <option value="<%= theme.getThemeID()%>"> <%= theme.getThemeName()%> </option>

                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-footer">
                                        <button class="form-button bg-button-blue m-auto" type="submit">
                                            Gửi ngay
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>


            </div>
        </div>

        <script src="js/slider.js"></script>
    </body>

</html>
