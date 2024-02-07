/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import models.UserDTO;
import util.DBUtils;

/**
 *
 * @author phanv
 */
public class CustomerDAO {
        public boolean editCustomerProfile(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.createConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("UPDATE [User] SET fullname=?, phone=?, avatar=?, password=? WHERE roleID=1");
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getPhoneNumber());
                ptm.setString(3, user.getAvatar());
                ptm.setString(4, user.getPassword());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
