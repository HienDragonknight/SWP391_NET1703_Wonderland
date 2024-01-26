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
import java.util.List;
import models.UserDTO;
import util.DBUtils;

/**
 *
 * @author Le Huu Huy
 */
public class UserDAO implements Serializable {

    public UserDTO checkLogin(String email, String password) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM [User] WHERE email = ? AND password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String phoneNum = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    int roleID = rs.getInt("roleID");
                    result = new UserDTO(fullName, email, "" , phoneNum, avatar, roleID);
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
        return result;
    }

    public List<UserDTO> getUser() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<UserDTO> listUser = new ArrayList<UserDTO>();

        try {

            conn = DBUtils.createConnection();
            String sql = "SELECT fullname, password, email, phone, avatar, roleID FROM [User]";
            ptm = conn.prepareStatement(sql);

            rs = ptm.executeQuery();

            while (rs.next()) {
                String fullName = rs.getString("fullname");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                int roleID = rs.getInt("roleID");

                listUser.add(new UserDTO(fullName, email, password, phone, avatar, roleID));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listUser;
    }
}
