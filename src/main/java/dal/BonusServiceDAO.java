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
import models.BonusServiceDTO;
import util.DBUtils;

/**
 *
 * @author bao.kun
 */
public class BonusServiceDAO {

    private final String GET_BONUS_SERVICE_LIST = "SELECT seviceID, serviceName, servicePrice, descriptions, image FROM [BonusServices]";

    public List<BonusServiceDTO> getBonusServiceList() throws SQLException {

        List<BonusServiceDTO> listTheme = new ArrayList<BonusServiceDTO>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {

            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(GET_BONUS_SERVICE_LIST);
            rs = ptm.executeQuery();

            while (rs.next()) {
                String seviceID = rs.getInt("seviceID") + "";
                String serviceName = rs.getString("serviceName");
                double servicePrice = rs.getDouble("servicePrice");
                String descriptions = rs.getString("descriptions");
                String image = rs.getString("image");

                listTheme.add(new BonusServiceDTO(seviceID, serviceName, servicePrice, descriptions, image));

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
