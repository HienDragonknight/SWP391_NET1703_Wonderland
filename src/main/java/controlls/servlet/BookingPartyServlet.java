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
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
 * @author huY
 */
@WebServlet(name = "BookingPartyServlet", urlPatterns = {"/BookingPartyServlet"})
public class BookingPartyServlet extends HttpServlet {
    private final String SUCCESS = "party_booking.jsp";
    private final String ERROR = "party_booking.jsp";
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
        String url = ERROR;
        try {
            //Theme List
            ThemeDAO themeDAO = new ThemeDAO();
            themeDAO.printTheme();
            List<ThemeDTO> theme = themeDAO.getListTheme();
            request.setAttribute("THEME_LIST", theme);
            
            //Location List
            LocationDAO locationDAO = new LocationDAO();
            List<LocationDTO> locationList = locationDAO.getListLocation();
            request.setAttribute("LOCATION_LIST", locationList);
            
            //Service List
            BonusServiceDAO bonusServiceDAO = new BonusServiceDAO();
            List<BonusServiceDTO> bonusServiceList = bonusServiceDAO.getBonusServiceList();
            request.setAttribute("SERVICE_LIST", bonusServiceList);
            
            //Packages
            PackageDAO packageDAO = new PackageDAO();
            List<PackageDTO> packageList = packageDAO.getListPackage();
            request.setAttribute("PACKAGE_LIST", packageList);
            
            url = SUCCESS;
        } catch (SQLException e) {
            log("CreateAccountServlet _ SQL: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            log("CreateAccountServlet _ SQL: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
