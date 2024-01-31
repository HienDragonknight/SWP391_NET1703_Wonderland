/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import models.BonusServiceDTO;
import models.LocationDTO;
import models.PackageDTO;
import models.ThemeDTO;
import util.DBUtils;

/**
 *
 * @author phanv
 */


public class HostDAO {

    public boolean addTheme(ThemeDTO theme) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [Themes] (themeName) VALUES(?)";
        try {
            conn = DBUtils.createConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, theme.getThemeName());
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public boolean addPakage(PackageDTO pakage) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [Packages] (packageName, unitPrice, image, video, description) VALUES (?,?,?,?,?)";
        try {
            conn = DBUtils.createConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
              //  ptm.setString(1, pakage.getPakageName());
                ptm.setDouble(2, pakage.getUnitPrice());
                ptm.setString(3, pakage.getImage());
                ptm.setString(4, pakage.getVideo());
                ptm.setString(5, pakage.getDescription());
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }
    
        public boolean addBonusService(BonusServiceDTO bonusService) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [BonusServices] (serviceName, servicePrice, descriptions, image) VALUES (?,?,?,?)";
        try {
            conn = DBUtils.createConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, bonusService.getServiceName());
                ptm.setDouble(2, bonusService.getServicePrice());
                ptm.setString(3, bonusService.getDescriptions());
                ptm.setString(4, bonusService.getImage());
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }
        
        
    public boolean addLocation(LocationDTO location) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [Location] (locationDetails) VALUES (?)";
        try {
            conn = DBUtils.createConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, location.getLocationDetails());
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }
}
