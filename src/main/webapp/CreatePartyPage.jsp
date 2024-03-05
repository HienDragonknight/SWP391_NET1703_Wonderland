<%-- 
    Document   : CreatePartyPage
    Created on : Jan 21, 2024, 9:35:15 PM
    Author     : phanv
--%>

<%@page import="java.util.Objects"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Service</title>
    </head>
    <body>
        <h2>Add Service</h2>

        <form action="AddServiceServlet" method="post">
            <h3>Add Theme</h3>
            Theme Name: <input type="text" name="themeName" required><br>
            <input type="submit" name="addTheme" value="addTheme">
        </form><br>
        <div><%= request.getAttribute("message")%></div>
        <form action="AddServiceServlet" method="post">
            <h3>Add Package</h3>
            Package Name <input type="text" name="packageName" required><br>
            Package Price <input type="text" name="packagePrice" required><br>
            Package Image <input type="text" name="packageImage" required><br>
            Package Video <input type="text" name="packageVideo" required><br>
            Package Description <input type="text" name="packageDescription" required><br>
            <input type="submit" name="addPackage" value="addPackage">
        </form><br>
        <div><%= request.getAttribute("message")%></div>
        <form action="AddServiceServlet" method="post">
            <h3>Add Bonus Service</h3>
            Bonus Service Name: <input type="text" name="bonusServiceName" required><br>
            Bonus Service Price <input type="text" name="bonusServicePrice" required><br>
            Bonus Service Description <input type="text" name="bonusServiceDescription" required><br>
            Bonus Service Image <input type="text" name="bonusServiceImage" required><br>
            <input type="submit" name="addBonusService" value="addBonusService">
        </form><br>
        <div><%= request.getAttribute("message")%></div>
        <form action="AddServiceServlet" method="post">
            <h3>Add Location</h3>
            Location Details: <input type="text" name="locationDetail" required><br>
            <input type="submit" name="addLocation" value="addLocation">
        </form>
        <div><%= request.getAttribute("message")%></div>
    </body>
</html>