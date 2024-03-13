<%-- 
    Document   : register
    Created on : Jan 28, 2024, 1:24:41 PM
    Author     : 84335
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Notification styles */
            .notification {
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #f44336;
                color: white;
                padding: 15px;
                border-radius: 5px;
                z-index: 1000;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .notification .close {
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <form action="RegisterServlet" method="POST">
                <div class="form-group">
                    <label for="txtName">Full Name</label>
                    <input type="text" class="form-control" id="txtName" name="txtName" value="">
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <input type="email" class="form-control" id="txtEmail" name="txtEmail" value="">
                </div>
                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <input type="password" class="form-control" id="txtPassword" name="txtPassword" value="">
                </div>
                <div class="form-group">
                    <label for="txtCfPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="txtCfPassword" name="txtCfPassword" value="">
                </div>
                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <input type="text" class="form-control" id="txtPhone" name="txtPhone" value="">
                </div>
                <button type="submit" class="btn btn-primary" name="action">Sign Up</button>
            </form>
        </div>

        <div id="notificationContainer"></div>

        <script>
            // Function to close the notification
            function closeNotification() {
                var notificationContainer = document.getElementById('notificationContainer');
                var notification = document.querySelector('.notification');
                notificationContainer.removeChild(notification);
            }

            // Function to display the notification
            function displayNotification(message) {
                var notificationContainer = document.getElementById('notificationContainer');
                var notification = document.createElement('div');
                notification.className = 'notification';
                notification.innerHTML = '<span class="close" onclick="closeNotification()"></span><p>' + message +
                        '</p>';
                notificationContainer.appendChild(notification);

                // Remove the notification after 3 seconds
                setTimeout(function () {
                    notificationContainer.removeChild(notification);
                }, 3000);
            }

            // Check if there is an error message and display the notification
            var errorMessage = "Register Fail"; // Set your error message here
            if (errorMessage !== "") {
                displayNotification(errorMessage);
            }
        </script>
    </body>
</html>
