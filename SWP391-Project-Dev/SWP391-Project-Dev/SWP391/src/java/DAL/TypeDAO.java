/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Brand;
import Model.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeDAO extends DBContext {

    public List<Type> getAllTypesInManagerPage() {
        String sql = "select * from Type order by type_id desc ";
        List<Type> types = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                boolean status = rs.getBoolean(3);
                types.add(new Type(id, name, status));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return types;
    }

    public Type getTypeByName(String name) {
        String sql = "select * from Type where type_name = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, name);
            while (rs.next()) {
                int type_id = rs.getInt(1);
                boolean status = rs.getBoolean(3);
                return new Type(type_id, name, status);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void AddType(String name) {
        String sql = "insert into Type values(?,1)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Type findTypeByName(String name) {
        try {
            String sql = "select * from Type where type_name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                boolean status = rs.getBoolean(3);
                return new Type(id, name, status);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void reType(int id) {
        String sql = "Update Type set status = 1 where type_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Type> getAll() {
        String sql = "select * from Type where status = 1";
        List<Type> types = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getNString(2);
                boolean status = rs.getBoolean(3);
                types.add(new Type(id, name, status));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return types;
    }

    public List<Type> activeAndDeActiveStatusType(int id, int status) {
        String sql = "update Type set status = ? where type_id = ?";
        List<Type> types = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            types = getAll();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return types;
    }
    PreparedStatement stm = null;
    ResultSet rs = null;

    public Type getTypeById(int id) {
        String sql = "select * from Type where type_id = ?";
        try {

            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getNString(2);
                boolean status = rs.getBoolean(3);
                return new Type(id, name, status);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public String getTypeByID(int id) {
        String sql = "select type_name from Type where type_id = ?";
        try {

            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getNString(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean UpdateType(int id, String name) {
        String sql = "update Type set type_name = ? where type_id = ?";
        try {
            if (findTypeByName(name) != null) {
                return false;
            } else {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, name);
                ps.setInt(2, id);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return true;
    }

    public static void main(String[] args) {
        TypeDAO d = new TypeDAO();
        System.out.println(d.UpdateType(16, "Phone"));
    }

    public int countTypes() throws SQLException {
        String sql = "select count(type_id) as totalRow from type";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("totalRow");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
}
