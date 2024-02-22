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
                String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND reported IS NULL";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);    
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String phoneNum = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleID");
                    String reported = rs.getString("reported");
                    result = new UserDTO(roleID, fullName, email, password, phoneNum, avatar, roleID, reported);
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
                String sql = "SELECT userID, fullname, email, password, phone, avatar, r.roleDetails, reported FROM users u JOIN [Role] r ON u.roleID = r.roleID WHERE u.roleID = 1";
                //create statement obj
                stm = con.prepareStatement(sql);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleDetails");
                    String reported = rs.getString("reported");
                    //5.1.2 set data into properties of DTO
                    UserDTO dto = new UserDTO(ID, fullName, email, password, phoneNumber, avatar, roleID, reported);
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

    List<UserDTO> listHost;

    public List<UserDTO> getListHost() {
        return listHost;
    }

    public void getHost() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "SELECT userID, fullname, email, password, phone, avatar, r.roleDetails, reported FROM users u JOIN [Role] r ON u.roleID = r.roleID WHERE u.roleID = 3";
                //create statement obj
                stm = con.prepareStatement(sql);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleDetails");
                    String reported = rs.getString("reported");
                    //5.1.2 set data into properties of DTO
                    UserDTO dto = new UserDTO(userID, fullName, email, password, phoneNumber, avatar, roleID, reported);
                    //5.1.3 add DTO into list
                    if (this.listHost == null) {
                        this.listHost = new ArrayList<>();
                    }//end accounts had not existed
                    this.listHost.add(dto);
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
                String sql = "DELETE FROM users WHERE email = ?";
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

    public boolean manageAccount(String fullName, String email, String password, String phone) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "insert into users (fullname, email, password, phone, avatar, roleID, reported) values(?, ?, ?, ?, 'default.png', 3, NULL)";
                stm = con.prepareStatement(sql);
                stm.setString(1, fullName);
                stm.setString(2, email);
                stm.setString(3, password);
                stm.setString(4, phone);
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
    
    public UserDTO updateHost(String name, String phone, String email) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
//        boolean result = false;
        UserDTO result = null;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "UPDATE users SET fullname = ?, phone = ? WHERE email = ?";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, phone);
                stm.setString(3, email);
                //execute query
                int effectRows = stm.executeUpdate();
                //process
                if (effectRows > 0) {
                    result = new UserDTO(ID, name, email, phone, phone, name, ID, phone);
                }
            }//end connection is available
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
    
    public boolean registerUser(String fullName, String email, String password, String phone) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtils.createConnection();
            if (con != null) {
                String sql = "insert into users (fullname, email, password, phone, avatar, roleID, reported) values(?, ?, ?, ?, 'default.png', 1, NULL)";
                stm = con.prepareStatement(sql);
                stm.setString(1, fullName);
                stm.setString(2, email);
                stm.setString(3, password);
                stm.setString(4, phone);
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
    
    public UserDTO updateAccount(String name, String phone, String email, String password) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
//        boolean result = false;
        UserDTO result = null;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "UPDATE users SET fullname = ?, phone = ?, email = ?, password = ? WHERE email = ?";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, phone);
                stm.setString(3, email);
                stm.setString(4, password);
                stm.setString(5, email);
                //execute query
                int effectRows = stm.executeUpdate();
                //process
                if (effectRows > 0) {
                    result = new UserDTO(ID, name, email, password, phone, email, ID, phone);
                }
            }//end connection is available
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
    
    public void searchByEmail(String email) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "SELECT userID, fullname, email, password, phone, avatar, r.roleDetails, reported FROM users u JOIN [Role] r ON u.roleID = r.roleID WHERE u.email = ?";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullname");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    String roleID = rs.getString("roleDetails");
                    String reported = rs.getString("reported");
                    //5.1.2 set data into properties of DTO
                    UserDTO dto = new UserDTO(userID, fullName, email, password, phoneNumber, avatar, roleID, reported);
                    //5.1.3 add DTO into list
                    if (this.listHost == null) {
                        this.listHost = new ArrayList<>();
                    }//end accounts had not existed
                    this.listHost.add(dto);
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
