<%-- 
    Document   : about
    Created on : Jan 22, 2024, 1:04:05 PM
    Author     : Le Huu Huy
--%>

<%@page import="models.UserDTO"%>
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
                margin-bottom: 20px;
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

            .column-main {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .column-main-image {
                width: 100%;
            }

            .column-main-image img {
                width: 100%;
                border-radius: 20px;
            }

            .intro-wrapper {
                display: flex;
                flex-direction: column;
                gap: 30px;
            }

            .intro-text {
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding-left: 270px;
                padding-right: 270px;
                gap: 10px;
            }

            .intro-text p {
                color: #565656;
                font-size: 15px;
            }

            .intro-text-main {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .intro-text-column {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 20px;
                margin-bottom: 20px;
            }

            .intro-text-column p {
                text-align: center;
                font-size: 15px;
                color: #1b2d5a;
                padding-left: 250px;
                padding-right: 250px;
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
        <!--Use the below code snippet to provide real time updates to the live chat plugin without the need of copying and paste each time to your website when changes are made via PBX-->
    <call-us-selector phonesystem-url="https://1111.3cx.cloud" party="wonderland"></call-us-selector>
    <script defer src="https://downloads-global.3cx.com/downloads/livechatandtalk/v1/callus.js" id="tcx-callus-js" charset="utf-8"></script>
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

                <div class="column-main">
                    <div class="add-ab">
                        <a href="home.jsp">Home</a><span> &#10095; About Us</span>
                    </div>

                    <h1>About Wonderlands</h1>

                    <div class="column-main-image">
                        <img src="image/cover1.jpg" alt="cover1"/>
                    </div>
                </div>

                <div class="intro-wrapper">
                    <div class="intro-text">
                        <div class="intro-text-main">
                            <i class='bx bx-history'></i>
                            <h3>History begin</h3>
                        </div>
                        <p>
                            EDUCATION + ENTERTAINMENT = “EDUCATION – INTELLIGENCE”
                        </p>
                        <p>
                            Wonderlands was founded in September 2009, and is a pioneer in developing "Education - Wisdom" centers for children aged 0-12 in Vietnam. With the mission: "Creating a safe, healthy, fun, international and community environment for all children to come play, learn and develop according to the Education - Wisdom method", Wonderlands has continuously pioneered and developed the "EDUCATION – INTELLIGENCE" Playground chain system to serve and meet the increasing entertainment needs of children and parents.
                        </p>
                        <p>
                            The system of Wonderlands centers stretches everywhere in Vietnam, in key cities Ho Chi Minh, Binh Duong, Hanoi and other large cities such as Can Tho, Vung Tau, Buon Me Thuot...
                        </p>
                        <p>
                            With expertise, many years of experience, and a deep understanding of children, Wonderlands recognizes that the best way for children to learn knowledge and early life experiences is through fun activities. and interact with the world around them.
                        </p>
                        <p>
                            Wonderlands brings peace of mind to parents and schools by creating a fun, safe and highly communal environment for children.
                        </p>
                    </div>

                    <div class="intro-text">
                        <div class="intro-text-main">
                            <i class='bx bx-palette' ></i>
                            <h3>Educational and entertainment value</h3>
                        </div>
                        <p>
                            From knowledge and experience in the field of activities for children, Wonderlands believes that, in the early stages of life, children need to comprehensively develop necessary skills.
                        </p>
                        <p>
                            Wonderlands's mission is through activities and programs to help children perfect the 5 elements necessary for comprehensive development: Intelligence / cognition, Emotions / social relationships, Talents / arts, Physical fitness. Physical/motor, Language/communication.
                        </p>
                    </div>

                    <div class="intro-text">
                        <div class="intro-text-main">
                            <i class='bx bx-shield' ></i>
                            <h3>Service quality</h3>
                        </div>
                        <div class="intro-text-column">
                            <img src="https://tiniworld.com/media/wysiwyg/Group_2083.png"/>
                            <h4>FOCUS ON CUSTOMER EXPERIENCE</h4>
                            <p>
                                Wonderlands always prioritizes and puts customer experience first,
                                especially the experience of children.
                                The play corners are always designed to be familiar and close to home,
                                so that children can have the most fun and comfortable time when they come to play Wonderlands again.
                                In addition, toy items at Wonderlands are always updated with the latest designs,
                                quickly catching up with market trends.
                            </p>
                        </div>
                        <div class="intro-text-column">
                            <img src="https://tiniworld.com/media/wysiwyg/Group_2084.png"/>
                            <h4>SAFETY AND HYGIENE STANDARDS</h4>
                            <p>
                                At Wonderlands, parents will always feel secure about the quality of hygiene and safety for their children. Play corners and objects are always cleaned every day, ensuring antibacterial properties to prevent the risk of infection.
                            </p>
                        </div>
                        <div class="intro-text-column">
                            <img src="https://tiniworld.com/media/wysiwyg/Group_2085.png"/>
                            <h4>SAFETY AND HYGIENE STANDARDS</h4>
                            <p>
                                Staff at Wonderlands are always encouraged to play and talk with children to stimulate their ability to communicate and integrate into the community. In addition, all employees participate in training classes on caring for and understanding children's psychology, to bring smiles to every child who comes to Wonderlands.
                            </p>
                        </div>
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
            
            <%
                if (session.getAttribute("USER_INFO") != null && dto.getRoleID().equals("2")) {
            %>
            <a href="ViewUserServlet">
                <img src="image/${sessionScope.USER_INFO.avatar}"/>
                ${sessionScope.USER_INFO.fullName}
            </a>
            <%
            } else if (dto.getRoleID().equals("1")) {
            %>
            <a href="customer.jsp">
                <img src="image/${sessionScope.USER_INFO.avatar}"/>
                ${sessionScope.USER_INFO.fullName}
            </a>
            <%
            } else {
            %>
            <a href="PartyHostServlet">
                <img src="image/${sessionScope.USER_INFO.avatar}"/>
                ${sessionScope.USER_INFO.fullName}
            </a>
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

        <div class="column-main">
            <div class="add-ab">
                <a href="home.jsp">Home</a><span> &#10095; About Us</span>
            </div>

            <h1>About Wonderlands</h1>

            <div class="column-main-image">
                <img src="image/cover1.jpg" alt="cover1"/>
            </div>
        </div>
    </div>

    <div class="intro-wrapper">
        <div class="intro-text">
            <div class="intro-text-main">
                <i class='bx bx-history'></i>
                <h3>History begin</h3>
            </div>
            <p>
                EDUCATION + ENTERTAINMENT = “EDUCATION – INTELLIGENCE”
            </p>
            <p>
                Wonderlands was founded in September 2009, and is a pioneer in developing "Education - Wisdom" centers for children aged 0-12 in Vietnam. With the mission: "Creating a safe, healthy, fun, international and community environment for all children to come play, learn and develop according to the Education - Wisdom method", Wonderlands has continuously pioneered and developed the "EDUCATION – INTELLIGENCE" Playground chain system to serve and meet the increasing entertainment needs of children and parents.
            </p>
            <p>
                The system of Wonderlands centers stretches everywhere in Vietnam, in key cities Ho Chi Minh, Binh Duong, Hanoi and other large cities such as Can Tho, Vung Tau, Buon Me Thuot...
            </p>
            <p>
                With expertise, many years of experience, and a deep understanding of children, Wonderlands recognizes that the best way for children to learn knowledge and early life experiences is through fun activities. and interact with the world around them.
            </p>
            <p>
                Wonderlands brings peace of mind to parents and schools by creating a fun, safe and highly communal environment for children.
            </p>
        </div>

        <div class="intro-text">
            <div class="intro-text-main">
                <i class='bx bx-palette' ></i>
                <h3>Educational and entertainment value</h3>
            </div>
            <p>
                From knowledge and experience in the field of activities for children, Wonderlands believes that, in the early stages of life, children need to comprehensively develop necessary skills.
            </p>
            <p>
                Wonderlands's mission is through activities and programs to help children perfect the 5 elements necessary for comprehensive development: Intelligence / cognition, Emotions / social relationships, Talents / arts, Physical fitness. Physical/motor, Language/communication.
            </p>
        </div>

        <div class="intro-text">
            <div class="intro-text-main">
                <i class='bx bx-shield' ></i>
                <h3>Service quality</h3>
            </div>
            <div class="intro-text-column">
                <img src="https://tiniworld.com/media/wysiwyg/Group_2083.png"/>
                <h4>FOCUS ON CUSTOMER EXPERIENCE</h4>
                <p>
                    Wonderlands always prioritizes and puts customer experience first,
                    especially the experience of children.
                    The play corners are always designed to be familiar and close to home,
                    so that children can have the most fun and comfortable time when they come to play Wonderlands again.
                    In addition, toy items at Wonderlands are always updated with the latest designs,
                    quickly catching up with market trends.
                </p>
            </div>
            <div class="intro-text-column">
                <img src="https://tiniworld.com/media/wysiwyg/Group_2084.png"/>
                <h4>SAFETY AND HYGIENE STANDARDS</h4>
                <p>
                    At Wonderlands, parents will always feel secure about the quality of hygiene and safety for their children. Play corners and objects are always cleaned every day, ensuring antibacterial properties to prevent the risk of infection.
                </p>
            </div>
            <div class="intro-text-column">
                <img src="https://tiniworld.com/media/wysiwyg/Group_2085.png"/>
                <h4>SAFETY AND HYGIENE STANDARDS</h4>
                <p>
                    Staff at Wonderlands are always encouraged to play and talk with children to stimulate their ability to communicate and integrate into the community. In addition, all employees participate in training classes on caring for and understanding children's psychology, to bring smiles to every child who comes to Wonderlands.
                </p>
            </div>
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
