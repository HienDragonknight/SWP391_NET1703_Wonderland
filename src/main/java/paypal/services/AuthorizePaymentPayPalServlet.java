/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package paypal.services;

import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.OrderDetailDTO;

@WebServlet(name = "AuthorizePaymentPayPalServlet", urlPatterns = {"/authorize_payment_paypal"})
public class AuthorizePaymentPayPalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {

            // ############## WONDERLAND ##############  
            // ########################################
            HttpSession session = request.getSession();

            String serviceID = request.getParameter("service-id");
            String packgeID = request.getParameter("package-id");
            String checkinTime = request.getParameter("checkin-time");
            String numOfChildren = request.getParameter("number-children");
            String themeID = request.getParameter("theme-id");
            String locationID = request.getParameter("location-id");
            String note = request.getParameter("note");
            String paymentMethod = "Paypal";

            Map<String, String> orderDetailInfo = new HashMap<>();
            orderDetailInfo.put("serviceID", serviceID);
            orderDetailInfo.put("packgeID", packgeID);
            orderDetailInfo.put("checkinTime", checkinTime);
            orderDetailInfo.put("numOfChildren", numOfChildren);
            orderDetailInfo.put("themeID", themeID);
            orderDetailInfo.put("locationID", locationID);
            orderDetailInfo.put("note", note);
            orderDetailInfo.put("paymentMethod", paymentMethod);

            
            
              
            
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
           
            Map<String, String> orderInfo = new HashMap<>();
            orderInfo.put("fullName", fullName);
            orderInfo.put("phone", phone);
            orderInfo.put("email", email);

            session.setAttribute("ORDER_DETAIL_INFO", orderDetailInfo);
            session.setAttribute("ORDER_INFO", orderInfo);

            // ########################################
            // ########################################
            
            
            String packageProduct = request.getParameter("packageProduct");
            String subtotal = request.getParameter("subtotal");
            String shipping = request.getParameter("shipping");
            String tax = request.getParameter("tax");
            String total = request.getParameter("total");

            OrderDetailPayPal orderDetail = new OrderDetailPayPal(packageProduct, subtotal, shipping, tax, total);

            PaymentServices paymentService = new PaymentServices();
            String approvalLink = paymentService.authorizedPayment(orderDetail);
            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException e) {
            log("Error at AuthorizePaymentPayPalServlet");
            request.setAttribute("ERROR_MESSAGE", e.getMessage());
            request.getRequestDispatcher("error_paypal.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}