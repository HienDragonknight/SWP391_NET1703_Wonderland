<%-- 
    Document   : CreatePartyPage
    Created on : Jan 21, 2024, 9:35:15 PM
    Author     : phanv
--%>

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
            </br>Pakage Name<input type="text" name="pakageName" required=""/>
            </br>Pakage Price<input type="text" name="pakagePrice" required=""/>
            </br>Pakage Image<input type="text" name="pakageImage" required=""/>
            </br>Pakage Video<input type="text" name="pakageVideo" required=""/>
            </br>Pakage Description<input type="text" name="pakageDesciption" required=""/>
            </br>Bonus Service Name<input type="text" name="serviceName" required=""/>
            </br>Bonus Service Price<input type="text" name="servicePrice" required=""/>
            </br>Bonus Service Desciption<input type="text" name="descriptions" required=""/>
            </br>Bonus Service Video<input type="text" name="image" required=""/>
            </br>Location Details<input type="text" name="locationDetails" required=""/>
            </br><input type="submit" name="create" value="Create"/>
            <input type="reset" value="Reset"/> 
            
        </form>
    </body>
</html>
