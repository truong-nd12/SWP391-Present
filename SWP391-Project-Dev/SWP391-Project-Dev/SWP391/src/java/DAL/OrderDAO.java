/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.*;
import Model.Pagination.Pagination;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dell
 */
public class OrderDAO extends DBContext {

    public List<Order> getOrderByCusId(int id) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select * from [Order] where customer_id=? and status!= 6 order by order_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                Date date = rs.getDate(3);
                double total = rs.getDouble(4);
                int status = rs.getInt(5);
                int pay_status = rs.getInt(6);
                String pay_method = rs.getString(7);
                list.add(new Order(order_id, cus_id, date, total, status, pay_status, pay_method));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select * from [Order] where status!= 6 order by order_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                Date date = rs.getDate(3);
                double total = rs.getDouble(4);
                int status = rs.getInt(5);
                int pay_status = rs.getInt(6);
                String pay_method = rs.getString(7);
                list.add(new Order(order_id, cus_id, date, total, status, pay_status, pay_method));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Order> getAllOrderByYearandMonth(int year, int month) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select * from [Order] where Year(order_date)= ? and month(order_date)=? and status=3";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                Date date = rs.getDate(3);
                double total = rs.getDouble(4);
                int status = rs.getInt(5);
                int pay_status = rs.getInt(6);
                String pay_method = rs.getString(7);
                list.add(new Order(order_id, cus_id, date, total, status, pay_status, pay_method));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Order> getAllOrderPaging(Pagination pagination, String cusname, String date, String price, String status) {
        List<Order> orderList = new ArrayList();
        String sql = "select a.* from [Order] as a join Customer as b on a.customer_id=b.customer_id\n"
                + "where status!=6 and status like ? and order_date like ? and total_price>=? and total_price<? and cus_name like ?\n"
                + "order by order_id desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        double min = 0;
        double max = 900000000;
        if (!price.isEmpty()) {
            if (price.equals("0")) {
                max = 5000000;
            } else if (price.equals("1")) {
                min = 5000000;
                max = 10000000;
            } else if (price.equals("2")) {
                min = 10000000;
                max = 20000000;
            } else if (price.equals("3")) {
                min = 20000000;
            }
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + status + "%");
            ps.setString(2, "%" + date + "%");
            ps.setDouble(3, min);
            ps.setDouble(4, max);
            ps.setString(5, "%" + cusname + "%");
            ps.setInt(6, pagination.getOffset());
            ps.setInt(7, pagination.getPageSize());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                Date date1 = rs.getDate(3);
                double total = rs.getDouble(4);
                int status1 = rs.getInt(5);
                int pay_status = rs.getInt(6);
                String pay_method = rs.getString(7);
                orderList.add(new Order(order_id, cus_id, date1, total, status1, pay_status, pay_method));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orderList;
    }

    public int getTotalOrder(String cusname, String date, String price, String status) {
        List<Order> orderList = new ArrayList();
        String sql = "select count(*) from [Order] as a join Customer as b on a.customer_id=b.customer_id\n"
                + "where status!=6 and status like ? and order_date like ? and total_price>=? and total_price<? and cus_name like ?";
        int n = 0;
        double min = 0;
        double max = 900000000;
        if (!price.isEmpty()) {
            if (price.equals("0")) {
                max = 5000000;
            } else if (price.equals("1")) {
                min = 5000000;
                max = 10000000;
            } else if (price.equals("2")) {
                min = 10000000;
                max = 20000000;
            } else if (price.equals("3")) {
                min = 20000000;
            }
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + status + "%");
            ps.setString(2, "%" + date + "%");
            ps.setDouble(3, min);
            ps.setDouble(4, max);
            ps.setString(5, "%" + cusname + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Order getOrderById(int id) {
        try {
            String sql = "select * from [Order] where order_id=? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                Date date = rs.getDate(3);
                double total = rs.getDouble(4);
                int status = rs.getInt(5);
                int pay_status = rs.getInt(6);
                String pay_method = rs.getString(7);
                return new Order(order_id, cus_id, date, total, status, pay_status, pay_method);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Order getPidById(int id) {
        try {
            String sql = "select productId from [Order] where order_id=? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                Date date = rs.getDate(3);
                double total = rs.getDouble(4);
                int status = rs.getInt(5);
                int pay_status = rs.getInt(6);
                String pay_method = rs.getString(7);
                return new Order(order_id, cus_id, date, total, status, pay_status, pay_method);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Shipment getShipById(int id) {
        try {
            String sql = "select * from Shipment where order_id=? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ship_id = rs.getInt(1);
                int order_id = rs.getInt(2);
                String address = rs.getString(3);
                Date de_date = rs.getDate(4);
                Date re_date = rs.getDate(5);
                String phone = rs.getString(6);
                String name = rs.getString(7);
                String note = rs.getString(8);
                return new Shipment(ship_id, order_id, address, de_date, re_date, phone, name, note);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Order_Detail> getOrderDetailByCusId(int id) {
        List<Order_Detail> list = new ArrayList<>();
        try {
            String sql = "select * from Order_detail where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt(1);
                int quantity = rs.getInt(2);
                int product_id = rs.getInt(3);
                double total = rs.getDouble(4);
                list.add(new Order_Detail(order_id, quantity, product_id, total));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void addOrder(Customer u, Cart cart, Shipment shipment, int pay, String pmethod) {
        try {
            String sql = "insert into [Order] values (?,?,?,0,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, u.getCustomer_id());
            ps.setDate(2, new java.sql.Date(new Date().getTime()));
            ps.setDouble(3, cart.getTotalMoney()+30000);
            ps.setInt(4, pay);
            ps.setString(5, pmethod);
            ps.executeUpdate();
            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [Order_detail] values (?,?,?,?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, orderid);
                    ps2.setInt(2, i.getQuality());
                    ps2.setInt(3, i.getProduct().getProduct_id());
                    ps2.setDouble(4, i.getPrice());
                    ps2.executeUpdate();
                }
                String sql3 = "insert into Shipment values (?,?,?,?,?,?,?)";
                PreparedStatement ps3 = connection.prepareStatement(sql3);
                ps3.setInt(1, orderid);
                ps3.setString(2, shipment.getAddress());
                ps3.setDate(3, null);
                ps3.setDate(4, null);
                ps3.setString(5, shipment.getPhone());
                ps3.setString(6, shipment.getName());
                ps3.setString(7, shipment.getNote());
                ps3.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void addOrderCart(Customer u, Cart cart) {
        try {
            String sql = "insert into [Order] values (?,?,?,6,0,0)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, u.getCustomer_id());
            ps.setDate(2, new java.sql.Date(new Date().getTime()));
            ps.setDouble(3, cart.getTotalMoney()+30000);
            ps.executeUpdate();
            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [Order_detail] values (?,?,?,?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, orderid);
                    ps2.setInt(2, i.getQuality());
                    ps2.setInt(3, i.getProduct().getProduct_id());
                    ps2.setDouble(4, i.getPrice());
                    ps2.executeUpdate();
                }
                
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void addOrderCartGuarantee(Customer u, Cart cart,Shipment shipment) {
        try {
            String sql = "insert into [Order] values (?,?,?,0,0,'COD')";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, u.getCustomer_id());
            ps.setDate(2, new java.sql.Date(new Date().getTime()));
            ps.setDouble(3, cart.getTotalMoney());
            ps.executeUpdate();
            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [Order_detail] values (?,?,?,?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, orderid);
                    ps2.setInt(2, i.getQuality());
                    ps2.setInt(3, i.getProduct().getProduct_id());
                    ps2.setDouble(4, i.getPrice());
                    ps2.executeUpdate();
                }
                String sql3 = "insert into Shipment values (?,?,?,?,?,?,?)";
                PreparedStatement ps3 = connection.prepareStatement(sql3);
                ps3.setInt(1, orderid);
                ps3.setString(2, shipment.getAddress());
                ps3.setDate(3, null);
                ps3.setDate(4, null);
                ps3.setString(5, shipment.getPhone());
                ps3.setString(6, shipment.getName());
                ps3.setString(7, shipment.getNote());
                ps3.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateShip(Shipment shipment) {
        try {
            String sql = "update Shipment set address=?, name=?,phone=?,note=? where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, shipment.getAddress());
            ps.setString(2, shipment.getName());
            ps.setString(3, shipment.getPhone());
            ps.setString(4, shipment.getNote());
            ps.setInt(5, shipment.getOrder_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteShip(int oid) {
        try {
            String sql = "delete from Shipment where order_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
            sql = "delete from Order_detail where order_id= ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
            sql = "delete from [Order] where order_id= ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateOrderStatus(int id, int status) {
        try {
            String sql = "update [Order] set status=? where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateOrderDeliveryDate(int id) {
        try {
            String sql = "update Shipment set delivery_date=? where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(new Date().getTime()));
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateOrderReceiveDate(int id) {
        try {
            String sql = "update Shipment set receiving_date=? where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(new Date().getTime()));
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateOrderPaymentStatus(int id, int status) {
        try {
            String sql = "update [Order] set payment_status=? where order_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Item> getItemByCusId(int id) {
        List<Item> list = new ArrayList<>();
        ProductDAO pro = new ProductDAO();
        try {
            String sql = "select * from Order_detail as a join [Order] as b on a.order_id=b.order_id where b.customer_id=? and b.status=6";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int quantity = rs.getInt(2);
                double price = rs.getDouble(4);
                list.add(new Item(getNameById(rs.getInt(3)), quantity, price));
            }
            String sql1 = "delete from Order_detail where order_id=(select order_id  from [Order] where customer_id=? and status=6)";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setInt(1, id);
            ps1.executeUpdate();
            String sql2 = "delete from [Order] where customer_id=? and status=6";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, id);
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Product getNameById(int id) {
        String sql = "select * from Product where product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getString(6);
                int guarantee_time = rs.getInt(7);
                int brand = rs.getInt(8);
                int type = rs.getInt(9);
                Date CreatedDate = rs.getDate(10);
                Date ModifiedDate = rs.getDate(11);
                int CreatedAccount = rs.getInt(12);
                int ModifiedAccount = rs.getInt(13);
                boolean Status = rs.getBoolean(14);
                Product p = new Product(product_id, product_name, price, quantity, sale, description, guarantee_time, brand, type, CreatedDate, ModifiedDate, CreatedAccount, ModifiedAccount, Status);
                p.setImg_list(getImgProductById(id));
                return p;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public Product getProductByName(String name) {
        String sql = "select * from Product where product_name=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt(1);
                String product_name = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getString(6);
                int guarantee_time = rs.getInt(7);
                int brand = rs.getInt(8);
                int type = rs.getInt(9);
                Date CreatedDate = rs.getDate(10);
                Date ModifiedDate = rs.getDate(11);
                int CreatedAccount = rs.getInt(12);
                int ModifiedAccount = rs.getInt(13);
                boolean Status = rs.getBoolean(14);
                Product p = new Product(product_id, product_name, price, quantity, sale, description, guarantee_time, brand, type, CreatedDate, ModifiedDate, CreatedAccount, ModifiedAccount, Status);
                return p;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private List<Image> getImgProductById(int id) {
        List<Image> imageList = new ArrayList<>();
        String sql = "select a.image_id,a.url from Image as a join Product_img as b on a.image_id=b.image_id where b.product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int img_id = rs.getInt(1);
                String url = rs.getString(2);
                Image i = new Image(img_id, url);
                imageList.add(i);
                return imageList;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Service_Tag> getServiceTagById(int oid, int pid) {
        List<Service_Tag> tagList = new ArrayList<>();
        String sql = "select * from service_tag where order_id=? and product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String service_tag = rs.getString(1);
                int productid = rs.getInt(2);
                int order_id = rs.getInt(3);
                tagList.add(new Service_Tag(service_tag, productid, order_id));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return tagList;
    }

    public Service_Tag getServiceTagByTag(String tag, int pid) {
        String sql = "select * from service_tag where product_service_tag=? and product_id=? and order_id is null";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tag);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String service_tag = rs.getString(1);
                int productid = rs.getInt(2);
                int order_id = rs.getInt(3);
                return new Service_Tag(service_tag, productid, order_id);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void updateServiceTag(int oid, String tag, int pid) {
        String sql = "update service_tag set order_id=? where product_service_tag=? and product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.setString(2, tag);
            ps.setInt(3, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateAddProduct(int quantity, int pid) {
        String sql = "update Product set quantity=quantity + ? where product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateRemoveProduct(int quantity, int pid) {
        String sql = "update Product set quantity=quantity - ? where product_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateServiceTagOrderId(int oid) {
        String sql = "update service_tag set order_id=null where order_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
