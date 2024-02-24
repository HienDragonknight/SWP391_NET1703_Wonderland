/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
}
