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
import java.util.AbstractList;
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
                    int userID = rs.getInt("userID");
                    String fullName = rs.getString("fullName");
                    String phoneNum = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleID");
                    result = new UserDTO(userID, fullName, email, "", phoneNum, avatar, roleID);
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

    List<UserDTO> listUser;

    public List<UserDTO> getListUser() {
        return listUser;
    }

    public void getUser() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "SELECT userID, fullname, email, password, phone, avatar, roleID FROM [User]";
                //create statement obj
                stm = con.prepareStatement(sql);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    int userID = rs.getInt("userID");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleID");
                    //5.1.2 set data into properties of DTO
                    UserDTO dto = new UserDTO(userID, fullName, email, password, phoneNumber, avatar, roleID);
                    //5.1.3 add DTO into list
                    if (this.listUser == null) {
                        this.listUser = new ArrayList<>();
                    }//end accounts had not existed
                    this.listUser.add(dto);
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
    
    public boolean deleteUser(String email) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "DELETE FROM [User] WHERE fullname = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
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
