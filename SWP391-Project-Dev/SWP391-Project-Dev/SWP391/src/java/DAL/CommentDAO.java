/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Comment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CommentDAO extends DBContext{
    public List<Comment> getAllComment(int n_id) {
        List<Comment> list = new ArrayList();
        try {
            String sql = "select * from Comment where new_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, n_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int new_id = rs.getInt(2);
                int cus_id = rs.getInt(3);
                String content = rs.getString(4);
                list.add(new Comment(id, cus_id, new_id, content));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public void addComment(int new_id,int cus_id, String content) {
        try {
            String sql = "insert into Comment"
                    + " values (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, new_id);
            ps.setInt(2, cus_id);
            ps.setString(3, content);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public int countComment(int new_id) {
        try {
            String sql = "select count(*) from Comment where new_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, new_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int num=rs.getInt(1);
                return num;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }
}
