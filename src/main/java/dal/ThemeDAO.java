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

}
