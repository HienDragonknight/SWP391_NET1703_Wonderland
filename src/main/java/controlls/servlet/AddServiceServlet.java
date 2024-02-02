/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.HostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BonusServiceDTO;
import models.LocationDTO;
import models.PackageDTO;
import models.ThemeDTO;

/**
 *
 * @author phanv
 */
@WebServlet(name = "AddServiceServlet", urlPatterns = {"/AddServiceServlet"})
public class AddServiceServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "CreatePartyPage.jsp";
    private static final String SUCCESS = "CreatePartyPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String message = "";
        HostDAO hostDao = new HostDAO();
        try {
            String themeName = request.getParameter("themeName");
            String packageName = request.getParameter("packageName");
            String packagePriceParameter = request.getParameter("packagePrice");
            double packagePrice = Double.parseDouble(packagePriceParameter);
            String packageImage = request.getParameter("packageImage");
            String packageVideo = request.getParameter("packageVideo");
            String packageDesciption = request.getParameter("packageDesciption");
            String bonusServiceName = request.getParameter("bonusServiceName");
            String bonusServicePriceParameter = request.getParameter("bonusServicePrice");
            double bonusServicePrice = Double.parseDouble(bonusServicePriceParameter);
            String bonusServiceDescription = request.getParameter("bonusServiceDescription");
            String bonusServiceImage = request.getParameter("bonusServiceImage");
            String locationDetail = request.getParameter("locationDetail");
            if (request.getParameter("addTheme") != null) {
                if (hostDao.addTheme(new ThemeDTO(themeName))) {
                    url = SUCCESS;
                    message = "Theme added successfully!";
                } else {
                    message = "Failed to add Theme.";
                }
            } else if (request.getParameter("addPackage") != null) {
                if (hostDao.addPackage(new PackageDTO(packageName, packagePrice, packageImage, packageVideo, packageDesciption))) {
                    url = SUCCESS;
                    message = "Package added successfully!";
                } else {
                    message = "Failed to add Package.";
                }
            } else if (request.getParameter("addBonusService") != null) {
                if (hostDao.addBonusService(new BonusServiceDTO(bonusServiceName, bonusServicePrice, bonusServiceDescription, bonusServiceImage))) {
                    url = SUCCESS;
                    message = "Bonus Service added successfully!";
                } else {
                    message = "Failed to add Bonus Service.";
                }
            } else if (request.getParameter("addLocation") != null) {
                if (hostDao.addLocation(new LocationDTO(locationDetail))) {
                    url = SUCCESS;
                    message = "Location added successfully!";
                } else {
                    message = "Failed to add Location.";
                }
            }

        } catch (Exception ex) {
            log("Error at AddServiceServlet:" + ex);
        } finally {
            request.setAttribute("message", message);
            if (url.equals(SUCCESS)) {
                response.sendRedirect(url);
            } else {
                request.getRequestDispatcher(url).forward(request, response);
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
