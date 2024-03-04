<%-- 
    Document   : package_item
    Created on : Jan 30, 2024, 10:20:55 PM
    Author     : bao.kun
--%>

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
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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




            .model {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: 200ms ease-in-out;
                border: 1px solid black;
                border-radius: 10px;
                z-index: 10;
                background-color: white;
                width: 500px;
                max-width: 80%;
            }

            .model.active {
                transform: translate(-50%, -50%) scale(1);
            }

            .model-header {
                padding: 10px 15px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid black;
            }

            .model-header .title {
                font-size: 1.25rem;
                font-weight: bold;
            }

            .model-header .close-button {
                cursor: pointer;
                border: none;
                outline: none;
                background: none;
                font-size: 1.25rem;
                font-weight: bold;
            }

            .model-body {
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





            div.elem-group {
                margin: 20px 0;
                display: flex;
            }

            div.elem-group.inlined {
                width: 49%;
                display: inline-block;
                float: left;
                margin: 3% 0;

            }

            label {
                display: block;
                font-family: 'Nanum Gothic';
                padding-bottom: 10px;
                font-size: 1.25em;
            }

            input, select, textarea {
                border-radius: 2px;
                border: 2px solid #777;
                box-sizing: border-box;
                font-size: 1.25em;
                font-family: 'Nanum Gothic';
                width: 100%;
                padding: 10px;
            }

            div.elem-group.inlined input {
                width: 95%;
                display: inline-block;
            }
            div.elem-group.inlined select {
                padding: 6.68px;
                display: inline-block;
            }

            textarea {
                height: 250px;
            }

            hr {
                border: 1px dotted #ccc;
            }

            #checkout{
                height: 50px;
                background: #3498db;
                border: none;
                color: white;
                font-size: 1.25em;
                font-family: 'Nunito','Helvetica Neue',Helvetica,Arial,sans-serif;
                border-radius: 4px;
                cursor: pointer;
                width: 40%;

                font-weight: 700;
                text-align: center;
                letter-spacing: .05em;
                text-transform: uppercase;
                color: #fff;
                border-radius: 18px;
            }
            #checkout:hover
            {
                background-color: #2980b9;
            }


            button:hover {
                border: 2px solid black;
            }

            .model-body
            {

                justify-items: center;
                align-items: center;
            }

            #checkout-class
            {
                text-align: center;
                margin-bottom: 10px;
            }

            #theme-selection{
                height: 54px;
            }

            #childrenNums
            {
                padding: 2%;
            }
            .container .column {
                display: grid;
                grid-template-columns: 1fr 5fr 1fr;
            }
            .menu-ic {
                list-style: none;
                display: flex;
                flex-direction: column;
                padding: 10px 50px;
            }
            .py-5 {
                display: flex;
                justify-content: flex-start;
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
                gap: 6px;
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
            header .side-bar .search-bar {
                position: relative;
                display: flex;
                width: 30%;
                padding: 5px;
                border-radius: 250px;
                border: 1px solid #919191;
                border-color: #5773ff;
            }
        </style>
    </head>
    <body>
        <!--Use the below code snippet to provide real time updates to the live chat plugin without the need of copying and paste each time to your website when changes are made via PBX-->
    <call-us-selector phonesystem-url="https://1111.3cx.cloud" party="wonderland"></call-us-selector>
    <script defer src="https://downloads-global.3cx.com/downloads/livechatandtalk/v1/callus.js" id="tcx-callus-js" charset="utf-8"></script>
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
                        <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>


        </aside>
    </header>


    <%
        PackageDTO packageDTO = (PackageDTO) request.getAttribute("PACKGE_ITEM");
        List<LocationDTO> locationList = (List< LocationDTO>) request.getAttribute("LOCATION_LIST");
        List<BonusServiceDTO> bonusServiceList = (List<BonusServiceDTO>) request.getAttribute("BONUS_SERVICE_LIST");
        List<ThemeDTO> themeList = (List<ThemeDTO>) request.getAttribute("THEME_LIST");

        if (packageDTO != null && locationList != null && bonusServiceList != null && themeList != null) {
    %>

    <!-- Product section-->
    <section class="py-5">
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
                    <a href="service.jsp">Service</a>
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
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">

                <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" style="width: 80%; height: 80%"  src="image/packages/<%= packageDTO.getImage()%>" alt="package image" /></div>
                <div class="col-md-6">

                    <div class="small mb-1">

                    </div>
                    <h1 class="display-5 fw-bolder"><%= packageDTO.getPackageName()%></h1>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-line-through" id="price-unit-original">$<%= packageDTO.getUnitPrice()%></span>
                        <span style="color: blue;" id="price-unit-discounted" >$<%= packageDTO.getUnitPrice() * 0.8%></span>
                        <input type="hidden" id="packageID" value="<%= packageDTO.getPackageID()%>" >
                    </div>

                    <p class="lead"><%= packageDTO.getDescription() + "\nThis is details"%></p>


                    <button data-model-target="#model" class="btn btn-outline-dark flex-shrink-0" >
                        <i class="bi-cart-fill me-1"></i>
                        Booking now
                    </button>



                    <div class="model" id="model">
                        <div class="model-header">
                            <div class="title">Booking Party</div>
                            <button data-close-button class="close-button">&times;</button>
                        </div>

                        <div class="model-body">

                            <form action="ready_for_checkout.jsp" method="post">

                                <div class="elem-group">
                                    <div class="full-lined">
                                        <label>Center</label>
                                        <select id="center-selection" name="location" required>
                                            <option value="">Choose your location</option>
                                            <%
                                                for (LocationDTO location : locationList) {
                                            %>                                          

                                            <option value="<%= location.getLocationID() + "-" + location.getLocationDetails()%>"> <%= location.getLocationDetails()%> </option>                                           
                                            <%                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="elem-group">
                                    <div class="elem-group inlined">
                                        <label for="checkin-date">Date</label>
                                        <input type="date" id="checkin-date" name="checkin-date"  required>
                                    </div> 
                                    <div class="elem-group inlined">
                                        <label for="checkin-time">Time</label>
                                        <input type="time" id="checkin-time"  name="checkin-time" required>
                                    </div>
                                </div>                                       

                                <div class="elem-group">
                                    <div class="elem-group inlined">
                                        <label>Attended children</label>
                                        <input type="number" id="childrenNums" name="children"  min="0" required>
                                    </div>

                                    <div class="elem-group inlined">
                                        <label>Theme</label>
                                        <select id="theme" name="theme" required>
                                            <option value="">Choose a Theme</option>
                                            <%
                                                for (ThemeDTO theme : themeList) {
                                            %>
                                            <option value="<%= theme.getThemeID()%>"> <%= theme.getThemeName()%> </option>
                                            <%                                                    }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="elem-group">
                                    <div class="elem-group inlined">
                                        <label for="servce-selection">Bonus Service</label>
                                        <select id="bonus_service" name="bonus_service" required>
                                            <option value="">Choose a service</option>
                                            <%
                                                for (BonusServiceDTO bonusService : bonusServiceList) {
                                            %>
                                            <option value="<%= bonusService.getServiceID() + " " + bonusService.getServicePrice()%>"> <%= bonusService.getServiceName()%> </option>     
                                            <%                                                    }
                                            %> 
                                        </select>
                                    </div>           
                                </div>

                                <div id="checkout-class">  
                                    <button id="checkout" type="submit" onclick="storePackageInfo()">Payment</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="overlay"></div>   <!--for close package form without clicking x button-->


                </div>
            </div>
        </div>
    </section>


    <%            }
    %>




    <!-- Related items section-->
    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="fw-bolder mb-4">Related products</h2>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Fancy Product</h5>
                                <!-- Product price-->
                                $40.00 - $80.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Special Item</h5>
                                <!-- Product reviews-->
                                <div class="d-flex justify-content-center small text-warning mb-2">
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                </div>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$20.00</span>
                                $18.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Sale Item</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$50.00</span>
                                $25.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Popular Item</h5>
                                <!-- Product reviews-->
                                <div class="d-flex justify-content-center small text-warning mb-2">
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                </div>
                                $40.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
    </footer>

    <script >

        const openModelButtons = document.querySelectorAll('[data-model-target]');
        const closeModelButtons = document.querySelectorAll('[data-close-button]');
        const overlay = document.getElementById('overlay');

        openModelButtons.forEach(button => {
            button.addEventListener('click', () => {
                const model = document.querySelector(button.dataset.modelTarget);
                openModel(model);
            });
        });

        overlay.addEventListener('click', () => {
            const models = document.querySelectorAll('.model.active');
            models.forEach(model => {
                closeModel(model);
            });
        });

        closeModelButtons.forEach(button => {
            button.addEventListener('click', () => {
                const model = button.closest('.model');
                closeModel(model);
            });
        });

        function openModel(model) {
            if (model === null)
                return;
            model.classList.add('active');
            overlay.classList.add('active');
        }

        function closeModel(model) {
            if (model === null)
                return;
            model.classList.remove('active');
            overlay.classList.remove('active');
        }



        var currentDateTime = new Date();
        var year = currentDateTime.getFullYear();
        var month = (currentDateTime.getMonth() + 1);
        var date = (currentDateTime.getDate() + 1);

        if (date < 10) {
            date = '0' + date;
        }
        if (month < 10) {
            month = '0' + month;
        }

        var dateTomorrow = year + "-" + month + "-" + date;
        var checkinElem = document.querySelector("#checkin-date");
        var checkoutElem = document.querySelector("#checkout-date");

        checkinElem.setAttribute("min", dateTomorrow);

        checkinElem.onchange = function () {
            checkoutElem.setAttribute("min", this.value);
        };


        function storePackageInfo() {
            // get data from form

            var packageID = document.getElementById("packageID").value;
            var packageUnitPrice = document.getElementById("price-unit-original").textContent;
            var center = document.getElementById("center-selection").value;
            var checkinDate = document.getElementById("checkin-date").value;
            var checkinTime = document.getElementById("checkin-time").value;
            var childrenNums = document.getElementById("childrenNums").value;
            var theme = document.getElementById("theme").value;
            var bonusService = document.getElementById("bonus_service").value;


            // create an object to store data
            var packageInfo = {
                packageID: packageID,
                packageUnitPrice: packageUnitPrice,
                center: center,
                checkinDate: checkinDate,
                checkinTime: checkinTime,
                childrenNums: childrenNums,
                theme: theme,
                bonusService: bonusService

            };

            // convert the object into JSON string
            var packageInfoJSON = JSON.stringify(packageInfo);

            // store the JSON string into local storage
            localStorage.setItem("packageInfo", packageInfoJSON);
        }


//            document.addEventListener("click", function ()
//            {
//                var storedFormData = localStorage.getItem("packageInfo");
//
//                if (storedFormData !== null)
//                {
//                    var packageData = JSON.parse(storedFormData);
//                    console.log("Form data not found in Local Storage ");
//
//                } else
//                {
//                    console.log("Form data not found in Local Storage or Local Storage is cleared");
//                }
//            });



        function updateCartCount()
        {
            var packgeInfo = localStorage.getItem("packageInfo");
            if (packgeInfo !== null)
            {
                var localStorageLength = localStorage.length;
                document.getElementById("numsOfCart").innerHTML = localStorageLength;
            }
        }

        updateCartCount();


    </script>

</body>
</html>
