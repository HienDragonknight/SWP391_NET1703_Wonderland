/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package paypal.services;

import controlls.servlet.*;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserDTO;

/**
 *
 * @author bao.kun
 */
@WebServlet(name = "ExecutePaymentPayPalServlet", urlPatterns = {"/execute_payment_paypal"})
public class ExecutePaymentPayPalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ExecutePaymentPayPalServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String paymentID = request.getParameter("paymentId");
        String payerID = request.getParameter("PayerID");

        try {

            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentID, payerID);

            if (payment != null) {

                // ############## WONDERLAND ##############  
                // ########################################
                HttpSession session = request.getSession();   // from AuthorizePayment
                Map<String, String> orderDetailInfo = (Map<String, String>) session.getAttribute("ORDER_DETAIL_INFO");
                Map<String, String> orderInfo = (Map<String, String>) session.getAttribute("ORDER_INFO");

                
                
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                boolean checkInserOrderDetail = false;

                try {
                    checkInserOrderDetail = orderDetailDAO.insertOrderDetail(orderDetailInfo, orderInfo);
                } catch (SQLException ex) {
                    ex.getMessage();
                }
                if (checkInserOrderDetail) {
                    PayerInfo payerInfo = payment.getPayer().getPayerInfo();
                    Transaction transaction = payment.getTransactions().get(0);

                    request.setAttribute("PAYER", payerInfo);
                    request.setAttribute("TRANSACTION", transaction);

                    request.getRequestDispatcher("receipt_paypal.jsp").forward(request, response);
                }

                // ########################################
                // ########################################
            }

        } catch (PayPalRESTException e) {
            e.getStackTrace();
            request.setAttribute("ERROR_MESSAGE", "Could not execute payment");
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
