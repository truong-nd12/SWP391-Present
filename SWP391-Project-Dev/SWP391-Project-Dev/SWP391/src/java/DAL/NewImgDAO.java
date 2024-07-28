/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Dell
 */
public class NewImgDAO extends DBContext{
    public String getNewsImgURLById(int id) {
        try {
            String sql = "select * from News_img where img_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String url = rs.getString(2);
                return url;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
