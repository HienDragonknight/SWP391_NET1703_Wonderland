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
import java.util.List;
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            OrderDAO dao = new OrderDAO();
            double year20 = dao.getChartInYear(2020);
            double year21 = dao.getChartInYear(2021);
            double year22 = dao.getChartInYear(2022);
            double year23 = dao.getChartInYear(2023);
            double year24 = dao.getChartInYear(2024);

            request.setAttribute("year20", year20);
            request.setAttribute("year21", year21);
            request.setAttribute("year22", year22);
            request.setAttribute("year23", year23);
            request.setAttribute("year24", year24);
            
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
