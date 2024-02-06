/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.BonusServiceDAO;
import dal.LocationDAO;
import dal.PackageDAO;
import dal.ThemeDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
 * @author bao.kun
 */
@WebServlet(name = "ViewBookingServlet", urlPatterns = {"/ViewBookingServlet"})
public class ViewBookingServlet extends HttpServlet {

    private static final String ERROR = "party_booking.jsp";
    private static final String SUCCESS = "party_booking.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {

            // get THEMES_LIST
            ThemeDAO themeDAO = new ThemeDAO();
            List<ThemeDTO> themeList = themeDAO.getListThemes();

            // get BONUS_SERVICES
            BonusServiceDAO bonusServiceDAO = new BonusServiceDAO();
            List<BonusServiceDTO> bonusServiceList = bonusServiceDAO.getBonusServiceList();

            // get LOCATION
            LocationDAO locationDAO = new LocationDAO();
            List<LocationDTO> locationList = locationDAO.getListLocation();

            PackageDAO packageDAO = new PackageDAO();
            List<PackageDTO> packageList = packageDAO.getListPackage();

            if (themeList != null && bonusServiceList != null && locationList != null && packageList != null) {
                url = SUCCESS;
                request.setAttribute("BONUS_SERVICE_LIST", bonusServiceList);
                request.setAttribute("THEME_LIST", themeList);
                request.setAttribute("LIST_LOCATION", locationList);
                request.setAttribute("PACKAGE_LIST", packageList);
            }

        } catch (Exception e) {
            log("Error at ViewBookingServlet");
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
