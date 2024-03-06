/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.UserDAO;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.UserDTO;

/**
 *
 * @author Le Huu Huy
 */
@WebServlet(name = "UpdateAccServlet", urlPatterns = {"/UpdateAccServlet"})
public class UpdateAccServlet extends HttpServlet {

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
        String phone = request.getParameter("txtPhone");
        String cEmail = request.getParameter("txtCEmail");

        //Retrieve the file part from the request
        Part filePart = request.getPart("txtImage");
        String imageFileName = filePart.getSubmittedFileName();

        // Define the upload path
        String directoryPath = "C:/Project SWP391/SWP391_NET1703_Wonderland/src/main/webapp/image/";
        File uploadDir = new File(directoryPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Use mkdirs() to create parent directories if they don't exist
        }
        String uploadPath = directoryPath + imageFileName;

        String url = "profile.jsp";

        try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(uploadPath);  BufferedOutputStream bos = new BufferedOutputStream(fos)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                bos.write(buffer, 0, bytesRead);
            }

            // Call DAO to update user account
            UserDAO dao = new UserDAO();
            UserDTO result = dao.updateAccount(name, phone, email, password, cEmail);

            if (result != null) {
                // If update is successful, redirect to login page
                url = "login.jsp";
            }
        } catch (SQLException ex) {
            // Log SQL exceptions
            log("UpdateAccountServlet _ SQL: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            // Log class not found exceptions
            log("UpdateAccountServlet _ ClassNotFoundException: " + ex.getMessage());
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
