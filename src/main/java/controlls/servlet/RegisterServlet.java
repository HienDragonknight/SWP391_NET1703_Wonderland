/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserDTO;

/**
 *
 * @author 84335
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    private final String REGISTER_PAGE = "register.jsp";
    private final String LOGIN_PAGE = "login.jsp";

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
        HttpSession session = request.getSession();
        session.setAttribute("ERROR_INFO", null); // Reset error info
        String url = REGISTER_PAGE;

        try {
            String button = request.getParameter("action");

            if ("Sign Up".equals(button)) {
                String fullname = request.getParameter("txtFullName");
                String email = request.getParameter("txtEmail");
                String password = request.getParameter("txtPassword");
                String phone = request.getParameter("txtPhone");

                // Validate user input (you may want to add more validation logic)
                if (fullname != null && email != null && password != null && phone != null) {
                    UserDAO dao = new UserDAO();

                    // Check if the user already exists
                    if (!dao.userExists(email)) {
                        // User does not exist, proceed with registration
                        UserDTO newUser = dao.registerUser(fullname, email, password, phone);

                        if (newUser != null) {
                            // Registration successful, redirect to login page
                            url = LOGIN_PAGE;
                            session.setAttribute("USER_INFO", newUser);
                        } else {
                            // Handle registration failure, set appropriate error message
                            session.setAttribute("ERROR_INFO", "Failed to register. Please try again.");
                        }
                    } else {
                        // User already exists, set appropriate error message
                        session.setAttribute("ERROR_INFO", "Email already in use. Please choose a different email.");
                    }
                } else {
                    // Handle invalid or missing parameters, set appropriate error message
                    session.setAttribute("ERROR_INFO", "Invalid registration parameters. Please try again.");
                }
            }
        } catch (ClassNotFoundException e) {
            log("CreateAccountServlet _ Class: " + e.getMessage());
            session.setAttribute("ERROR_INFO", "Internal error. Please try again later.");
        } catch (SQLException e) {
            log("CreateAccountServlet _ SQL: " + e.getMessage());
            session.setAttribute("ERROR_INFO", "Database error. Please try again later.");
        } finally {
            response.sendRedirect(url);
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
