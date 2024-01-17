/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hp
 */
public class DBUtils {
    
    private static final String DB_NAME = "PartyForKids";
    private static final String DB_USERNAME = "sa";
    private static final String DB_PASS = "12345";
    
    public static Connection createConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        Connection con = DriverManager.getConnection(url, DB_USERNAME, DB_PASS);
        
        return con;
    }
}
