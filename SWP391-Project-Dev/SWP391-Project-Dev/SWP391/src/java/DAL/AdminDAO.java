/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Admin;
import Model.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dell
 */
public class AdminDAO extends DBContext {


    public List<Admin> getAll(String search) {
        String sql = "select * from Admin where acc_name like ?";
        List<Admin> admin = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String password = rs.getString(3);
                int role_id = rs.getInt(4);
                boolean activate = rs.getBoolean(5);
                String email = rs.getString(6);
                String phone = rs.getString(7);
                String avatar = rs.getString(8);
                admin.add(new Admin(account_id, acc_name, password, role_id, activate, email, phone, avatar));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return admin;
    }

    public List<Admin> BanAcc(int id) {
        String sql = "update Admin set activate = 0 where acc_id = ?";
        List<Admin> admin = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            admin = getAll("");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return admin;
    }

    public List<Admin> UnBanAcc(int id) {
        String sql = "update Admin set activate = 1 where acc_id = ?";
        List<Admin> admin = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            admin = getAll("");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return admin;
    }

    public Admin getAccByNameAndPass(String name, String pass) {
        String sql = "select * from Admin where acc_name = ? and password = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String password = rs.getString(3);
                int role_id = rs.getInt(4);
                boolean activate = rs.getBoolean(5);
                String email = rs.getString(6);
                String phone = rs.getString(7);
                String avatar = rs.getString(8);
                return new Admin(account_id, acc_name, password, role_id, activate, email, phone, avatar);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Admin getAccByName(String name) {
        String sql = "select * from Admin where acc_name = ? ;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String password = rs.getString(3);
                int role_id = rs.getInt(4);
                boolean activate = rs.getBoolean(5);
                String email = rs.getString(6);
                String phone = rs.getString(7);
                String avatar = rs.getString(8);
                return new Admin(account_id, acc_name, password, role_id, activate, email, phone, avatar);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Admin getAccByEmail(String name) {
        String sql = "select * from Admin where email = ? ;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String password = rs.getString(3);
                int role_id = rs.getInt(4);
                boolean activate = rs.getBoolean(5);
                String email = rs.getString(6);
                String phone = rs.getString(7);
                String avatar = rs.getString(8);
                return new Admin(account_id, acc_name, password, role_id, activate, email, phone, avatar);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public String getAccNameById(int id) {
        String sql = "select * from Admin where acc_id= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String acc_name = rs.getString(2);
                return acc_name;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Admin addAdd(String name, String pass, String email_, String phone_) {
        String sql = "insert into Admin values(?,?,2,1,?,?,'')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pass);
            ps.setString(3, email_);
            ps.setString(4, phone_);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String password = rs.getString(3);
                int role_id = rs.getInt(4);
                boolean activate = rs.getBoolean(5);
                String email = rs.getString(6);
                String phone = rs.getString(7);
                String avatar = rs.getString(8);
                return new Admin(account_id, acc_name, password, role_id, activate, email, phone, avatar);
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void UpdateAccWithoutImg(String name, String email, String phone, int id) {
        try {
            String sql = "update Admin set acc_name=?, email=?, phone=? where acc_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void UpdateAccImg(String name, String email, String phone,String image, int id) {
        try {
            String sql = "update Admin set acc_name=?, email=?, phone=?, avatar=? where acc_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, image);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
