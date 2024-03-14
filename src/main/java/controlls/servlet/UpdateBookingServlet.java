/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.BonusServiceDAO;
import dal.LocationDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.PackageDAO;
import dal.ThemeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BonusServiceDTO;
import models.LocationDTO;
import models.OrderDetailDTO;
import models.PackageDTO;
import models.ThemeDTO;

/**
 *
 * @author Hp
 */
@WebServlet(name = "UpdateBookingServlet", urlPatterns = {"/UpdateBookingServlet"})
public class UpdateBookingServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateBookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

         String orderDetailId = request.getParameter("orderID");
        OrderDetailDAO o = new OrderDetailDAO(); 
         List<OrderDetailDTO> listOrderDetail;
         
        try {
            listOrderDetail = o.getOrderDetailID(orderDetailId);
             if (listOrderDetail != null) {
            request.setAttribute("ORDER_DETAILS", listOrderDetail);
             }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
               
     
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

                request.setAttribute("BONUS_SERVICE_LIST", bonusServiceList);
                request.setAttribute("THEME_LIST", themeList);
                request.setAttribute("LOCATION_LIST", locationList);
                request.setAttribute("PACKAGE_LIST", packageList);
            }

        } catch (Exception e) {
            log("Error at ViewBookingServlet");
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("update_order.jsp");
            rd.forward(request, response);
        }

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request (assumed to be sent from a form or API call)
        int orderDetailID = Integer.parseInt(request.getParameter("orderDetailID"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        if (email==null) {
            email="null";
        }
        String phone = request.getParameter("phone");
           if (phone==null) {
            phone="null";
        }
        String fullname = request.getParameter("fullname");
           if (fullname==null) {
            fullname="null";
        }
        String payment = "Payment";
        String notes = request.getParameter("notes");
        String amountOfPeople = request.getParameter("amountOfPeople");
        String dateStart = request.getParameter("dateStart");
        String location = request.getParameter("location");
        String themeName = request.getParameter("themeName");
        String serviceName = request.getParameter("serviceName");
        String packageName = request.getParameter("packageName");
        
        
        int serviceID =0;
        int themeID =0;
         int locationID =0;
        int  packageID=0;
        int  amountOfPeopleNum =0;
        if (serviceName!=null&&packageName!=null&&themeName!=null) {
             serviceID = Integer.parseInt(serviceName);
             packageID = Integer.parseInt(packageName);
             locationID = Integer.parseInt(location);
             themeID = Integer.parseInt(themeName);
             amountOfPeopleNum = Integer.parseInt(amountOfPeople);
        }
        
        
// Total = number * package + bonus
        OrderDAO dao = new OrderDAO();
        OrderDetailDAO dal = new OrderDetailDAO();
        PackageDAO pDao = new PackageDAO();
        BonusServiceDAO sDao = new BonusServiceDAO();
         double total=0;
        try {
            PackageDTO p = pDao.getPackageByID(packageID+"");
            List<BonusServiceDTO> listService = sDao.getBonusServiceList();
            BonusServiceDTO b = new BonusServiceDTO();
            for (BonusServiceDTO bonusServiceDTO : listService) {
                if (bonusServiceDTO.getServiceID().equalsIgnoreCase(serviceName)) {
                     b= bonusServiceDTO;
                }

            }
            
             total = amountOfPeopleNum*p.getUnitPrice() + b.getServicePrice();
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
                
        try {
           
            dao.updateOrder(orderDetailID, fullname,  totalPrice, status, email, phone);
            dao.updateOrderTotalPrice(orderDetailID, total);
            dal.updateOrderDetail(orderDetailID, serviceID, packageID, dateStart,  amountOfPeopleNum, themeID, locationID, notes, payment);
        
            response.sendRedirect("PartyHostServlet");
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateBookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
