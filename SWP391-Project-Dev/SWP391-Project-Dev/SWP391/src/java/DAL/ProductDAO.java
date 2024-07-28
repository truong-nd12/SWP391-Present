/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Admin;
import Model.Brand;
import Model.Image;
import Model.Pagination.Pagination;
import Model.Product;
import Model.Type;
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
public class ProductDAO extends DBContext {

    public List<Product> getAllProductUser(Pagination pagination, String search, String brand, String type, double min, double max) {
        List<Product> ProductList = new ArrayList<>();
        String sql = "select * from Product p\n"
                + "left join Brand b on p.brand_id = b.brand_id\n"
                + "left join Type t on p.type_id = t.type_id\n"
                + "where \n"
                + "p.product_name like ? \n"
                + "and b.brand_name like ?\n"
                + "and t.type_name like ?\n"
                + "and p.price between ? and ? \n"
                + "and p.status = 1\n"
                + "order by p.product_id desc\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + brand + "%");
            ps.setString(3, "%" + type +   "%");
            ps.setDouble(4, min);
            ps.setDouble(5, max);
            ps.setInt(6, pagination.getOffset());
            ps.setInt(7, pagination.getPageSize());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getNString(6);
                int gruantee_time = rs.getInt(7);
                int bran = rs.getInt(8);
                int typ = rs.getInt(9);
                Date createdDate = rs.getDate(10);
                Date modifiedDate = rs.getDate(11);
                int createdBy = rs.getInt(12);
                int modifiedBy = rs.getInt(13);
                boolean status = rs.getBoolean(14);
                Product p = new Product(Id, name, price, quantity, sale, description, gruantee_time, bran, typ,
                        createdDate, modifiedDate, createdBy, modifiedBy, status);
                p.setImg_list(getImgProductById(Id));
                ProductList.add(p);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ProductList;
    }

    public int getAvarageStars(int productId) throws SQLException {
        String sql = "select SUM(f.stars) as totalStars, count(f.productId) as comment\n"
                + "	 from feedback f where f.productId = ?";
        try {

            ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                int totalStars = rs.getInt("totalStars");
                int comment = rs.getInt("comment");
                if (totalStars == 0 || comment == 0) {
                    return 0;
                }
                int amount = totalStars / comment;
                return amount;
            }
        } finally {
        }
        return 0;
    }

    public int countAllProductUser(String search, String brand, String type, double min, double max) {
        List<Product> ProductList = new ArrayList<>();
        String sql = "select count(*) from Product p\n"
                + "left join Brand b on p.brand_id = b.brand_id\n"
                + "left join Type t on p.type_id = t.type_id\n"
                + "where \n"
                + "p.product_name like ? \n"
                + "and b.brand_name like ?\n"
                + "and t.type_name like ?\n"
                + "and p.price between ? and ? \n"
                + "and p.status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + brand + "%");
            ps.setString(3, "%" + type + "%");
            ps.setDouble(4, min);
            ps.setDouble(5, max);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<Product> getFiveProductUser() {
        List<Product> ProductList = new ArrayList<>();
        String sql = "select top(5)* from Product where status = 1"
                + "order by product_id desc\n";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getNString(6);
                int gruantee_time = rs.getInt(7);
                int bran = rs.getInt(8);
                int typ = rs.getInt(9);
                Date createdDate = rs.getDate(10);
                Date modifiedDate = rs.getDate(11);
                int createdBy = rs.getInt(12);
                int modifiedBy = rs.getInt(13);
                boolean status = rs.getBoolean(14);
                Product p = new Product(Id, name, price, quantity, sale, description, gruantee_time, bran, typ,
                        createdDate, modifiedDate, createdBy, modifiedBy, status);
                p.setImg_list(getImgProductById(Id));
                ProductList.add(p);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ProductList;
    }

    public Product getNameById(int id) {
        String sql = "select * from Product where product_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
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
                return new Product(product_id, product_name, price, quantity, sale, description, guarantee_time, brand, type, CreatedDate, ModifiedDate, CreatedAccount, ModifiedAccount, Status);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getProductByIndex(int indexPage) {
        List<Product> listP = new ArrayList<>();
        String query = "SELECT * FROM Product ORDER BY product_id DESC OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, (indexPage - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getBoolean(14));
                listP.add(product);
            }
        } catch (Exception e) {
            // Handle exceptions here
        }
        return listP;
    }

    public int countAllProduct() {
        String query = "select count(*) from Product";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Image> getImgProductById(int ID) {
        List<Image> ImageList = new ArrayList<>();
        String sql = "select i.image_id, url from Image i join Product_img b on i.image_id = b.image_id\n"
                + "				join Product p on p.product_id=b.product_id\n"
                + "				where p.product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String url = rs.getString(2);
                ImageList.add(new Image(Id, url));
            }
        } catch (Exception ex) {
            System.out.println("getImg: " + ex.getMessage());;
        }
        return ImageList;
    }

    public boolean DeleteProductById(int id, int status) {
        List<Product> listP = new ArrayList();
        String sql = "update Product set Status = ? where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            if (ps.executeUpdate() > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public List<Product> getProductBySearch(String name, String bid, String tid, String pricemin, String pricemax, int indexPage, int num) {
        List<Product> listP = new ArrayList<>();
        String[] keywords = name.split("\\s+");
        String searchQuery = "( product_name like ?";
        if (!name.isEmpty()) {
            for (int i = 0; i < keywords.length - 1; i++) {
                searchQuery += " or product_name like ?";
            }
            searchQuery += ") and ";
        } else {
            searchQuery = "";
        }
        String query = "select * from Product where " + searchQuery + "1=1 ";
        if (!bid.equals("0")) {
            query += " and brand_id = ? ";
        }
        if (!tid.equals("0")) {
            query += " and type_id = ? ";
        }
        if (pricemin != null && !pricemin.equals("")) {
            query += " and price >= ? ";
        }
        if (pricemax != null && !pricemax.equals("")) {
            query += " and price <= ? ";
        }

        query += " order by product_id offset ? rows fetch next " + num + " rows only";
        try {
            ps = connection.prepareStatement(query);
            int paramIndex = 1;
            if (!name.isEmpty()) {
                for (String keyword : keywords) {
                    ps.setString(paramIndex++, "%" + keyword + "%");
                }
            }
            if (!bid.equals("0")) {
                ps.setString(paramIndex++, bid);
            }
            if (!tid.equals("0")) {
                ps.setString(paramIndex++, tid);
            }
            if (pricemin != null && !pricemin.equals("")) {
                ps.setString(paramIndex++, pricemin);
            }
            if (pricemax != null && !pricemax.equals("")) {
                ps.setString(paramIndex++, pricemax);
            }
            ps.setInt(paramIndex, (indexPage - 1) * num);
            rs = ps.executeQuery();
            while (rs.next()) {
                listP.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getBoolean(14)));
            }
        } catch (Exception e) {
            System.out.println("Search:" + e.getMessage());
        }
        return listP;
    }

    public int countAllProductSearch(String name, String bid, String tid, String pricemin, String pricemax) {
        String[] keywords = name.split("\\s+");
        String searchQuery = "( product_name like ?";
        if (!name.isEmpty()) {
            for (int i = 0; i < keywords.length - 1; i++) {
                searchQuery += " or product_name like ?";
            }
            searchQuery += ") and ";
        } else {
            searchQuery = "";
        }
        String query = "select count(*) from Product where " + searchQuery + "1=1 ";
        if (!bid.equals("0")) {
            query += " and brand_id = ? ";
        }
        if (!tid.equals("0")) {
            query += " and type_id = ? ";
        }
        if (pricemin != null && !pricemin.equals("")) {
            query += " and price >= ? ";
        }
        if (pricemax != null && !pricemax.equals("")) {
            query += " and price <= ? ";
        }
        try {
            ps = connection.prepareStatement(query);
            int paramIndex = 1;
            if (!name.isEmpty()) {
                for (String keyword : keywords) {
                    ps.setString(paramIndex++, "%" + keyword + "%");
                }
            }
            if (!bid.equals("0")) {
                ps.setString(paramIndex++, bid);
            }
            if (!tid.equals("0")) {
                ps.setString(paramIndex++, tid);
            }
            if (pricemin != null && !pricemin.equals("")) {
                ps.setString(paramIndex++, pricemin);
            }
            if (pricemax != null && !pricemax.equals("")) {
                ps.setString(paramIndex++, pricemax);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Count:" + e.getMessage());
        }
        return 0;
    }

    public Object getProductByName(String name) {
        String sql = "select * from Product where product_name = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                boolean status = rs.getBoolean(14);
                if (!status) {
                    return null;
                }
                int Id = rs.getInt(1);
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
                Product p = new Product(Id, name, price, quantity, sale, description, guarantee_time, brand, type,
                        CreatedDate, ModifiedDate, CreatedAccount, ModifiedAccount, status);
                p.setImg_list(getImgProductById(Id));

                return p;
            }
        } catch (Exception e) {
            System.out.println("getProductByName:" + e.getMessage());
        }
        return null;
    }

    public Product addNewProduct(int account_id, String name, double price, int quantity, int sale, String description, int guarantee_time, int brand_id, int type_id) {
        String sql = "insert into Product(product_name, price, quantity, sale, description, guarantee_time, brand_id, type_id, CreatedDate, CreatedBy, Status) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, sale);
            ps.setString(5, description);
            ps.setInt(6, guarantee_time);
            ps.setInt(7, brand_id);
            ps.setInt(8, type_id);
            java.sql.Date today = new java.sql.Date(new Date().getTime());
            ps.setDate(9, today);
            ps.setInt(10, account_id);
            ps.setInt(11, 1);
            if (ps.executeUpdate() > 0) {
                return getLastProduct();
            }

        } catch (Exception e) {
            System.out.println("AddNewProduct" + e.getMessage());
        }
        return null;
    }

    public void addImages(String fileName, int product_id) {
        String sql = "insert into Image values(?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, fileName);
            ps.executeUpdate();
//            addProductImg(product_id);
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
    }

    AdminDAO adminDAO = new AdminDAO();
    TypeDAO typeDAO = new TypeDAO();
    BrandDAO brandDAO = new BrandDAO();

    private Product getLastProduct() {
        Product product = null;
        try {
            String sql = "Select top(1) * from Product p order by p.product_id desc";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getNString(6);
                int gruantee_time = rs.getInt(7);
                int brand = rs.getInt(8);
                int type = rs.getInt(9);
                Date createdDate = rs.getDate(10);
                Date modifiedDate = rs.getDate(11);
                int createdBy = rs.getInt(12);
                int modifiedBy = rs.getInt(13);
                boolean status = rs.getBoolean(14);

                product = new Product(Id, name, price, quantity, sale, description, gruantee_time, brand, type,
                        createdDate, modifiedDate, createdBy, modifiedBy, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return product;
    }

    public void addProductImg(int product_id) {
        String sql = "insert into Product_img values(?,?)";
        try {
            ps = connection.prepareStatement(sql);
//            System.out.println("step1");
            ps.setInt(1, getNewestImage());
//            System.out.println("step2");
            System.out.println("prid" + product_id);
            ps.setInt(2, product_id);
//            System.out.println("step3");
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.print("addproduct-img: " + ex.getMessage());
        }
    }
//    public void addProductImg(int product_id) {
//        String sql = "insert into Product_img values (?," + product_id + ")";
//        try {
//            ps = connection.prepareStatement(sql);
//            ps.setInt(1, getNewestImage());
//            ps.executeUpdate();
//        } catch (Exception ex) {
//            System.out.print("addproduct-img: " + ex.getMessage());
//        }
//    }

//    public int getNewestImage() {
//        String sql = "select top 1 image_id from Image Order by image_id desc";
//        try {
//            ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (Exception ex) {
//            System.out.print("getNewestImage: " + ex.getMessage());
//        }
//        return 0;
//    }
    public int getNewestImage() {
        try {
            String sql = "select top 1 image_id from Image Order by image_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public List<Product> getProductById(int id) {
        List<Product> listP = new ArrayList<>();
        String sql = "select * from Product where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt(1);
                Product product = new Product(ID,
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getBoolean(14));
                product.setImg_list(getImgProductById(ID));
                listP.add(product);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listP;
    }

    public Product UpdateProductById(int id, int account_id, String name, double price, int quantity, int sale, String description, int guarantee, int brandId, int typeId) {
        String sql = "update Product set product_name = ?, price = ?, quantity = ?, sale = ?, description = ?, "
                + "guarantee_time = ?, brand_id = ?, type_id = ?, ModifiedDate = ?, ModifiedBy = ? where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, sale);
            ps.setString(5, description);
            ps.setInt(6, guarantee);
            ps.setInt(7, brandId);
            ps.setInt(8, typeId);
            java.sql.Date today = new java.sql.Date(new Date().getTime());
            ps.setDate(9, today);
            ps.setInt(10, account_id);
            ps.setInt(11, id);
            if (ps.executeUpdate() > 0) {
                return getProductById1(id);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Product getProductById1(int id) {
        String sql = "select * from Product where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getNString(6);
                int gruantee_time = rs.getInt(7);
                int brand = rs.getInt(8);
                int type = rs.getInt(9);
                Date createdDate = rs.getDate(10);
                Date modifiedDate = rs.getDate(11);
                int createdBy = rs.getInt(12);
                int modifiedBy = rs.getInt(13);
                boolean status = rs.getBoolean(14);
                Product p = new Product(Id, name, price, quantity, sale, description, gruantee_time, brand, type,
                        createdDate, modifiedDate, createdBy, modifiedBy, status);
                p.setImg_list(getImgProductById(id));

                return p;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Integer getProductIDByServiceTag(String tag) {
        String sql = "select p.product_id from Product p inner join service_tag s on p.product_id = s.product_id where s.product_service_tag = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, tag);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    public List<Product> getTop5Product() {
        String sql = "select top(5) * from Product where status = 1 order by product_id desc";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getNString(6);
                int gruantee_time = rs.getInt(7);
                int brand = rs.getInt(8);
                int type = rs.getInt(9);
                Date createdDate = rs.getDate(10);
                Date modifiedDate = rs.getDate(11);
                int createdBy = rs.getInt(12);
                int modifiedBy = rs.getInt(13);
                boolean status = rs.getBoolean(14);
                Product p = new Product(Id, name, price, quantity, sale, description, gruantee_time, brand, type,
                        createdDate, modifiedDate, createdBy, modifiedBy, status);
                p.setImg_list(getImgProductById(Id));
                ProductList.add(p);
            }
        } catch (Exception e) {
            System.out.println("GetTop5Product" + e.getMessage());
        }
        return ProductList;

    }

    public void DelProductImg(int id) {
        String sql = "delete from Product_img where product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addServiceTag(int quantity, int productid) {
        String sql = "INSERT INTO service_tag (product_id) VALUES (?)";
        try (
                 PreparedStatement ps = connection.prepareStatement(sql)) {
            for (int i = 0; i < quantity; i++) {
                ps.setInt(1, productid);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("svtag: " + e.getMessage());
        }
    }

    public List<Product> getProductListToExport() {
        String sql = "select * from Product where Status = 1 order by product_id desc";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                int sale = rs.getInt(5);
                String description = rs.getNString(6);
                int gruantee_time = rs.getInt(7);
                int brand = rs.getInt(8);
                int type = rs.getInt(9);
                Date createdDate = rs.getDate(10);
                Date modifiedDate = rs.getDate(11);
                int createdBy = rs.getInt(12);
                int modifiedBy = rs.getInt(13);
                boolean status = rs.getBoolean(14);
                Product p = new Product(Id, name, price, quantity, sale, description, gruantee_time, brand, type,
                        createdDate, modifiedDate, createdBy, modifiedBy, status);
                p.setImg_list(getImgProductById(Id));
                ProductList.add(p);
            }
        } catch (Exception e) {
            System.out.println("GetTop5Product" + e.getMessage());
        }
        return ProductList;
    }

    public List<Product> getProductBySearchToExport(String name, int bid, int tid, String pricemin, String pricemax) {
        List<Product> listP = new ArrayList<>();
        String[] keywords = name.split("\\s+");
        String searchQuery = "( product_name like ?";
        if (!name.isEmpty()) {
            for (int i = 0; i < keywords.length - 1; i++) {
                searchQuery += " or product_name like ?";
            }
            searchQuery += ") and ";
        } else {
            searchQuery = "";
        }
        String query = "select * from Product where " + searchQuery + "1=1 ";
        if (bid != 0) {
            query += " and brand_id = ? ";
        }
        if (tid != 0) {
            query += " and type_id = ? ";
        }
        if (pricemin != null && !pricemin.equals("")) {
            query += " and price >= ? ";
        }
        if (pricemax != null && !pricemax.equals("")) {
            query += " and price <= ? ";
        }
        try {
            ps = connection.prepareStatement(query);
            int paramIndex = 1;
            if (!name.isEmpty()) {
                for (String keyword : keywords) {
                    ps.setString(paramIndex++, "%" + keyword + "%");
                }
            }
            if (bid != 0) {
                ps.setInt(paramIndex++, bid);
            }
            if (tid != 0) {
                ps.setInt(paramIndex++, tid);
            }
            if (pricemin != null && !pricemin.equals("")) {
                ps.setString(paramIndex++, pricemin);
            }
            if (pricemax != null && !pricemax.equals("")) {
                ps.setString(paramIndex++, pricemax);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                listP.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getBoolean(14)));
            }
        } catch (Exception e) {
            System.out.println("Search:" + e.getMessage());
        }
        return listP;
    }

}
