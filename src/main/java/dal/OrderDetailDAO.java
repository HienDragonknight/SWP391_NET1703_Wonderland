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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import models.OrderDetailDTO;
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

    public void getOrder() throws SQLException, ClassNotFoundException {
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
                    Date dateOrder = rs.getDate("dateOrder");
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

                    OrderDetailDTO dto = new OrderDetailDTO(fullName, packageName, dateStart, dateOrder, totalPrice, status, email, phone, service, amount, theme, location, note, payment);

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

    public  List<OrderDetailDTO>  getOrderDetailID(String orderDetail) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDetailDTO> listOrder = new ArrayList<>();
        try {
            // create connection
            con = DBUtils.createConnection();
            if (con != null) {
                // create sql string
                String sql = "SELECT  od.orderDetailID, p.packageName, totalPrice, email, phone, fullname, status, od.dateOrder, od.dateStart ,sv.serviceName,  numberOfPeople, t.themeName, l.locationDetails, notes, payment \n" +
"                         FROM [Order] o \n" +
"                         JOIN OrderDetails od ON o.orderDetailID = od.orderDetailID \n" +
"                         JOIN Packages p ON p.packageID = od.packageID \n" +
"                         JOIN BonusServices sv ON sv.serviceID = od.serviceID \n" +
"                         JOIN Themes t ON t.themeID = od.themeID \n" +
"                         JOIN Location l ON l.locationID = od.locationID\n" +
"						 Where od.orderDetailID = "+orderDetail;
                // create statement obj
                stm = con.prepareStatement(sql);
                // execute query
                rs = stm.executeQuery();
                // process
                while (rs.next()) {
                    int orderDetailID = rs.getInt("orderDetailID");
                    String fullName = rs.getString("fullname");
                    String packageName = rs.getString("packageName");
                    Date dateStart = rs.getDate("dateStart");
                    Date dateOrder = rs.getDate("dateOrder");
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

                    OrderDetailDTO dto = new OrderDetailDTO(orderDetailID, fullName, packageName, dateStart, dateOrder, totalPrice, status, email, phone, service, amount, theme, location, note, payment);

                    if (this.listOrder == null) {
                        this.listOrder = new ArrayList<>();
                    }
                   listOrder.add(dto);
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
        return listOrder;
    }

     public OrderDetailDTO getOrderDetailIDNew(String orderDetail) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDetailDTO> listOrder = new ArrayList<>();
        try {
            // create connection
            con = DBUtils.createConnection();
            if (con != null) {
                // create sql string
                String sql = "SELECT  od.orderDetailID, p.packageName, totalPrice, email, phone, fullname, status, od.dateOrder, od.dateStart ,sv.serviceName,  numberOfPeople, t.themeName, l.locationDetails, notes, payment \n" +
"                         FROM [Order] o \n" +
"                         JOIN OrderDetails od ON o.orderDetailID = od.orderDetailID \n" +
"                         JOIN Packages p ON p.packageID = od.packageID \n" +
"                         JOIN BonusServices sv ON sv.serviceID = od.serviceID \n" +
"                         JOIN Themes t ON t.themeID = od.themeID \n" +
"                         JOIN Location l ON l.locationID = od.locationID\n" +
"						 Where od.orderDetailID = "+orderDetail;
                // create statement obj
                stm = con.prepareStatement(sql);
                // execute query
                rs = stm.executeQuery();
                // process
                while (rs.next()) {
                    int orderDetailID = rs.getInt("orderDetailID");
                    String fullName = rs.getString("fullname");
                    String packageName = rs.getString("packageName");
                    Date dateStart = rs.getDate("dateStart");
                    Date dateOrder = rs.getDate("dateOrder");
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

                    OrderDetailDTO dto = new OrderDetailDTO(orderDetailID, fullName, packageName, dateStart, dateOrder, totalPrice, status, email, phone, service, amount, theme, location, note, payment);

                
                   return dto;
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
        return null;
    }


    public boolean insertOrderDetail(Map<String, String> orderDetailInfo, Map<String, String> orderInfo) throws SQLException {

        boolean check = false;
        Connection conn = null;
        CallableStatement ctm = null;

        String insertProcedure = "{call InsertOrderDetail(?,?,?,?,?,?,?,?,?,?,?)}";

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
    
    public boolean deleteOrderDetail(int orderDetailID) throws SQLException, ClassNotFoundException {
    Connection con = null;
    PreparedStatement stm = null;
    boolean result = false;
    try {
        con = DBUtils.createConnection();
        if (con != null) {
            String sql = "DELETE FROM [orderDetails] WHERE orderDetailID = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, orderDetailID);

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        }
    } finally {
        if (stm != null) {
            stm.close();
        }
        if (con != null) {
            con.close();
        }
    }

    return result;
}
    
        public int updateOrderDetail(int orderDetailID, int serviceID, int packageID, String dateStart, 
                                  int numberOfPeople, int themeID, int locationID, String notes, String payment) throws ClassNotFoundException {
        // SQL query to update order detail
        String sql = "UPDATE OrderDetails SET serviceID = ?, packageID = ?, dateStart = ?, " +
                "numberOfPeople = ?, themeID = ?, locationID = ?, notes = ?, payment = ? WHERE orderDetailID = ?";

        // Try-with-resources to automatically close resources
        try (
            // Establishing database connection
            Connection conn = DBUtils.createConnection();
            // Creating prepared statement
            PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            // Setting parameters
            stmt.setInt(1, serviceID);
            stmt.setInt(2, packageID);
            stmt.setString(3, dateStart);
            stmt.setInt(4, numberOfPeople);
            stmt.setInt(5, themeID);
            stmt.setInt(6, locationID);
            stmt.setString(7, notes);
            stmt.setString(8, payment);
            stmt.setInt(9, orderDetailID);

            // Executing update query
            int rowsAffected = stmt.executeUpdate();
            
            return rowsAffected; // Return number of rows affected
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Return 0 if update fails
        }
    }
}
