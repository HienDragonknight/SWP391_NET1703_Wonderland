

<%@page import="models.UserDTO"%>
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


            #nickname
            {
                margin-left: 40%;
            }


            .decrease, .increase {
                display: inline-block;
                width: 24px;
                height: 24px;
                line-height: 24px;
                text-align: center;
                font-size: 16px;
                font-weight: bold;
                color: #fff;
                background-color: #ccc;
                border-radius: 50%;
                cursor: pointer;
                user-select: none;
            }

            .decrease:hover, .increase:hover {
                background-color: #999;
            }

            .qty-value {
                display: inline-block;
                width: 50px;
                margin: 0 5px;
                text-align: center;
                user-select: none;
            }


            #update-delete
            {
                display: flex;
                justify-content: right;
                align-content: center;
            }

            .items-ud
            {
                padding: 0 20px;
                margin: 0 10px;

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

                <%
                    StringBuffer context = request.getRequestURL();
                    String endpoint = "checkout_cart.jsp";

                    int lastIndex = context.lastIndexOf("/");
                    context.replace(lastIndex + 1, context.length(), endpoint);
                    String modifiedURL = context.toString();

                    String contextPath = request.getContextPath();


                %>

                <%                    UserDTO dto = (UserDTO) session.getAttribute("USER_INFO");

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
                        <a class="action showcart" href="<%= modifiedURL%>" data-bind="scope: 'minicart_content'">
                            <button class="btn btn-outline-dark">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </button>
                        </a>
                    </div>

                    <%
                    } else {
                    %>


                    <div class="logined" id="nickname">
                        <i class='bx bx-user-circle'></i>
                        <a href="ViewUserServlet">${sessionScope.USER_INFO.fullName}</a>
                    </div>

                    <div>
                        <a class="action showcart" href="<%= modifiedURL%>" data-bind="scope: 'minicart_content'">
                            <button class="btn btn-outline-dark">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <span id="numsOfCart" class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </button>
                        </a>
                    </div>

                </div>
                <%   }
                %>

            </aside>
        </header>


        <section>
            <div class="column-content">    
                <div class="add-ab">
                    <a href="home.jsp">Home</a><span> &#10095; Car</span>
                </div>

                <div>
                    <h1>Cart Checkout</h1>
                </div>
            </div>
        </section>


        <%
            PackageDTO packageDTO = (PackageDTO) request.getAttribute("PACKAGE_ITEM");
            if (packageDTO != null) {
        %>

        <section class="h-100 h-custom" style="background-color: #cff4fc;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">

                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Your Party</h1>

                                            </div>
                                            <hr class="my-4">

                                            <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                <div id="update-delete">
                                                    <button class="items-ud" id="editButton" title="Sửa thông số sản phẩm" onclick="updateWaitingOrder()">Update</button>

                                                    <button class="items-ud" title="Xóa sản phẩm" onclick="deleteProduct()">Delete</button>

                                                </div>
                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                    <img
                                                        src="image/packages/package_1.png"
                                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </div>
                                                <div class="col-md-3 col-lg-3 col-xl-3">
                                                    <h6 class="location-id" id="location-id" >Location</h6>
                                                    <h6 class="package-id" id="package-id" value="<%= packageDTO.getUnitPrice()%>"><%= packageDTO.getPackageName()%></h6>
                                                </div>

                                                <div class="col-md-3 col-lg-3 col-xl-3" id="unit-num">

                                                    <label for="number-children">
                                                        <span class="decrease" onclick="decreaseQuantity()">-</span>
                                                        <span id="number-children" class="qty-value" data-validate="{required:true,'validate-greater-than-zero':true}" data-role="number-children">1</span>
                                                        <span class="increase" onclick="increaseQuantity()">+</span>
                                                    </label>
                                                </div>

                                                <div class="col-md-3 col-lg-3 col-xl-3">
                                                    <div class="actions-toolbar">
                                                        <span><%= packageDTO.getUnitPrice()%> $</span>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="#!" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to Home Page</a></h6>
                                            </div>


                                        </div>
                                    </div>


                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>

                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Subtotal</h5>
                                                <h5 id="subtotal-price" >0$</h5>
                                            </div>

                                            <a href="ready_for_checkout.jsp" > <button type="button" class="btn btn-dark btn-block btn-lg"
                                                                                       data-mdb-ripple-color="dark">Check out</button>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
            }%>



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
                        document.getElementById("numsOfCart").innerHTML = 1;
                    } else
                    {
                        document.getElementById("numsOfCart").innerHTML = 0;
                    }
                }
            }

            updateCartCount();




            function decreaseQuantity() {
                let qtyInput = document.querySelector('.qty-value');
                let currentValue = parseInt(qtyInput.textContent, 10);
                if (!isNaN(currentValue) && currentValue > 1) {
                    currentValue--;
                    qtyInput.textContent = currentValue;
                }
            }

            function increaseQuantity() {
                let qtyInput = document.querySelector('.qty-value');
                let currentValue = parseInt(qtyInput.textContent, 10);
                if (!isNaN(currentValue)) {
                    currentValue++;
                    qtyInput.textContent = currentValue;
                }
            }


            function setInfoPartyFromLocalStorage()
            {
                var packageInfo = localStorage.getItem("packageInfo");
                var packageData = JSON.parse(packageInfo);

                var numberOfChildren = packageData['childrenNums'];
                var numberOfChildrenInput = document.getElementById('number-children');
                numberOfChildren = numberOfChildrenInput.value;
                numberOfChildrenInput.innerHTML = packageData.childrenNums;


                var locationID = packageData['center'];
                locationID = locationID.split('-')[0];
                var locationIDInput = document.getElementById('location-id');
                locationID = locationIDInput.value;
                var locationName = document.getElementById("location-name");
            }
            setInfoPartyFromLocalStorage();



            function  updateLocation()
            {

                var packageInfo = localStorage.getItem("packageInfo");
                var packageData = JSON.parse(packageInfo);

                var locationID = packageData['center'];
                locationName = locationID.split('-')[1];
                var locationIDInput = document.getElementById('location-id');
                locationIDInput.innerHTML = locationName;
            }

            updateLocation();


            function addParameter() {
                var packageInfo = localStorage.getItem("packageInfo");
                var packageJSON = JSON.parse(packageInfo);

                var packageID = packageJSON['packageID'];

                // If packageID exists, add it as a parameter to the href
                if (packageID !== null) {
                    var editLink = document.getElementById("editLink");
                    editLink.href += "?packageID=" + packageID;
                }
            }


            function setSubTotal()
            {
                var packageValue = document.getElementById('package-id');
                packageValue = packageValue.getAttribute("value");


                var numOfChildren = document.getElementById('number-children');
                numOfChildren = numOfChildren.innerHTML;


                var subtotal = document.getElementById('subtotal-price');
                subtotal.innerHTML = packageValue * numOfChildren + '$';
            }
            setSubTotal();





            function updateWaitingOrder()
            {
                var packageInfo = localStorage.getItem("packageInfo");
                var packageJSON = JSON.parse(packageInfo);

                var childrenNums = packageJSON['childrenNums'];

                // If packageID exists, add it as a parameter to the href
                if (packageJSON !== null) {
                    var numberOfChildren = document.getElementById('number-children');
                    packageJSON.childrenNums = numberOfChildren.innerHTML;
                    var updatedPackageInfo = JSON.stringify(packageJSON);

                    localStorage.setItem("packageInfo", updatedPackageInfo);
                    setSubTotal();
                }
            }


            function deleteProduct()
            {
                localStorage.removeItem("packageInfo");
                updateCartCount();


                var rowDiv1 = document.querySelector('.row.mb-4.d-flex.justify-content-between.align-items-center');
                if (rowDiv1) {
                    rowDiv1.remove();
                }

                var rowDiv2 = document.querySelector('.col-lg-4 bg-grey');
                if (rowDiv2) {
                    rowDiv2.remove();
                }

                var rowDiv3 = document.querySelector('.pt-5');
                if (rowDiv3) {
                    rowDiv3.remove();
                }
            }



        </script>

    </body>
</html>
