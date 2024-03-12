/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlls.servlet;

import dal.BonusServiceDAO;
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

/**
 *
 * @author Hp
 */
@WebServlet(name = "UpdateBonusService", urlPatterns = {"/UpdateBonusService"})
public class UpdateBonusService extends HttpServlet {

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
            out.println("<title>Servlet UpdateBonusService</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBonusService at " + request.getContextPath() + "</h1>");
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
              String serviceID = (String) request.getParameter("serviceID");
                BonusServiceDAO bonusServiceDAO = new BonusServiceDAO();
        try {
            List<BonusServiceDTO> listB =  bonusServiceDAO.getBonusServiceList();
            for (BonusServiceDTO bonusServiceDTO : listB) {
                if (bonusServiceDTO.getServiceID().equalsIgnoreCase(serviceID)) {
                     request.setAttribute("bonusServiceDTO", bonusServiceDTO);
                     System.out.println(serviceID);
                     System.out.println(bonusServiceDTO.toString());
                }
            }
            
               RequestDispatcher rd = request.getRequestDispatcher("update_service_theme.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBonusService.class.getName()).log(Level.SEVERE, null, ex);
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
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ request
        String serviceID = request.getParameter("serviceID");
        String serviceName = request.getParameter("serviceName");
        double servicePrice = Double.parseDouble(request.getParameter("servicePrice"));
        String descriptions = request.getParameter("descriptions");
        String image = request.getParameter("image");

        // Tạo một đối tượng BonusServiceDTO với các thông tin đã lấy
        BonusServiceDTO bonusService = new BonusServiceDTO();
        bonusService.setServiceID(serviceID);
        bonusService.setServiceName(serviceName);
        bonusService.setServicePrice(servicePrice);
        bonusService.setDescriptions(descriptions);
        bonusService.setImage(image);

        // Gọi phương thức updateBonusService từ DAO để cập nhật dịch vụ
        BonusServiceDAO bonusServiceDAO = new BonusServiceDAO();
        try {
            boolean updated = bonusServiceDAO.updateBonusService(bonusService);
            if (updated) {
                // Nếu cập nhật thành công, chuyển hướng đến trang thành công hoặc thông báo thành công
                  RequestDispatcher rd = request.getRequestDispatcher("ViewServiceServlet");
            rd.forward(request, response);
            } else {
                // Nếu không, chuyển hướng đến trang lỗi hoặc thông báo lỗi
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý ngoại lệ nếu có
            e.printStackTrace();
            // Chuyển hướng đến trang lỗi hoặc thông báo lỗi
            response.sendRedirect("error.jsp");
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
