<%-- 
    Document   : orderEmail
    Created on : Mar 6, 2024, 2:25:09 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Invoice</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }
        
        .invoice-box {
            max-width: 600px;
            margin: auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        }
        
        .invoice-box .company-name {
            font-size: 36px;
            color: #4D4DFF;
            /* Company name color */
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .invoice-box .invoice-title {
            background-color: #4D4DFF;
            /* Title background color */
            color: #fff;
            /* Title text color */
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .invoice-box .btn-view-details {
            text-decoration: none;
            color: #fff;
            background-color: #4D4DFF;
            /* Button background color */
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.2s;
        }
        
        .invoice-box .btn-view-details:hover {
            background-color: #3A3AFF;
            /* Button hover background color */
        }
        
        .invoice-box .detail-heading {
            background-color: #f2f2f2;
            /* Detail heading background color */
            padding: 5px;
            border-radius: 5px;
            margin-bottom: 5px;
        }
        
        .invoice-box .detail-content {
            margin-bottom: 15px;
        }
        
        .invoice-box .total-price {
            font-size: 24px;
            font-weight: bold;
        }
        
        .red {
            color: green;
        }
    </style>
</head>

<body>
    <div class="invoice-box">
        <h2>Welcome to Wonderland Party For Kids!</h2>
        </br>
        <p>Thank you for choosing us for your special occasion. Below you'll find the details of your party booking. Please review to ensure everything is set for your event.</p>

        <div class="invoice-title">Your Booking Order</div>
        <div class="detail-heading">Order ID: 5</div>
        <div class="detail-content">User: Richard Starkey</div>
        <div class="detail-heading">Created at:</div>
        <div class="detail-content">2024-01-19 23:22:327</div>
        <div class="detail-heading">Package:</div>
        <div class="detail-content">2</div>
        <div class="detail-heading">Theme:</div>
        <div class="detail-content">Jungle safari theme</div>
        <div class="detail-heading">Service:</div>
        <div class="detail-content">Jungle safari</div>
        <div class="detail-heading">Location:</div>
        <div class="detail-content">5</div>
        <div class="detail-heading">Notes:</div>
        <div class="detail-content">Special request for birthday celebration, Special request for birthday celebration, Special request for birthday celebration</div>
        <div class="detail-heading">Date Party Start:</div>
        <div class="detail-content">2024-06-15 23:22:327</div>
        <div class="detail-heading">Total Price:</div>
        <div class="detail-content total-price">$450.00</div>
        <div class="detail-heading">Status:</div>
        <div class="detail-content red">Party is Accepted</div>

        <p>If you have any questions or need to make any changes to your booking, please don't hesitate to contact us. We're here to make sure your party is a fantastic experience!</p>
        <p>Looking forward to celebrating with you,</p>
        <p><strong>The Wonderland Party For Kids Team</strong></p>
    </div>
</body>

</html>
