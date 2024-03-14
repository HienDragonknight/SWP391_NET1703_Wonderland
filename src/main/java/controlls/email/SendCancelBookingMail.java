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
public class SendCancelBookingMail {

    public String getRandom() {
        Random rnd = new Random();
        int code = rnd.nextInt(999999);
        return String.format("%06d", code);
    }

    public boolean sendEmail(UserDTO user, OrderDTO order, OrderDetailDTO orderDetail) {
        boolean test = false;
        // Email configuration
        final String fromEmail = "undeeeloveu@gmail.com"; //  email undeee
        final String password = "wcfl kgvd mxva eurj"; //  mật khẩu 
        final String toEmail = user.getEmail(); //  email user muon register
        System.out.println(user.getEmail());
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
            message.setContent("<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "    <meta charset=\"UTF-8\">\n"
                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    <title>Order Cancellation Confirmation</title>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body style=\"font-family: Arial, sans-serif;\">\n"
                    + "\n"
                    + "    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n"
                    + "        <tr>\n"
                    + "            <td align=\"center\" bgcolor=\"#f8f8f8\" style=\"padding: 40px 0;\">\n"
                    + "                <table width=\"600\" cellspacing=\"0\" cellpadding=\"0\">\n"
                    + "                    <tr>\n"
                    + "                        <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding: 40px; border-radius: 8px; border: 1px solid #e6e6e6;\">\n"
                    + "                            <h2 style=\"margin: 0 0 20px; color: #333333; text-align: left;\">Order Cancellation Confirmation</h2>\n"
                    + "                            <p style=\"margin: 0 0 20px; color: #666666; text-align: left;\">Dear Mr/Mrs "+user.getFullName()+",</p>\n"
                    + "                            <p style=\"margin: 0 0 20px; color: #666666; text-align: left;\">We have received your request to cancel your party booking order. We are pleased to inform you that the cancellation process has been successfully completed.</p>\n"
                    + "                            <p style=\"margin: 0 0 20px; color: #666666; text-align: left;\">As per your request, the booking has been cancelled, and we will refund <span style=\"font-weight: bold; color: #ff0000;\">80%</span> of the total order amount, which amounts to <span style=\"font-weight: bold; color: #ff0000;\">$"+order.getTotalPrice()*80/100+"</span>.\n"
                    + "                                You can expect to see the refund reflected in your account within 5 day.</p>\n"
                    + "                            <p style=\"margin: 0 0 20px; color: #666666; text-align: left;\">To facilitate the refund process, please provide us with your bank account details or mobile money (Momo) information. Kindly reply to this email with the necessary information so that we can proceed with the refund promptly.</p>\n"
                    + "                            <p style=\"margin: 0 0 20px; color: #666666; text-align: left;\">Thank you for choosing our services. If you have any further questions or need assistance, please feel free to contact us. We are always here to help.</p>\n"
                    + "                            <p style=\"margin: 0 0 20px; color: #666666; text-align: left;\">Best regards,<br>Your Party Booking Team</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>", "text/html");
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
