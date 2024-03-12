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

    private final String GET_BONUS_SERVICE_LIST = "SELECT serviceID, serviceName, servicePrice, descriptions, image FROM [BonusServices]";

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
                String serviceID = rs.getInt("serviceID") + "";
                String serviceName = rs.getString("serviceName");
                double servicePrice = rs.getDouble("servicePrice");
                String descriptions = rs.getString("descriptions");
                String image = rs.getString("image");

                listTheme.add(new BonusServiceDTO(serviceID, serviceName, servicePrice, descriptions, image));

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
    
    private final String DELETE_BONUS_SERVICE = "DELETE FROM BonusServices WHERE serviceID = ?";
    private final String UPDATE_BONUS_SERVICE = "UPDATE BonusServices SET serviceName = ?, servicePrice = ?, descriptions = ?, [image] = ? WHERE serviceID = ?";

    // Phương thức xóa dịch vụ bổ sung
    public boolean deleteBonusService(String serviceID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;

     
            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(DELETE_BONUS_SERVICE);
            ptm.setString(1, serviceID);

            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;
        
    }

    // Phương thức cập nhật dịch vụ bổ sung
    public boolean updateBonusService(BonusServiceDTO bonusService) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(UPDATE_BONUS_SERVICE);
            ptm.setString(1, bonusService.getServiceName());
            ptm.setDouble(2, bonusService.getServicePrice());
            ptm.setString(3, bonusService.getDescriptions());
            ptm.setString(4, bonusService.getImage());
            ptm.setString(5, bonusService.getServiceID());

            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0;
        } finally {
            conn.close();
        }
    }
}
