/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import models.OrderDetailDTO;
import models.UserDTO;
import util.DBUtils;

/**
 *
 * @author Le Huu Huy
 */
public class OrderDetailDAO implements Serializable {
    
    List<OrderDetailDTO> listOrder;
    
    public List<OrderDetailDTO> getListOrder() {
        return listOrder;
    }
    
    public void getOrder() throws SQLException, ClassNotFoundException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            // create connection
            con = DBUtils.createConnection();
            if (con != null) {
                // create sql string
                String sql = "SELECT p.packageName, totalPrice, email, phone, fullname, status, od.dateOrder, od.dateStart ,sv.serviceName,  numberOfPeople, t.themeName, l.locationDetails, notes, payment "
                        + "FROM [Order] o "
                        + "JOIN OrderDetails od ON o.orderDetailID = od.orderDetailID "
                        + "JOIN Packages p ON p.packageID = od.packageID "
                        + "JOIN BonusServices sv ON sv.serviceID = od.serviceID "
                        + "JOIN Themes t ON t.themeID = od.themeID "
                        + "JOIN Location l ON l.locationID = od.locationID";
                // create statement obj
                stm = con.prepareStatement(sql);
                // execute query
                rs = stm.executeQuery();
                // process
                while (rs.next()) {
                    String fullName = rs.getString("fullname");
                    String packageName = rs.getString("packageName");
                    
                    Date dateStart = rs.getDate("dateStart");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String dateString = dateFormat.format(dateStart);
                    
                    Date dateOrder = rs.getDate("dateOrder");
                    SimpleDateFormat dateOrderFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String dateOrderString = dateOrderFormat.format(dateOrder);
                    
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String service = rs.getString("serviceName");
                    int amount = rs.getInt("numberOfPeople");
                    String theme = rs.getString("themeName");
                    String location = rs.getString("locationDetails");
                    String note = rs.getString("notes");
                    String payment = rs.getString("payment");
                    
                    OrderDetailDTO dto = new OrderDetailDTO(fullName, packageName, dateString, dateOrderString, totalPrice, status, email, phone, service, amount, theme, location, note, payment);
                    
                    if (this.listOrder == null) {
                        this.listOrder = new ArrayList<>();
                    }
                    this.listOrder.add(dto);
                }
            }
        } finally {
            // close resources in a finally block
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    // reference from ExecutingPaymentPaypal
    public boolean insertOrderDetail(Map<String, String> orderDetailInfo, Map<String, String> orderInfo) throws SQLException {
        
        boolean check = false;
        Connection conn = null;
        CallableStatement ctm = null;
        
        String insertProcedure = "{call InsertOrderDetail(?,?,?,?,?,?,?,?,?,?,?,?)}";
        
        try {
            conn = DBUtils.createConnection();
            ctm = conn.prepareCall(insertProcedure);
            
            ctm.setString(1, orderDetailInfo.get("serviceID"));
            ctm.setString(2, orderDetailInfo.get("packgeID"));
            ctm.setString(3, orderDetailInfo.get("checkinTime"));
            ctm.setString(4, orderDetailInfo.get("numOfChildren"));
            ctm.setString(5, orderDetailInfo.get("themeID"));
            ctm.setString(6, orderDetailInfo.get("locationID"));
            ctm.setString(7, orderDetailInfo.get("note"));
            ctm.setString(8, orderDetailInfo.get("paymentMethod"));
            ctm.setString(9, orderInfo.get("fullName"));
            ctm.setString(10, orderInfo.get("phone"));
            ctm.setString(11, orderInfo.get("email"));
            ctm.setString(12, orderInfo.get("orderInsertedID"));
            
            check = ctm.executeUpdate() > 0 ? true : false;
            
        } catch (Exception e) {
        } finally {
            if (ctm != null) {
                ctm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return check;
    }
    
    public boolean updateDateTimeStart(String dateStart, String timeStart, String orderDetailID) throws ClassNotFoundException, SQLException {
        
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "UPDATE [[OrderDetails]] SET dateStart = ? WHERE orderDetailID = ?";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, dateStart + " " + timeStart);
                stm.setString(2, orderDetailID);
                //execute query
                check = stm.executeUpdate() > 0 ? true : false;
            }//end connection is available
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
        
    }
}
