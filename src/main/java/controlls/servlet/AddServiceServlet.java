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
@WebServlet(name = "AddServiceServlet", urlPatterns = "/AddServiceServlet")
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
        String action = request.getParameter("create");
        String url = ERROR;
        String message = "";
        boolean check = true;
        HostDAO hostDao = new HostDAO();
        try (PrintWriter out = response.getWriter()) {
            if (action.equals("create")) {
                String themeName = request.getParameter("themeName");
                String packageName = request.getParameter("packageName");
                String packagePriceParameter = request.getParameter("packagePrice");
                double packagePrice = Double.parseDouble(packagePriceParameter);
                String packageImage = request.getParameter("packageImage");
                String packageVideo = request.getParameter("packageVideo");
                String packageDesciption = request.getParameter("packageDesciption");
                String serviceName = request.getParameter("serviceName");
                String servicePriceParameter = request.getParameter("servicePrice");
                double servicePrice = Double.parseDouble(servicePriceParameter);
                String descriptions = request.getParameter("descriptions");
                String image = request.getParameter("image");
                String locationDetails = request.getParameter("locationDetails");
                hostDao.addTheme(new ThemeDTO(themeName));
                hostDao.addPackage(new PackageDTO(packageName, packagePrice, packageImage, packageVideo, packageDesciption));
                hostDao.addBonusService(new BonusServiceDTO(serviceName, servicePrice, descriptions, image));
                hostDao.addLocation(new LocationDTO(locationDetails));
                message = "Party created successfully!";
                url = SUCCESS;
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
