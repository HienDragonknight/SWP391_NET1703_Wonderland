/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.email;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.OrderDTO;
import models.OrderDetailDTO;
import models.UserDTO;

/**
 *
 * @author Hp
 */
@WebServlet(name = "CustomerOrder", urlPatterns = {"/CustomerOrder"})
public class CustomerOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendCustomerOrder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendCustomerOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        OrderDAO dao = new OrderDAO();
        OrderDetailDAO dal = new OrderDetailDAO();
        UserDAO udao = new UserDAO();
        String email = request.getParameter("hienntss171243@fpt.edu.vn");
        String orderID = request.getParameter("orderID");
        try {
            OrderDTO order= dao.getNewOrderUserNamebyID(orderID);
            OrderDetailDTO orderDetail =  dal.getOrderDetailIDNew(order.getOrderDetailID());
            UserDTO userDto = udao.searchByID(order.getUserID());
                    SendOrderEmail1 sm = new SendOrderEmail1();
        String code = sm.getRandom();

        UserMail user = new UserMail(email, code);

        boolean test = sm.sendEmail(userDto, order, orderDetail);

        if (test) {
            
    
              response.sendRedirect("PartyHostServlet");
        } 
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
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
