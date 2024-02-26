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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserDTO;

/**
 *
 * @author Le Huu Huy
 */
@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")

public class LoginServlet extends HttpServlet {

    private final String HOME_PAGE = "home.jsp";
    private final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        session.setAttribute("ERROR_INFO", "Incorrect username or password");

        String url = LOGIN_PAGE;
        String button = request.getParameter("action");

        try {
            if (button.equals("Login")) {
                String email = request.getParameter("txtEmail");
                String password = request.getParameter("txtPassword");
                String remember = request.getParameter("RememberMe");

                Cookie cEmail = new Cookie("cEmail", email);
                Cookie cPassword = new Cookie("cPassword", password);
                Cookie cRemember = new Cookie("cRemember", remember);
                if (email == null || password == null) {
                    response.sendRedirect("login");
                    return;
                }

                UserDAO dao = new UserDAO();
                UserDTO result = dao.checkLogin(email, password);
                if (result != null) {
                    session.setAttribute("user_loged", result);
                    String role = result.getRoleID();
                    if (remember != null && remember.equals("ON")) {
                        cEmail.setMaxAge(60 * 60 * 24 * 7);
                        cPassword.setMaxAge(60 * 60 * 24 * 7);
                        cRemember.setMaxAge(60 * 60 * 24 * 7);
                    } else {
                        cEmail.setMaxAge(0);
                        cPassword.setMaxAge(0);
                        cRemember.setMaxAge(0);
                    }

                    response.addCookie(cEmail);
                    response.addCookie(cPassword);
                    response.addCookie(cRemember);
                    url = HOME_PAGE;
                    session.setAttribute("USER_INFO", result);
                }
            }
        } catch (ClassNotFoundException e) {
            log("CreateAccountServlet _ Class: " + e.getMessage());
        } catch (SQLException e) {
            log("CreateAccountServlet _ SQL: " + e.getMessage());
        } finally {
            //response.sendRedirect(url);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
