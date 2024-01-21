/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.LocationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.LocationDTO;

/**
 *
 * @author bao.kun
 */
@WebServlet(name = "ViewLocationServlet", urlPatterns = {"/ViewLocation"})
public class ViewLocationServlet extends HttpServlet {

    private static final String ERROR = "location.jsp";
    private static final String SUCCESS = "location.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {

            int page = 1;   // innitilize first page 

            // for the next page
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            int recordsPerPage = 4;
            int startOffset = recordsPerPage * (page - 1);

            int noOfPages = (int) Math.ceil(recordsPerPage * 1.0 / recordsPerPage);   // for displaying

            LocationDAO dao = new LocationDAO();
            List<LocationDTO> listLocation = dao.getListLocation(startOffset, recordsPerPage);

            request.setAttribute("LIST_LOCATION", listLocation);
            request.setAttribute("NO_OF_PAGES", noOfPages);
            request.setAttribute("CURRENT_PAGE", page);

        } catch (Exception e) {
            log("Error at ViewLocationServlet");
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
