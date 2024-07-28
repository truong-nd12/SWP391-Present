/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class NewsTypeDAO extends DBContext {

    public List<New_Types> getAllNews_Type() {
        List<New_Types> list = new ArrayList();
        try {
            String sql = "select * from News_Type";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new New_Types(id, name));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public New_Types getNewsTypeById(int id) {
        try {
            String sql = "select * from News_Type where news_type_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getNString(2);
                return new New_Types(id, name);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public String getNewsIdByName(String name) {
        String s="";
        try {
            String sql = "select * from News_Type where type_name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                return id+"";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return s;
    }
    public String getNewsNameById(int id) {
        try {
            String sql = "select * from News_Type where news_type_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                return name;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
