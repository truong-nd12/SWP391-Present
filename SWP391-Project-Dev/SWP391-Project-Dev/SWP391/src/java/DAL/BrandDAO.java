package DAL;

import Model.Brand;
import Model.Pagination.Pagination;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO extends DBContext {

    PreparedStatement stm = null;

    /**
     * This method use to get Brand by Id
     *
     * @param id the id of brand
     * @return
     */
    public Brand getBrandById(int id) {
        String sql = "select * from Brand where brand_id = ?";
        try {

            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getNString(2);
                boolean status = rs.getBoolean(3);
                String description = rs.getString(4);
                String image = rs.getString(5);
                return new Brand(id, name, status, description, image);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    /**
     * This method use to get All Brand
     *
     * @return
     */
    /**
     * This method use to get All Brand Admin
     *
     * @param pagination
     * @param searchValue the value want to search
     * @return
     */
    public List<Brand> getAllBrandAdmin(Pagination pagination, String searchValue) {
        String sql = "select * from brand"
                + " where brand_name like ?"
                + " order by brand_id desc"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<Brand> brands = new ArrayList();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            stm.setInt(2, pagination.getOffset());
            stm.setInt(3, pagination.getPageSize());
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getNString(2);
                boolean status = rs.getBoolean(3);
                String description = rs.getString(4);
                String image = rs.getString(5);
                brands.add(new Brand(id, name, status, description, image));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return brands;
    }

    /**
     * This method use to count the number of Brand
     *
     * @return the number of brand
     */
    public int countBrand() {
        String sql = "select count(brand_id) as totalRow from brand";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("totalRow");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    /**
     * This method use to get Brand by Name
     *
     * @param name the name of brand
     * @return
     */
    public Brand getBrandByName(String name) {
        String sql = "select * from brand where brand_name = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                boolean status = rs.getBoolean(3);
                return new Brand(id, name, status);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    /**
     * This method use to delete the Brand by Id
     *
     * @param id the id of brand
     * @param status the status of brand
     * @return
     */
    public List<Brand> delBrandById(int id, int status) {
        String sql = "update brand set status = ? where brand_id = ?";
        List<Brand> brands = new ArrayList();
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();
            brands = getAll();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return brands;
    }

    /**
     * This method use to add brand
     *
     * @param name
     * @return
     */
    public void AddBrand(Brand brand) {
        String sql = "insert into Brand(brand_name, status, description, image) values (?,1,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, brand.getBrand_name());
            ps.setString(2, brand.getDescription());
            ps.setString(3, brand.getImage());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * This method use to find the brand by Name
     *
     * @param name
     * @return
     */
    /**
     * This method use to reload Brand
     *
     * @param id
     */
    public void reBrand(int id) {
        String sql = "Update Brand set status = 1 where brand_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void UpdateBrand(int id, String name, String des) {
        String sql = "update Brand set brand_name=? , description=? where brand_id=?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, des);
            stm.setInt(3, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void UpdateBrandWithImage(int id, String name, String des, String img) {
        String sql = "update Brand set brand_name=? , description=?, image=? where brand_id=?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, des);
            stm.setString(3, img);
            stm.setInt(4, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    ResultSet rs = null;

    public List<Brand> getAll() {
        List<Brand> list = new ArrayList<>();
        String query = "select * from Brand where status = 1";
        try {
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getBrandByID(int id) {
        String sql = "select brand_name from Brand where brand_id = ?";
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
    
}
