/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.OrderDAO;
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
@WebServlet(name = "UpdateDeletePaidOrder", urlPatterns = {"/update_delete_action_paid_order"})
public class UpdateDeletePaidOrder extends HttpServlet {

    private static final String ERROR = "view_your_party_servlet?status=going";
    private static final String SUCCESS = "view_your_party_servlet?status=going";

    private static final String UPDATE_ACTION = "Update";
    private static final String DELETE_ACTION = "Delete";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = ERROR;

        String orderDetailID = request.getParameter("orderDetail-Id");
        String checkinDate = request.getParameter("checkin-date");
        String checkinTime = request.getParameter("checkin-time");
        String checkinDateTime = checkinDate + " " + checkinTime;
        String orderID = request.getParameter("orderID");

        try {
            OrderDAO orderDao = new OrderDAO();

            String action = request.getParameter("action");
            if (UPDATE_ACTION.equalsIgnoreCase(action)) {
                boolean checkUpdate = orderDao.updatePaidOrder(orderDetailID, checkinDateTime);     // go to orderDetails looking for orderDetailID then update dateStart
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("UPDATE_STATUS", "Update successfully");
                } else {
                    url = ERROR;
                    request.setAttribute("UPDATE_STATUS", "Update failed");
                }
            } else {
                boolean checkUpdate = orderDao.deletePaidOrder(orderID);              //  go to order looking for OrderID then delete (update status 'Cancelled')
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("DELETE_STATUS", "Delete successfully");
                } else {
                    url = ERROR;
                    request.setAttribute("DELETE_STATUS", "Delete failed");
                }
            }
        } catch (Exception e) {
            log("Error at UpdateDeletePaidOrder");
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
