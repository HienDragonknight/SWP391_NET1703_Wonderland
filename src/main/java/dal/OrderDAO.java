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
import models.OrderDTO;
import util.DBUtils;

/**
 *
 * @author Le Huu Huy
 */
public class OrderDAO implements Serializable {

    List<OrderDTO> listOrder;

    public List<OrderDTO> getListOrder() {
        return listOrder;
    }

    public void getOrder() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "SELECT p.packageName, create_at, totalPrice, email, phone, fullname, status "
                        + "FROM [Order] o "
                        + "JOIN OrderDetails od ON o.orderDetailID = od.orderDetailID "
                        + "JOIN Packages p ON p.packageID = od.packageID";
                //create statement obj
                stm = con.prepareStatement(sql);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    Date createDate = rs.getDate("create_at");
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String fullName = rs.getString("fullname");
                    String packageName = rs.getString("packageName");
                    //5.1.2 set data into properties of DTO
                    OrderDTO dto = new OrderDTO("", "", createDate, totalPrice, status, email, phone, fullName, packageName);
                    //5.1.3 add DTO into list
                    if (this.listOrder == null) {
                        this.listOrder = new ArrayList<>();
                    }//end accounts had not existed
                    this.listOrder.add(dto);
                    //5.2 done
                }//end traverse rs
            }//end connection is available
        } finally {
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
