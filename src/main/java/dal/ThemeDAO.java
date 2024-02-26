/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.ThemeDTO;
import util.DBUtils;

/**
 *
 * @author bao.kun
 */
public class ThemeDAO {

    private final String GET_THEME_LIST = "SELECT themeID, themeName, themeImagePath FROM [Themes]";
    
    List<ThemeDTO> listTheme;

    public List<ThemeDTO> getListTheme() {
        return listTheme;
    }

    public List<ThemeDTO> getListThemes() throws SQLException {

        List<ThemeDTO> listTheme = new ArrayList<ThemeDTO>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {

            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(GET_THEME_LIST);
            rs = ptm.executeQuery();

            while (rs.next()) {
                String themID = rs.getInt("themeID") + "";
                String themeName = rs.getString("themeName");
                String themeImagePath = rs.getString("themeImagePath");

                listTheme.add(new ThemeDTO(themID, themeName));
            }

        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return listTheme;
    }
    
    public void printTheme() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //create connection
            con = DBUtils.createConnection();
            if (con != null) {
                //create sql string
                String sql = "SELECT themeID, themeName FROM Themes";
                //create statement obj
                stm = con.prepareStatement(sql);
                //execute query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    String id = rs.getString("themeID");
                    String name = rs.getString("themeName");
                    //5.1.2 set data into properties of DTO
                    ThemeDTO dto = new ThemeDTO(id, name);
                    //5.1.3 add DTO into list
                    if (this.listTheme == null) {
                        this.listTheme = new ArrayList<>();
                    }//end accounts had not existed
                    this.listTheme.add(dto);
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
