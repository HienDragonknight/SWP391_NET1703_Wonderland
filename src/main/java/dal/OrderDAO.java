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
import java.sql.Timestamp;
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

public  List<OrderDTO> getNewOrderUserName() throws ClassNotFoundException, SQLException {
    List<OrderDTO> listOrder = new ArrayList<>();
    try (Connection con = DBUtils.createConnection()) {
        if (con != null) {
            String sql = "SELECT o.*, u.fullName as userName FROM [order] o INNER JOIN users u ON o.userID = u.userID";
            try (PreparedStatement stm = con.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    int userID = rs.getInt("userID");
                    Timestamp createDate = rs.getTimestamp("create_at");
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String fullName = rs.getString("userName"); // Assumed column name from JOIN
                    String userName = rs.getString("userName"); // Assumed column name from JOIN
                    // Assume these columns exist, else set default values or handle nullability                    int userID = rs.getInt("userID");
                    int orderDetaiID = rs.getInt("orderDetailID");

                 //   String orderDetaiID = rs.getString("orderDetaiID ");

                    OrderDTO dto = new OrderDTO(orderID, userID+"", createDate, totalPrice, status, email, phone, fullName, orderDetaiID+"", userName);
                    listOrder.add(dto);
                }
            }
        }
    } // try-with-resources will auto close Connection, PreparedStatement, and ResultSet
      for (OrderDTO orderDTO : listOrder) {
          System.out.println(orderDTO.toString());
    }
        return listOrder;
      
}


public  OrderDTO getNewOrderUserNamebyID(String id) throws ClassNotFoundException, SQLException {
    try (Connection con = DBUtils.createConnection()) {
        if (con != null) {
            String sql = "SELECT o.*, u.fullName as userName FROM [order] o INNER JOIN users u ON o.userID = u.userID Where orderID ="+id;
            try (PreparedStatement stm = con.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    int userID = rs.getInt("userID");
                    Timestamp createDate = rs.getTimestamp("create_at");
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String fullName = rs.getString("userName"); // Assumed column name from JOIN
                    String userName = rs.getString("userName"); // Assumed column name from JOIN
                    // Assume these columns exist, else set default values or handle nullability                    int userID = rs.getInt("userID");
                    int orderDetaiID = rs.getInt("orderDetailID");

                 //   String orderDetaiID = rs.getString("orderDetaiID ");

                    OrderDTO dto = new OrderDTO(orderID, userID+"", createDate, totalPrice, status, email, phone, fullName, orderDetaiID+"", userName);
                     return dto;
                }
            }
        }
    } // try-with-resources will auto close Connection, PreparedStatement, and ResultSet
      for (OrderDTO orderDTO : listOrder) {
          System.out.println(orderDTO.toString());
    }
        return null;
      
}


    public double getChartInYear(int year) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        double totalPrice = 0.0;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "  SELECT sum(totalprice) as totalPrice from [Order] WHERE year(create_at) = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, year);
                rs = stm.executeQuery();
                if (rs.next()) {
                    totalPrice = rs.getDouble("totalPrice");
                }
            }
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

        return totalPrice;
    }
    
    public boolean deleteOrder(int orderDetailID) throws SQLException, ClassNotFoundException {
    Connection con = null;
    PreparedStatement stm = null;
    boolean result = false;

    try {
        con = DBUtils.createConnection();
        if (con != null) {
            String sql = "DELETE FROM [Order] WHERE orderDetailID = ?";
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

}
