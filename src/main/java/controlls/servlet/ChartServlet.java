/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.OrderDetailDTO;

/**
 *
 * @author huY
 */
@WebServlet(name = "ChartServlet", urlPatterns = {"/ChartServlet"})
public class ChartServlet extends HttpServlet {

    private final String SUCCESS = "chart.jsp";
    private final String ERROR = "chart.jsp";

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            OrderDAO dao = new OrderDAO();
            double month1 = dao.getChartInYear(1);
            double month2 = dao.getChartInYear(2);
            double month3 = dao.getChartInYear(3);
            double month4 = dao.getChartInYear(4);
            double month5 = dao.getChartInYear(5);
            double month6 = dao.getChartInYear(6);
            double month7 = dao.getChartInYear(7);
            double month8 = dao.getChartInYear(8);
            double month9 = dao.getChartInYear(9);
            double month10 = dao.getChartInYear(10);
            double month11 = dao.getChartInYear(11);
            double month12 = dao.getChartInYear(12);

            request.setAttribute("month1", month1);
            request.setAttribute("month2", month2);
            request.setAttribute("month3", month3);
            request.setAttribute("month4", month4);
            request.setAttribute("month5", month5);
            request.setAttribute("month6", month6);
            request.setAttribute("month7", month7);
            request.setAttribute("month8", month8);
            request.setAttribute("month9", month9);
            request.setAttribute("month10", month10);
            request.setAttribute("month11", month11);
            request.setAttribute("month12", month12);
            
            OrderDetailDAO daoo = new OrderDetailDAO();
            daoo.getOrder();
            List<OrderDetailDTO> order = daoo.getListOrder();
            request.setAttribute("LIST_ORDER", order);
            
            url = SUCCESS;
        } catch (ClassNotFoundException ex) {
            log("CreateAccountServlet _ Class: " + ex.getMessage());
        } catch (SQLException ex) {
            log("CreateAccountServlet _ SQL: " + ex.getMessage());
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ChartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ChartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
