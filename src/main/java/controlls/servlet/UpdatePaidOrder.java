/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bao.kun
 */
@WebServlet(name = "UpdatePaidOrder", urlPatterns = {"/update_order_after_checkout"})
public class UpdatePaidOrder extends HttpServlet {

    private static final String ERROR = "view_your_party_servlet?status=going";
    private static final String SUCCESS = "view_your_party_servlet?status=going";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {

            String dateStart = request.getParameter("checkin-date");
            String timeStart = request.getParameter("checkin-time");
            String orderDetailID = request.getParameter("order-Id");

            OrderDetailDAO oderDetailDao = new OrderDetailDAO();

            boolean check = oderDetailDao.updateDateTimeStart(dateStart, timeStart, orderDetailID);

            if (check) {
                url = SUCCESS;
                request.setAttribute("UPDATE_STATUS", "Update successfully");
            } else {
                url = ERROR;
                request.setAttribute("UPDATE_STATUS", "Update failed");
            }

        } catch (Exception e) {
            log("Error at UpdatePaidOrder");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
