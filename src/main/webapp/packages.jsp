<%-- 
    Document   : packages
    Created on : Jan 19, 2024, 3:26:31 PM
    Author     : Le Huu Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wonderlands</title>
        <link rel="icon" href="image/img1.jpg"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/stylePackages.css"/>
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
                        <i class='bx bx-search' ></i>
                        <input type="text" name="txtSearchValue" placeholder="Type here to search"/>
                    </div>
                </header>
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
    </body>
</html>
