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

/**
 *
 * @author Le Huu Huy
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    private final String ERROR = "register.jsp";
    private final String SUCCESS = "login.jsp";

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
        String name = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtCfPassword");
        String phone = request.getParameter("txtPhone");
        String url = ERROR;

        try {
            if (name == null || email == null || password == null || confirm == null || phone == null
                    || name.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty()
                    || confirm.trim().isEmpty() || phone.trim().isEmpty()) {
                // Handle the case where any of the parameters are null or empty
                url = ERROR;
                request.setAttribute("status", "error");
            } else if (!confirm.trim().equals(password.trim())) {
                // Password and confirm password do not match
                url = ERROR;
                request.setAttribute("ERROR_CONFIRM", "Passwords do not match");
                request.setAttribute("status", "error");
            } else {
                // All validations passed, proceed with registration
                

                HttpSession session = request.getSession();
                session.setAttribute("newFullName", name);
                session.setAttribute("newEmail", email);
                session.setAttribute("newPhone", phone);
                session.setAttribute("newPassword", password);

                response.sendRedirect("UserVerify");
                UserDAO dao = new UserDAO();
                boolean result = dao.registerUser(name, email, password, phone);
                if (result) {
                    url = SUCCESS;
                    request.setAttribute("status", "success");
                } else {
                    // Handle registration failure
                    url = ERROR;
                    request.setAttribute("status", "error");
                }
            }
        } catch (SQLException ex) {
            log("CreateAccountServlet _ SQL: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("CreateAccountServlet _ Naming: " + ex.getMessage());
        } finally {
            // Redirect to the appropriate URL
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
