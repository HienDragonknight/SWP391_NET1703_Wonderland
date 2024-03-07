

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
                    String endpoint = "checkout_car.jsp";

                    int lastIndex = context.lastIndexOf("/");
                    context.replace(lastIndex + 1, context.length(), endpoint);
                    String modifiedURL = context.toString();

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

                <h1>Car Checkout</h1>
            </div>

        </section>

        <div class="cart-container"><form action="https://tiniworld.com/checkout/cart/updatePost/" method="post" id="form-validate" class="form form-cart">
                <div class="cart main actions">
                    <button type="submit" name="update_cart_action" data-cart-item-update="" value="update_qty" title="Cập nhật giỏ hàng" class="action update">
                        <span>Cập nhật giỏ hàng</span>
                    </button>
                    <input type="hidden" value="" id="update_cart_action_container" data-cart-item-update="">
                </div>
                <input name="form_key" type="hidden" value="mSSKiY9yWec1lqOp">    <div class="cart table-wrapper">
                    <div id="shopping-cart-table" class="cart items data table">
                        <div class="cart item product-item">
                            <a href="https://tiniworld.com/tiniworld-aeon-long-bi-n.html" title="TINIWORLD AEON LONG BIÊN" tabindex="-1" class="product-item-photo">
                                <span class="product-image-container product-image-container-277" style="width: 95px;">
                                    <span class="product-image-wrapper" style="padding-bottom: 100%;">
                                        <img class="product-image-photo" src="https://tiniworld.com/media/catalog/product/cache/8f073051dd604ce655487aae2e2a3fa7/1/_/1_1_1.png" loading="lazy" width="95" height="95" alt="TINIWORLD AEON LONG BIÊN">
                                    </span>
                                </span>
                                <style>.product-image-container-277 {
                                        width: 95px;
                                    }
                                    .product-image-container-277 span.product-image-wrapper {
                                        padding-bottom: 100%;
                                    }</style><script type="text/javascript">prodImageContainers = document.querySelectorAll(".product-image-container-277");
                                        for (var i = 0; i < prodImageContainers.length; i++) {
                                            prodImageContainers[i].style.width = "95px";
                                        }
                                        prodImageContainersWrappers = document.querySelectorAll(
                                                ".product-image-container-277  span.product-image-wrapper"
                                                );
                                        for (var i = 0; i < prodImageContainersWrappers.length; i++) {
                                            prodImageContainersWrappers[i].style.paddingBottom = "100%";
                                        }</script>        </a>

                            <div class="product-item-inner">
                                <strong class="product-item-name">
                                    <a href="https://tiniworld.com/tiniworld-aeon-long-bi-n.html">TINIWORLD AEON LONG BIÊN</a>
                                </strong>
                                <div class="product-item-details ">
                                    <div class="product-item-options">
                                        <div class="item-options">

                                            <label class="label">Trung tâm</label>
                                            <div class="value">TINIWORLD AEON LONG BIÊN</div>
                                        </div>
                                        <div class="item-option">
                                            <label class="label">Loại vé</label>
                                            <div class="value">
                                                Ngày thường (T2 - T6)                                                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item-price">

                                    <span class="price-excluding-tax" data-label="Chưa bao gồm thuế">
                                        <span class="cart-price">
                                            <span class="price">300.000&nbsp;₫</span>            </span>

                                    </span>
                                </div>
                                <div class="product-item-qty">
                                    <label for="cart-28146-qty">
                                        <span class="decrease" id="decrease" onclick="getElementById('cart-28146-qty').stepDown(1)"></span>
                                        <input id="cart-28146-qty" name="cart[28146][qty]" data-cart-item-id="tW Aeon Long Biên-normal_fare" value="2" type="number" size="4" step="1" min="1" title="Số lượng" class="input-text qty" data-validate="{required:true,'validate-greater-than-zero':true}" data-role="cart-item-qty">
                                        <span class="increase" id="increase" onclick="getElementById('cart-28146-qty').stepUp(1)"></span>
                                    </label>
                                </div>
                                <div class="product-item-actions">
                                    <div class="actions-toolbar">

                                        <div id="gift-options-cart-item-28146" data-bind="scope:'giftOptionsCartItem-28146'" class="gift-options-cart-item">

                                        </div>
                                        <a class="action action-edit" href="https://tiniworld.com/checkout/cart/configure/id/28146/product_id/277/" title="Sửa thông số sản phẩm">
                                            <span>Chỉnh sửa</span>
                                        </a>
                                        <a href="#" title="Xóa sản phẩm" class="action action-delete" data-post="{&quot;action&quot;:&quot;https:\/\/tiniworld.com\/checkout\/cart\/delete\/&quot;,&quot;data&quot;:{&quot;id&quot;:&quot;28146&quot;,&quot;uenc&quot;:&quot;aHR0cHM6Ly90aW5pd29ybGQuY29tL2NoZWNrb3V0L2NhcnQv&quot;}}">
                                            <span>
                                                Xóa    </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form></div> 




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
            //{"packageID":"1","packageUnitPrice":"$250.0","center":"2-Wonderland District 2, Ho Chi Minh City",
            ////"checkinDate":"2024-02-20","checkinTime":"22:02","childrenNums":"2","theme":"7","bonusService":"10 40.0"}
            function updateOrderInfomation()
            {
                var packageInfo = localStorage.getItem("packageInfo");
                var packageData = JSON.parse(packageInfo);
                var locationName = document.getElementById("location-name");
                var numberOfChildren = document.getElementById("number-of-children");
                var pricePackageUnit = document.getElementById("price-unit");

                locationName.innerHTML = packageData['center'].split('-')[1];
                numberOfChildren.innerHTML = "<span class=\"label\">Children </span>" + packageData['childrenNums'];
                var pricePackageUnitValue = packageData['packageUnitPrice'].split('$')[1];
                pricePackageUnit.innerHTML = "  <span class=\"lable\" >Unit Price </span>" + pricePackageUnitValue + '$';

                var priceMultipleValue = parseFloat(pricePackageUnitValue) * packageData['childrenNums'];
                var priceMultiple = document.getElementById("price-multiple");
                priceMultiple.innerHTML = priceMultipleValue + '$';

                var bonusServiceValue = packageData["bonusService"].split(' ')[1];
                var bonusService = document.getElementById("price-bonus");
                bonusService.innerHTML = bonusServiceValue + '$';

                var totalValue = parseInt(priceMultipleValue) + parseInt(bonusServiceValue);
                var total = document.getElementById("price-total");
                total.innerHTML = totalValue + '$';

            }
            updateOrderInfomation();



            function setValueToOrderDetailForm()
            {
                /*
                 {"packageID":"1","packageUnitPrice":"$250.0","center":"4-Wonderland District 4,
                 Ho Chi Minh City","checkinDate":"2024-02-20","checkinTime":"04:04",
                 "childrenNums":"3","theme":"13","bonusService":"12 85.0"}
                 */

                var packageInfo = localStorage.getItem("packageInfo");
                var packageData = JSON.parse(packageInfo);

                var bonusService = packageData['bonusService'];
                var serviceID = bonusService.split(' ')[0];
                var serviceInput = document.getElementById('service-id');
                serviceInput.value = serviceID;

                var packageID = packageData['packageID'];
                var packageIDInput = document.getElementById('package-id');
                packageIDInput.value = packageID;

                var checkinDate = packageData['checkinDate'];
                var checkinTime = packageData['checkinTime'];
                var checkinTimeInput = document.getElementById('checkin-time');
                checkinTimeInput.value = checkinDate + ' ' + checkinTime;

                var numberOfChildren = packageData['childrenNums'];
                var numberOfChildrenInput = document.getElementById('number-children');
                numberOfChildrenInput.value = numberOfChildren;

                var themeID = packageData['theme'];
                var themIDInput = document.getElementById('theme-id');
                themIDInput.value = themeID;

                var locationID = packageData['center'];
                locationID = locationID.split('-')[0];
                var locationIDInput = document.getElementById('location-id');
                locationIDInput.value = locationID;

            }
            setValueToOrderDetailForm();



            document.getElementById('form-to-payment').addEventListener('submit', function (event) {
                var email = document.getElementById('email').value;
                var phone = document.getElementById('phone').value;

                if (email.trim() === '' && phone.trim() === '') {
                    alert('Please enter either your email or phone number.');
                    event.preventDefault(); // prevent form submission
                }
            });



            function updatePayPalForm()
            {
                // set value for SubTotal
                var subtotal = document.getElementById("subtotal");
                var price_multiple = document.getElementById("price-multiple");
                subtotal.value = price_multiple.innerHTML.split('$')[0];

                // set value for Shipping: suppose Shipping value  =  BonusService value
                var shipping = document.getElementById("shipping");
                var price_bonus = document.getElementById("price-bonus");
                shipping.value = price_bonus.innerHTML.split('$')[0];

                // set value for tax
                var tax = document.getElementById("tax");
                tax.value = 0;

                // set value for total
                var total = document.getElementById("total");
                var price_total = document.getElementById("price-total");
                total.value = price_total.innerHTML.split('$')[0];
            }

            updatePayPalForm();



            var inputPhone = document.getElementById("phone");

            function formatPhoneNumber(inputPhone) {
                // Remove non-numeric characters from the input
                var phoneNumber = inputPhone.value.replace(/\D/g, '');

                // Check if the input value is empty or not
                if (phoneNumber.length > 0) {
                    // Create a regular expression to match the desired phone number format
                    var regex = /^(\d{1})(\d{2})(\d{3})(\d{4})$/;

                    // Apply the regular expression to the phone number
                    var formattedPhoneNumber = phoneNumber.replace(regex, '0$2-$3-$4');

                    // Update the input value with the formatted phone number
                    inputPhone.value = formattedPhoneNumber;
                }
            }

            // Call the function with the inputPhone argument
            formatPhoneNumber(inputPhone);


        </script>

    </body>
</html>
