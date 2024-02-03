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
                String sql = "SELECT os.orderDetailID, os.dateOrder, os.dateStart, os.numberOfPeople, os.notes, o.totalPrice, u.fullname, bs.serviceName, p.packageName, t.themeName, l.locationDetails, o.status "
                        + "FROM OrderDetails os "
                        + "JOIN [Order] o ON o.orderID = os.orderID "
                        + "JOIN users u ON u.userID = o.userID "
                        + "JOIN [BonusServices] bs ON bs.serviceID = os.serviceID "
                        + "JOIN [Packages] p ON p.packageID = os.packageID "
                        + "JOIN [Themes] t ON t.themeID = os.themeID "
                        + "JOIN [Location] l ON l.locationID = os.locationID";
                // create statement obj
                stm = con.prepareStatement(sql);
                // execute query
                rs = stm.executeQuery();
                // process
                while (rs.next()) {
                    String orderDetailID = rs.getString("orderDetailID");
                    String userName = rs.getString("fullname");
                    String service = rs.getString("serviceName");
                    String packages = rs.getString("packageName");
                    String dateStart = rs.getString("dateStart");
                    String dateOrder = rs.getString("dateOrder");
                    String amountPeople = rs.getString("numberOfPeople");
                    String theme = rs.getString("themeName");
                    String location = rs.getString("locationDetails");
                    String price = rs.getString("totalPrice");
                    String note = rs.getString("notes");
                    String status = rs.getString("status");
                    
                    OrderDetailDTO dto = new OrderDetailDTO(orderDetailID, userName, service, packages, dateStart, dateOrder, amountPeople, theme, location, price, note, status);
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
