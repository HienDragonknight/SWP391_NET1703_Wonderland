/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBUtils;

public class FeedbackDao {

        
          private static final String INSERT_FEEDBACK_SQL = "INSERT INTO feedback (userID, content) VALUES (?, ?)";
    private static final String SELECT_ALL_FEEDBACKS_SQL = "SELECT * FROM feedback";
        public void insertFeedback(String userID, String content) throws SQLException, ClassNotFoundException {
                            int user= Integer.parseInt(userID);

        try (            
              Connection  conn = DBUtils.createConnection();
                PreparedStatement preparedStatement = conn.prepareStatement(INSERT_FEEDBACK_SQL)) {
            preparedStatement.setInt(1, user);
            preparedStatement.setString(2, content);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

//    public List<Feedback> selectAllFeedbacks() {
//        List<Feedback> feedbacks = new ArrayList<>();
//        try (Connection connection = getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FEEDBACKS_SQL)) {
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                int userID = rs.getInt("userID");
//                String content = rs.getString("content");
//                String create_at = rs.getString("create_at");
//                feedbacks.add(new Feedback(userID, content, create_at));
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return feedbacks;
//    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

