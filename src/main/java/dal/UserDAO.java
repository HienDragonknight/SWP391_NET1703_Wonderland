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

    String ID = "";

    public UserDTO checkLogin(String email, String password) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    ID += userID;
                    String fullName = rs.getString("fullName");
                    String phoneNum = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleID");
                    result = new UserDTO(ID, fullName, email, "", phoneNum, avatar, roleID);
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
                String sql = "SELECT userID, fullname, email, password, phone, avatar, roleID FROM [Users]";
                //create statement obj
                stm = con.prepareStatement(sql);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    int userID = rs.getInt("userID");
                    ID += userID;
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleID");
                    //5.1.2 set data into properties of DTO
                    UserDTO dto = new UserDTO(ID, fullName, email, password, phoneNumber, avatar, roleID);
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

    public void checkUser(String user) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "SELECT u.userID, u.fullname, u.email, u.phone, r.roleDetails FROM [Users] u JOIN [Role] r ON r.roleID = u.roleID WHERE u.fullname = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + user + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int userID = rs.getInt("userID");
                    ID += userID;
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String phoneNum = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleID");
                    UserDTO dto = new UserDTO(ID, fullName, email, "", phoneNum, avatar, roleID);
                    if (this.listUser == null) {
                        this.listUser = new ArrayList<>();
                    }
                    this.listUser.add(dto);
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
    }

    public UserDTO registerUser(String fullname, String email, String password, String phone) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            con = DBUtils.createConnection();
            if (con != null) {
                // Define your SQL query for user registration
                String sql = "INSERT INTO Users (email, password, fullname, phone) VALUES (?, ?, ?, ?)";

                // Use PreparedStatement for safe SQL query execution
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                stm.setString(3, fullname);
                stm.setString(4, phone);

                // Execute the insert query
                int affectedRows = stm.executeUpdate();

                // Check if any rows were affected
                if (affectedRows > 0) {
                    // Retrieve the generated keys (if any)
                    rs = stm.getGeneratedKeys();
                    if (rs.next()) {
                        int userID = rs.getInt(1); // Assuming userID is an auto-generated key
                        // Retrieve other user details if needed
                        ID += userID;
                        // Create the UserDTO object with the retrieved data
                        result = new UserDTO(ID, fullname, email, "", phone, "", "");
                    }
                }
            }
        } finally {
            // Close resources in a 'finally' block to ensure they are always closed
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

    public boolean userExists(String email) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();

                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // If count is greater than 0, user exists
                }
            }
        } finally {
            // Close resources in a 'finally' block to ensure they are always closed
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

        return false; // Default to false if an exception occurs
    }

    public boolean deleteUser(String email) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "DELETE FROM [Users] WHERE fullname = ?";
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

    public UserDTO editCustomerProfile(String email, String fullname, String phone, String password, String emailConfirm) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        UserDTO result = null;
        try {
            conn = DBUtils.createConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("UPDATE users SET fullname=?, email=?, phone=?, password=? WHERE email=?");
                ptm.setString(1, fullname);
                ptm.setString(2, email);
                ptm.setString(3, phone);
                ptm.setString(4, password);
                ptm.setString(5, emailConfirm);
                int effectRows = ptm.executeUpdate();
                //process
                if (effectRows > 0) {
                    result = new UserDTO(ID, fullname, email, password, phone, email, ID);
                }
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
        return result;
    }
}
