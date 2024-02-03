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
import models.PackageDTO;
import util.DBUtils;

/**
 *
 * @author bao.kun
 */
public class PackageDAO {

    private static final String GET_LIST_PACKAGE = "SELECT packageID,packageName,unitPrice,image,video,description FROM [Packages] ";
    private static final String GET_PACKAGE_BY_ID = "SELECT packageID,packageName,unitPrice,image,video,description, size FROM [Packages] WHERE packageID = ?";
    private static final String GET_LOCATION_BY_ID = "SELECT locationID, locationDetails FROM [Location] WHERE locationID = ?";

    public List<PackageDTO> getListPackage() throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<PackageDTO> listLocation = new ArrayList<PackageDTO>();

        try {

            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(GET_LIST_PACKAGE);

            rs = ptm.executeQuery();

            while (rs.next()) {

                String packageID = rs.getInt("packageID") + "";
                String packageName = rs.getString("packageName");
                double unitPrice = rs.getDouble("unitPrice");
                String image = rs.getString("image");
                String video = rs.getString("video");
                String description = rs.getString("description");

                //         listLocation.add(new PackageDTO(packageID, packageName, unitPrice, image, video, description));
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

    public PackageDTO getPackageByID(String packageID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        PackageDTO packageItem = null;
        try {

            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(GET_PACKAGE_BY_ID);
            ptm.setString(1, packageID);
            rs = ptm.executeQuery();

            while (rs.next()) {

                String packageName = rs.getString("packageName");
                double unitPrice = rs.getDouble("unitPrice");
                String image = rs.getString("image");
                String video = rs.getString("video");
                String description = rs.getString("description");
                String size = rs.getString("size");

                packageItem = new PackageDTO(packageID, packageName, unitPrice, image, video, description, size);

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
        return packageItem;

    }

    public LocationDTO getLocationToPackage(String locationID) throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        LocationDTO location = null;
        try {

            conn = DBUtils.createConnection();
            ptm = conn.prepareStatement(GET_LOCATION_BY_ID);
            ptm.setString(1, locationID);
            rs = ptm.executeQuery();

            while (rs.next()) {

                String locationDetails = rs.getString("locationDetails");
                location = new LocationDTO(locationID, locationDetails);

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
        return location;

    }

}
