/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Customer;
import Model.feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author XUAN PHUC
 */
public class FeedbackDAO extends DBContext {

    public List<feedback> getFeedbackByStar() {
        List<feedback> feedbackList = new ArrayList<>();
        String sql = "select top 10 * from feedback f left join [Order] o on o.order_id = f.orderId left join [Customer] c on c.customer_id = o.customer_id\n"
                + "where stars in (4,5) and c.active = 1  ";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt(1);
                    String content = resultSet.getString(2);
                    int productId = resultSet.getInt(3);
                    int orderId = resultSet.getInt(4);
                    Date dateSend = resultSet.getDate(5);
                    int stars = resultSet.getInt(6);
                    feedback feedback = new feedback(id, content, productId, orderId, dateSend, stars);
                    feedbackList.add(feedback);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbackList;
    }

    public String getNameById(int id) {
        String sql = "select cus_name from [Order] o inner join Customer c on o.customer_id = c.customer_id\n"
                + "where order_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public String getAvatarById(int id) {
        String sql = "select avatar from [Order] o inner join Customer c on o.customer_id = c.customer_id\n"
                + "where order_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        FeedbackDAO f = new FeedbackDAO();
        System.out.println(f.getNameById(32));
    }
    PreparedStatement ps = null;
    ResultSet rs = null;
    AdminDAO adminDAO = new AdminDAO();
    CustomerDAO customerDAO = new CustomerDAO();

    public List<feedback> getFeedbackByProductId(int pid) throws SQLException {
        String url = "select f.* from feedback f left join [Order] o on o.order_id = f.orderId left join [Customer] c on c.customer_id = o.customer_id\n"
                + "where f.productId = ? and c.active = 1 ";
        List<feedback> feedbacks = new ArrayList<>();
        try {
            ps = connection.prepareStatement(url);
            ps.setInt(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int stars = rs.getInt("stars");
                String content = rs.getString("content");
                int productId = rs.getInt("productId");
                int orderId = rs.getInt("orderId");
                Date dateSend = rs.getDate("dateSend");
                feedback feedback = new feedback(id, content, productId, orderId, dateSend, stars);
                feedbacks.add(feedback);
            }

        } catch (SQLException ex) {
            System.out.println("getFeedbackByProductId: " + ex.getMessage());
        }
        return feedbacks;
    }

    public feedback insertFeedBack(feedback Feedback, int orderId) throws SQLException {
        String url = "INSERT INTO [dbo].[feedback]\n"
                + "           ([content],[productId],[orderId],[dateSend],[stars])\n"
                + "     VALUES (?,?,?,?,?)";
        try {
            if (connection != null) {
                ps = connection.prepareStatement(url);
                ps.setString(1, Feedback.getContent());
                ps.setInt(2, Feedback.getProductId());
                ps.setInt(3, orderId);
                ps.setDate(4, new java.sql.Date(System.currentTimeMillis()));
                ps.setInt(5, Feedback.getStars());
                if (ps.executeUpdate() > 0) {
                    return getLastFeedback();
                }
            }
        } catch (Exception e) {
            System.out.println("insertfeedback " + e.getMessage());
        }
        return null;
    }

    public feedback getLastFeedback() throws SQLException {
        String url = "select top(1) * from feedback order by id desc";
        try {
            if (connection != null) {
                ps = connection.prepareStatement(url);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    int stars = rs.getInt("stars");
                    String content = rs.getString("content");
                    int productId = rs.getInt("productId");
                    int orderId = rs.getInt("orderId");
                    Date dateSend = rs.getDate("dateSend");
                    feedback Feedback = new feedback(id, content, productId, orderId, dateSend, stars);
                    return Feedback;
                }
            }
        } catch (Exception e) {
            System.out.println("getLastFeedback: " + e.getMessage());
        }
        return null;
    }

    public feedback getFeedbackById(int pid, int oid) {
        String url = "select * from feedback where productId = ? and orderId = ?";
        try {
            if (connection != null) {
                ps = connection.prepareStatement(url);
                ps.setInt(1, pid);
                ps.setInt(2, oid);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    int stars = rs.getInt("stars");
                    String content = rs.getString("content");
                    int productId = rs.getInt("productId");
                    int orderId = rs.getInt("orderId");
                    Date dateSend = rs.getDate("dateSend");
                    feedback Feedback = new feedback(id, content, productId, orderId, dateSend, stars);
                    return Feedback;
                }
            }
        } catch (Exception e) {
            System.out.println("getLastFeedback: " + e.getMessage());
        }
        return null;
    }

    public void DeleteFeedbackById(int feedbackid) {
        String url = "delete from feedback where id = ?";
        try {
            ps = connection.prepareStatement(url);
            ps.setInt(1, feedbackid);
            if (ps.executeUpdate() > 0) {
              
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
