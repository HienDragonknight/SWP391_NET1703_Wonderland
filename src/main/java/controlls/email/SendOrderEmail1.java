/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlls.email;

import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import models.OrderDTO;
import models.OrderDetailDTO;
import models.UserDTO;

/**
 *
 * @author Hp
 */
public class SendOrderEmail1 {

    public String getRandom() {
        Random rnd = new Random();
        int code = rnd.nextInt(999999);
        return String.format("%06d", code);
    }

    public boolean sendEmail(UserDTO user,  OrderDTO order, OrderDetailDTO orderDetail) {
        boolean test = false;
        // Email configuration
        final String fromEmail = "undeeeloveu@gmail.com"; //  email undeee
        final String password = "wcfl kgvd mxva eurj"; //  mật khẩu 
        final String toEmail = user.getEmail(); //  email user muon register
System.out.println( user.getEmail());
        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Session
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
// Message
        Message message = new MimeMessage(session);
        try {
            message.addHeader("Content-type", "text/HTML ; chartset=UTF-8");
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Customer Booking Information");
            message.setContent("<!DOCTYPE html>\n" +
"<html lang=\"en\">\n" +
"\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"    <title>Order Invoice</title>\n" +
"    <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
"    <style>\n" +
"        body {\n" +
"            background-color: #f9f9f9;\n" +
"            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n" +
"            color: #333;\n" +
"        }\n" +
"        \n" +
"        .invoice-box {\n" +
"            max-width: 600px;\n" +
"            margin: auto;\n" +
"            padding: 30px;\n" +
"            background-color: #fff;\n" +
"            border-radius: 8px;\n" +
"            box-shadow: 0 0 10px rgba(0, 0, 0, .15);\n" +
"        }\n" +
"        \n" +
"        .invoice-box .company-name {\n" +
"            font-size: 36px;\n" +
"            color: #4D4DFF;\n" +
"            /* Company name color */\n" +
"            font-weight: bold;\n" +
"            margin-bottom: 20px;\n" +
"        }\n" +
"        \n" +
"        .invoice-box .invoice-title {\n" +
"            background-color: #4D4DFF;\n" +
"            /* Title background color */\n" +
"            color: #fff;\n" +
"            /* Title text color */\n" +
"            padding: 10px;\n" +
"            border-radius: 8px;\n" +
"            text-align: center;\n" +
"            margin-bottom: 30px;\n" +
"        }\n" +
"        \n" +
"        .invoice-box .btn-view-details {\n" +
"            text-decoration: none;\n" +
"            color: #fff;\n" +
"            background-color: #4D4DFF;\n" +
"            /* Button background color */\n" +
"            padding: 10px 20px;\n" +
"            border-radius: 5px;\n" +
"            font-size: 16px;\n" +
"            transition: background-color 0.2s;\n" +
"        }\n" +
"        \n" +
"        .invoice-box .btn-view-details:hover {\n" +
"            background-color: #3A3AFF;\n" +
"            /* Button hover background color */\n" +
"        }\n" +
"        \n" +
"        .invoice-box .detail-heading {\n" +
"            background-color: #f2f2f2;\n" +
"            /* Detail heading background color */\n" +
"            padding: 5px;\n" +
"            border-radius: 5px;\n" +
"            margin-bottom: 5px;\n" +
"        }\n" +
"        \n" +
"        .invoice-box .detail-content {\n" +
"            margin-bottom: 15px;\n" +
"        }\n" +
"        \n" +
"        .invoice-box .total-price {\n" +
"            font-size: 24px;\n" +
"            font-weight: bold;\n" +
"        }\n" +
"        \n" +
"        .red {\n" +
"            color: green;\n" +
"        }\n" +
"    </style>\n" +
"</head>\n" +
"\n" +
"<body>\n" +
"    <div class=\"invoice-box\">\n" +
"        <h2>Welcome to Wonderland Party For Kids!</h2>\n" +
"        </br>\n" +
"        <p>Thank you for choosing us for your special occasion. Below you'll find the details of your party booking. Please review to ensure everything is set for your event.</p>\n" +
"\n" +
"        <div class=\"invoice-title\">Your Booking Order</div>\n" +
"        <div class=\"detail-heading\">Order ID: "+order.getOrderID()+"</div>\n" +
"        <div class=\"detail-content\">User:  "+order.getUserName()+"</div>\n" +
"        <div class=\"detail-heading\">Created at:</div>\n" +
"        <div class=\"detail-content\"> "+order.getCreateDate()+"</div>\n" +
"        <div class=\"detail-heading\">Package:</div>\n" +
"        <div class=\"detail-content\"> "+orderDetail.getPackageName()+"</div>\n" +
"        <div class=\"detail-heading\">Theme:</div>\n" +
"        <div class=\"detail-content\">"+orderDetail.getThemeName()+"</div>\n" +
"        <div class=\"detail-heading\">Bonus Service:</div>\n" +
"        <div class=\"detail-content\">"+orderDetail.getServiceName()+"</div>\n" +
"        <div class=\"detail-heading\">Location:</div>\n" +
"        <div class=\"detail-content\">"+orderDetail.getLocation()+"</div>\n" +
"        <div class=\"detail-heading\">Notes:</div>\n" +
"        <div class=\"detail-content\">"+orderDetail.getNotes()+"</div>\n" +
"        <div class=\"detail-heading\">Date Party Start:</div>\n" +
"        <div class=\"detail-content\">"+orderDetail.getDateStart()+"</div>\n" +
"        <div class=\"detail-heading\">Total Price:</div>\n" +
"        <div class=\"detail-content total-price\">"+order.getTotalPrice()+"</div>\n" +
"        <div class=\"detail-heading\">Status:</div>\n" +
"        <div class=\"detail-content red\">Your Party Booking Information is Accepted</div>\n" +
"\n" +
"        <p>If you have any questions or need to make any changes to your booking, please don't hesitate to contact us. We're here to make sure your party is a fantastic experience!</p>\n" +
"        <p>Looking forward to celebrating with you,</p>\n" +
"        <p><strong>The Wonderland Party For Kids Team</strong></p>\n" +
"    </div>\n" +
"</body>\n" +
"\n" +
"</html>", "text/html");
            // Noi dung

            // Send the email
            Transport.send(message);
            test = true;

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return test;
    }

}
