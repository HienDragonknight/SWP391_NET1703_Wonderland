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
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig
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
        String cemail = request.getParameter("txtCEmail");
        String name = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String phone = request.getParameter("txtPhone");
        String fileName = null;

        try {
            Part filePart = request.getPart("image");
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            if (!originalFileName.isEmpty()) {
                fileName = originalFileName;
                String directoryPath = "D:/FPT/SP24/SWP391/Project/SWP391_NET1703_Wonderland/src/main/webapp/image/";
                File uploadDir = new File(directoryPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String uploadPath = directoryPath + File.separator + fileName;

                try ( InputStream fileContent = filePart.getInputStream();  FileOutputStream fos = new FileOutputStream(uploadPath);  BufferedOutputStream bos = new BufferedOutputStream(fos)) {

                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = fileContent.read(buffer)) != -1) {
                        bos.write(buffer, 0, bytesRead);
                    }
                } // try-with-resources will auto-close streams
            }

            UserDAO dao = new UserDAO();
            UserDTO result = dao.updateAccount(cemail, fileName, name, email, password, phone);
            if (result != null) {
                String url = "login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions or errors here
        } finally {
            response.sendRedirect("login.jsp");
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
