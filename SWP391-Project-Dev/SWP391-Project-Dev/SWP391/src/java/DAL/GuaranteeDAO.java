/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Customer;
import Model.Guarantee;
import Model.Product;
import Model.feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author XUAN PHUC
 */
public class GuaranteeDAO extends DBContext {

    public List<Guarantee> getListGuaranteeByOrderID(int orderID) {
        String sql = "select * from Guarantee\n"
                + "where order_id in (select order_id from [Order] where customer_id=?) order by record_id desc";
        List<Guarantee> lst = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int record_id = rs.getInt(1);
                int product = rs.getInt(2);
                int order_id = rs.getInt(3);
                Date g_date = rs.getDate(4);
                int status = rs.getInt(5);
                Date return_date = rs.getDate(6);
                String image = rs.getString(7);
                String note = rs.getString(8);
                String type = rs.getString(9);
                String service_tag = rs.getString(10);
                lst.add(new Guarantee(record_id, product, order_id, g_date, status, return_date, image, note, type, service_tag));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return lst;
    }

    public List<Guarantee> getListManagermentGuarantee() {
        String sql = "select * from Guarantee  order by record_id desc";
        List<Guarantee> lst = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int record_id = rs.getInt(1);
                int pro_id = rs.getInt(2);
                int order_id = rs.getInt(3);
                Date g_date = rs.getDate(4);
                int status = rs.getInt(5);
                Date return_date = rs.getDate(6);
                String image = rs.getString(7);
                String note = rs.getString(8);
                String type = rs.getString(9);
                String service_tag = rs.getString(10);
                lst.add(new Guarantee(record_id, pro_id, order_id, g_date, status, return_date, image, note, type, service_tag));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return lst;
    }

    public Guarantee getGuaranteeByIdInDetailGuarantee(int id) {
        String sql = "select * from Guarantee where record_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int record_id = rs.getInt(1);
                int product = rs.getInt(2);
                int order_id = rs.getInt(3);
                Date g_date = rs.getDate(4);
                int status = rs.getInt(5);
                Date return_date = rs.getDate(6);
                String image = rs.getString(7);
                String note = rs.getString(8);
                String type = rs.getString(9);
                String service_tag = rs.getString(10);
                int creator_id = rs.getInt(11);
                return new Guarantee(record_id, product, order_id, g_date, status, return_date, image, note, type, service_tag, creator_id);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public int updateManagerGuaranteeStatus(int recordID, int status, String date) {
        String sql = "Update Guarantee set status = ?,return_date =? where record_id= ?";
        if (date.equals("0")) {
            date = null;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);

            ps.setString(2, date);
            ps.setInt(3, recordID);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public Customer getCustomerByOrderID(int orderID) {
        String sql = "select c.* from [Order] o inner join Customer c on o.customer_id = c.customer_id where o.order_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int cusId = rs.getInt(1);
                String cusName = rs.getString(2);
                String address = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String avatar = rs.getString(6);
                String password = rs.getString(7);
                boolean active = rs.getBoolean(8);

                return new Customer(cusId, cusName, address, email, phone, avatar, password, active);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean addNewGuarantee(int product, int orderId, String image, String note, String service_tag) {
        String sql = "INSERT INTO [dbo].[Guarantee]([product_id],[order_id],[g_date],[image],[status],[note],[service_tag]) VALUES (?,?,?,?,1,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,product );
            ps.setInt(2, orderId);
            ps.setDate(3, new java.sql.Date(new Date().getTime()));
            ps.setString(4, image);
            ps.setString(5, note);
            ps.setString(6, service_tag);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean addNewGuaranteeUser(Guarantee guarantee) {
        String sql = "INSERT INTO [dbo].[Guarantee]([product_id],[order_id],[g_date],[image],[status],[note],[service_tag]) VALUES (?,?,?,?,1,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, guarantee.getProduct());
            ps.setInt(2, guarantee.getOrder_id());

            DateFormat df = new SimpleDateFormat("yyyy/MM/dd");

            ps.setString(3, df.format(guarantee.getG_date()));
            ps.setString(4, guarantee.getImage());
            ps.setString(5, guarantee.getNote());
            ps.setString(6, guarantee.getService_tag());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public String getProductNameByID(int id) {
        String sql = "select product_name  from Product where product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getNString(1);
                return name;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<String> getServiceTagByOderId(int id) {
        String sql = "select product_service_tag  from service_tag where order_id = ?";
        List<String> serviceTags = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                serviceTags.add(rs.getString(1));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return serviceTags;
    }

    public List<Guarantee> searchByTag(String tag) {
        String sql = "SELECT * from Guarantee where service_tag =?";
        List<Guarantee> lst = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tag);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int record_id = rs.getInt(1);
                int pro_id = rs.getInt(2);
                int order_id = rs.getInt(3);
                Date g_date = rs.getDate(4);
                int status = rs.getInt(5);
                Date return_date = rs.getDate(6);
                String image = rs.getString(7);
                String note = rs.getString(8);
                String type = rs.getString(9);
                String service_tag = rs.getString(10);
                lst.add(new Guarantee(record_id, pro_id, order_id, g_date, status, return_date, image, note, type, service_tag));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return lst;
    }

    public String updateTypeByRecordId(String type, int id) {
        String sql = "update Guarantee set type = ? where record_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, type);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        return type;
    }

    public String getCreatorNameById(int id) {
        String sql = "select a.acc_name from Admin a where a.acc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String acc_name = rs.getString(1);
                return acc_name;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Integer updateCreatorByRecordId(int creator_id, int id) {
        String sql = "UPDATE guarantee SET creator_id = ? WHERE record_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, creator_id);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return creator_id;
    }

//        public Integer checkCreator(int id) {
//        String sql = "select creator_id from Guarantee where record_id = ?";
//        try {
//
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                int creator_id = rs.getInt(1);
//                return creator_id;
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//        return null;
//    }
    public Integer CountOrder() {
        String sql = "select COUNT(order_id) from [Order]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Integer CountProduct() {
        String sql = "select COUNT(*) from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Integer CountCustomer() {
        String sql = "select COUNT(*) from Customer";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Integer CountStar() {
        String sql = "select COUNT(stars) from feedback where stars in (4,5)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
        public Integer getOrderIdByServiceTagId(String service_tag) {
        String sql = "select order_id from service_tag where product_service_tag = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, service_tag);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               int orderId = rs.getInt(1);
               return orderId;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
       public Boolean CheckStatusInGuaranteeToAddGuarantee(String service_tag) {
        String sql = "select * from Guarantee where service_tag = ? and status in(1,2)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, service_tag);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
       
       public static void main(String[] args) {
           GuaranteeDAO g  = new GuaranteeDAO();
           System.out.println(g.CheckStatusInGuaranteeToAddGuarantee("PRO_05"));
    }
    
}

