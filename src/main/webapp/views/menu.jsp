<%-- 
    Document   : menu
    Created on : Mar 6, 2024, 1:12:03 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
