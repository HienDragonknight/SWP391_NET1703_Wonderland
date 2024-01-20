<%-- 
    Document   : home
    Created on : Jan 20, 2024, 11:02:52 AM
    Author     : Le Huu Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wonderlands</title>
        <link rel="icon" href="image/LogoTron.png"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <div class="logo">
                    <img src="image/LogoCN.png" width="217" height="38" alt="img2"/>
                </div>

                <div class="menu">
                    <ul class="menu-ic">
                        <li>
                            <i class='bx bx-home-alt-2' ></i>
                            <a href="home.jsp">Home</a>
                        </li>
                        <li>
                            <i class='bx bx-location-plus' ></i>
                            <a href="location.jsp">Location</a>
                        </li>
                        <li>
                            <i class='bx bx-package' ></i>
                            <a href="packages.jsp">Packages</a>
                        </li>
                        <li>
                            <i class='bx bx-bell'></i>
                            <a href="#">Sale</a>
                        </li>
                        <li>
                            <i class='bx bx-party' ></i>
                            <a href="#">Order Party</a>
                        </li>
                        <li>
                            <i class='bx bx-info-circle' ></i>
                            <a href="#">About Us</a>
                        </li>
                    </ul>
                </div>
            </aside>

            <main>
                <header>
                    <div class="nav-link">
                        <button class="menu-btn" id="menu-open" style="height: 30px">
                            <i class='bx bx-menu'></i>
                        </button>
                        <img src="image/LogoCN.png" width="217" height="90" alt="LogoCN"/>
                    </div>

                    <div class="search">
                        <form action="SearchServlet">
                            <i class='bx bx-search' ></i>
                            <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" placeholder="Type here to search"/>
                        </form>
                    </div>
                </header>

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

            </main>

            <div class="right-section">
                <div class="profile">
                    <div class="login">
                        <i class='bx bx-user'></i>
                        <a href="#">Login</a>
                    </div>
                    <span>/</span>
                    <div class="login">
                        <i class='bx bx-lock-alt' ></i>
                        <a href="#"> Sign Up</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/slider.js"></script>
    </body>
</html>
