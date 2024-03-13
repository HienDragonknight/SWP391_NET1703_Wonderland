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
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.OrderDTO;
import models.OrderDetailDTO;
import models.UserDTO;
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

            //          OrderDTO dto = new OrderDTO(orderID, fullName, createDate, totalPrice, status);
            if (this.listOrder == null) {
                this.listOrder = new ArrayList<>();
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
    }

    public double getChartInYear(int year) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        double totalPrice = 0.0;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "SELECT sum(totalprice) as totalPrice from [Order] WHERE month(create_at) = ?";
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

    public boolean insertOrderWithLogin(UserDTO userLogin) throws SQLException {

        boolean check = false;

        Connection conn = null;
        CallableStatement ctm = null;

        String insertOrderStatement = "{call InsertOrder(?,?,?,?)}";

        try {
            conn = DBUtils.createConnection();
            ctm = conn.prepareCall(insertOrderStatement);
            ctm.setString(1, userLogin.getUserID());
            ctm.setString(2, userLogin.getEmail());
            ctm.setString(3, userLogin.getPhoneNumber());
            ctm.setString(4, userLogin.getFullName());

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

    public List<OrderDetailDTO> getOnOrderList(String userIDInput, String statusInput) throws SQLException, ClassNotFoundException {

        Connection conn = null;
        CallableStatement ctm = null;
        ResultSet rs = null;
        List<OrderDetailDTO> listOrder = new ArrayList<OrderDetailDTO>();

        try {
            conn = DBUtils.createConnection();
            String getOnGoingOrder = "{ ? = call GetOrderList(?, ?) }";

            ctm = conn.prepareCall(getOnGoingOrder);
            ctm.registerOutParameter(1, Types.REF_CURSOR);
            ctm.setString(2, userIDInput);
            ctm.setString(3, statusInput);
            ctm.execute(); // Execute the CallableStatement

            // Retrieve the result set
            rs = ctm.getResultSet();

            while (rs.next()) {
                String packageName = rs.getString("packageName");
                Date dateStart = rs.getDate("dateStart");
                Date createdAt = rs.getTimestamp("create_at");
                int numberOfPeople = rs.getInt("numberOfPeople");
                String locationDetails = rs.getString("locationDetails");
                double totalPrice = rs.getDouble("totalPrice");
                String status = rs.getString("status");
                listOrder.add(new OrderDetailDTO(packageName, dateStart, createdAt, numberOfPeople, locationDetails, totalPrice, status));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ctm != null) {
                    ctm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listOrder;
    }

}
