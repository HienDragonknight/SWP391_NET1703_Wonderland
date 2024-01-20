/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserDTO;

/**
 *
 * @author Hp
 */
public class LoginServlet extends HttpServlet {
    private final String LOGIN_PAGE = "login.jsp";
    private final String HOME_PAGE = "home.jsp";
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
        String url = LOGIN_PAGE;
        boolean error = false;
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        try {
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkLogin(email, password);
            if (dto == null) {
                error = true;
                url = LOGIN_PAGE;
            } else {
                url = HOME_PAGE;
                error = false;
            }
        } catch (SQLException ex) {
            log("CreateAccountServlet _ SQL: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("CreateAccountServlet _ Class: " + ex.getMessage());
        } finally {
            if (error) {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
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
        String url = LOGIN_PAGE;
        boolean error = false;
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        try {
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkLogin(email, password);
            if (dto == null) {
                error = true;
                url = LOGIN_PAGE;
            } else {
                url = HOME_PAGE;
                error = false;
            }
        } catch (SQLException ex) {
            log("CreateAccountServlet _ SQL: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("CreateAccountServlet _ Class: " + ex.getMessage());
        } finally {
            if (error) {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
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
