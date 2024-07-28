/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Admin;
import Model.Customer;
import Model.Pagination.Pagination;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CustomerDAO extends DBContext {

    public List<Customer> getAll(Pagination pagination,String search) {
        String sql = "select * from Customer where cus_name like ?\n"
                + "order by customer_id asc\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        List<Customer> cus = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, pagination.getOffset());
            ps.setInt(3, pagination.getPageSize());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customer_id = rs.getInt(1);
                String cus_name = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);
                cus.add(new Customer(customer_id, cus_name, address, email, phone, avatar, password, active));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cus;
    }
    public List<Customer> getAll1(String search) {
        String sql = "select * from Customer where cus_name like ?\n"
                + "order by customer_id asc;";
        List<Customer> cus = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customer_id = rs.getInt(1);
                String cus_name = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);
                cus.add(new Customer(customer_id, cus_name, address, email, phone, avatar, password, active));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cus;
    }
    public int countCus(String search) {
        String sql = "select count(*) from Customer where cus_name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<Customer> BanAcc(Pagination pag,String search,int id) {
        String sql = "update Customer set active =0 where customer_id=?";
        List<Customer> cus = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            cus = getAll(pag,search);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cus;
    }

    public List<Customer> UnBanAcc(Pagination pag,String search,int id) {
        String sql = "update Customer set active =1 where customer_id=?";
        List<Customer> cus = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            cus = getAll(pag,search);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cus;
    }

    public Customer getCusByNameAndPass(String name, String pass) {
        String sql = "select * from Customer where cus_name = ? and password = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customer_id = rs.getInt(1);
                String cus_name = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);
                return new Customer(customer_id, cus_name, address, email, phone, avatar, password, active);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Customer getCusName(String name) {
        String sql = "select * from Customer where cus_name=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customer_id = rs.getInt(1);
                String cus_name = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);
                return new Customer(customer_id, cus_name, address, email, phone, avatar, password, active);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Customer getCusId(int name) {
        String sql = "select * from Customer where customer_id=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customer_id = rs.getInt(1);
                String cus_name = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);
                return new Customer(customer_id, cus_name, address, email, phone, avatar, password, active);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Customer getCusEmail(String emai) {
        String sql = "select * from Customer where email=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, emai);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int customer_id = rs.getInt(1);
                String cus_name = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);
                return new Customer(customer_id, cus_name, address, email, phone, avatar, password, active);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Customer addCustomer(String name, String email, String phon, String pass,String address) {
        String sql = "insert into Customer values (?,?,?,?,'',?,1)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, email);
            ps.setString(4, phon);
            ps.setString(5, pass);
            ps.executeUpdate();
            return getCusName(name);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void UpdatePassCus(String password, int id) {
        String sql = "update Customer set password = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, id);
            ps.executeQuery();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Customer UpdateCusName(String name, int id) {
        String sql = "update Customer set cus_name = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, id);
            ps.executeUpdate();
            return getCusId(id);
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
        return null;
    }

    public Customer UpdateCusEmail(String email, int id) {
        String sql = "update Customer set email = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, id);
            ps.executeUpdate();
            return getCusId(id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Customer UpdateCusAddress(String address, int id) {
        String sql = "update Customer set address = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, address);
            ps.setInt(2, id);
            ps.executeUpdate();
            return getCusId(id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Customer UpdateCusAvatar(String avatar, int id) {
        String sql = "update Customer set avatar = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, avatar);
            ps.setInt(2, id);
            ps.executeUpdate();
            return getCusId(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Customer UpdateCusPhone(String phone, int id) {
        String sql = "update Customer set phone = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setInt(2, id);
            ps.executeUpdate();
            return getCusId(id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Customer UpdateCusPass(String pass, int id) {
        String sql = "update Customer set password = ? where customer_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            ps.executeUpdate();
            return getCusId(id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
