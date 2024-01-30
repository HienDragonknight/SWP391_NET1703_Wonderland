<%-- 
    Document   : CreatePartyPage
    Created on : Jan 21, 2024, 9:35:15 PM
    Author     : phanv
--%>

<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Party</title>
    </head>
    <body>
        <h1>Add Party</h1>
        <form action="AddServiceServlet" method="POST">
            Theme Name <input type="text" name="themeName" required=""/>
            </br>Package Name<input type="text" name="packageName" required=""/>
            </br>Package Price<input type="text" name="packagePrice" required=""/>
            </br>Package Image<input type="text" name="packageImage" required=""/>
            </br>Package Video<input type="text" name="packageVideo" required=""/>
            </br>Package Description<input type="text" name="packageDesciption" required=""/>
            </br>Bonus Service Name<input type="text" name="serviceName" required=""/>
            </br>Bonus Service Price<input type="text" name="servicePrice" required=""/>
            </br>Bonus Service Desciption<input type="text" name="descriptions" required=""/>
            </br>Bonus Service Video<input type="text" name="image" required=""/>
            </br>Location Details<input type="text" name="locationDetails" required=""/>
            </br><input type="submit" name="create" value="create"/>
            <input type="reset" value="Reset"/> 
            <%
                String message = (String) request.getAttribute("message");
                if (Objects.nonNull(message)) {
            %>
            <p style="color: green;"><%= message%></p>
            <% }%>
        </form>
    </body>
</html>
