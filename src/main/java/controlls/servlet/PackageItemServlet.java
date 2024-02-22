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
import java.io.PrintWriter;
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

// from packageList: /PackageItemServlet?packageID={}
@WebServlet(name = "PackageItemServlet", urlPatterns = {"/PackageItemServlet"})
public class PackageItemServlet extends HttpServlet {

    private static final String SUCCESS = "package_item.jsp";
    private static final String ERROR = "package_item.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = ERROR;

        try {

            String packageID = request.getParameter("packageID");

            // get package 
            PackageDAO packageDAO = new PackageDAO();
            PackageDTO packageDTO = packageDAO.getPackageByID(packageID);

            // get location 
            LocationDAO locationDAO = new LocationDAO();
            List<LocationDTO> locationList = locationDAO.getListLocation();

            // get bonus service
            BonusServiceDAO bonusServiceDAO = new BonusServiceDAO();
            List<BonusServiceDTO> bonusServiceList = bonusServiceDAO.getBonusServiceList();

            // get theme
            ThemeDAO themeDAO = new ThemeDAO();
            List<ThemeDTO> themeList = themeDAO.getListThemes();

            if (packageDTO != null && locationList != null && bonusServiceList != null && themeList != null) {
                url = SUCCESS;
                request.setAttribute("PACKGE_ITEM", packageDTO);
                request.setAttribute("LOCATION_LIST", locationList);
                request.setAttribute("BONUS_SERVICE_LIST", bonusServiceList);
                request.setAttribute("THEME_LIST", themeList);
            }

        } catch (Exception e) {
            log("Error at PackageItemServlet");
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
