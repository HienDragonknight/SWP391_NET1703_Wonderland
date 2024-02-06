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
import models.LocationDTO;
import util.DBUtils;

/**
 *
 * @author bao.kun
 */
public class LocationDAO {

    private static final String GET_LIST_LOCATION = "SELECT locationID,locationDetails FROM [Location] ";

    
     public List<LocationDTO> getListLocation() throws SQLException {

        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<LocationDTO> listLocation = new ArrayList<LocationDTO>();

        try {

            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(GET_LIST_LOCATION);
         
            rs = ptm.executeQuery();

            while (rs.next()) {
                String locationID = rs.getInt("locationID") + "";
                String locationDetails = rs.getNString("locationDetails");

                listLocation.add(new LocationDTO(locationID, locationDetails));
            }

        } catch (Exception e) {
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
        return listLocation;
    }

}
