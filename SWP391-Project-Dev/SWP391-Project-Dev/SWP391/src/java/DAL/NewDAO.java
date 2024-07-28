/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.*;
import Model.Pagination.Pagination;
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
public class NewDAO extends DBContext {

    public List<News> getAllNews(Pagination pagination, String search, String type) {
        List<News> NewsList = new ArrayList();
        String[] s = search.split("\\s+");
        String searchq = "( title like ?";
        if (!search.isEmpty()) {
            for (int i = 0; i < s.length - 1; i++) {
                searchq += " or title like ?";
            }
            searchq += ") and ";
        } else {
            searchq = "";
        }
        String sql = "select * from News where " + searchq + "news_type_id like ?\n"
                + "order by news_id desc \n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY; ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int n = 0;
            if (!search.isEmpty()) {
                for (int i = 0; i < s.length; i++) {
                    ps.setString(i + 1, "%" + s[i] + "%");
                }
                n = s.length;
            }
            ps.setString(n + 1, "%" + type + "%");
            ps.setInt(n + 2, pagination.getOffset());
            ps.setInt(n + 3, pagination.getPageSize());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                NewsList.add(new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return NewsList;
    }
    public List<News> getAllNewsWithOutPaging(String search, String type) {
        List<News> NewsList = new ArrayList();
        String[] s = search.split("\\s+");
        String searchq = "( title like ?";
        if (!search.isEmpty()) {
            for (int i = 0; i < s.length - 1; i++) {
                searchq += " or title like ?";
            }
            searchq += ") and ";
        } else {
            searchq = "";
        }
        String sql = "select * from News where " + searchq + "news_type_id like ?\n"
                + "order by news_id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int n = 0;
            if (!search.isEmpty()) {
                for (int i = 0; i < s.length; i++) {
                    ps.setString(i + 1, "%" + s[i] + "%");
                }
                n = s.length;
            }
            ps.setString(n + 1, "%" + type + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                NewsList.add(new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return NewsList;
    }

    public List<News> getAllNews1(Pagination pagination, String search, String type) {
        List<News> NewsList = new ArrayList();
        String[] s = search.split("\\s+");
        String searchq = "( title like ?";
        if (!search.isEmpty()) {
            for (int i = 0; i < s.length - 1; i++) {
                searchq += " or title like ?";
            }
            searchq += ") and ";
        } else {
            searchq = "";
        }
        String sql = "select * from News where " + searchq + "news_type_id like ? and isDeleted=0\n"
                + "order by news_id desc \n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY; ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int n = 0;
            if (!search.isEmpty()) {
                for (int i = 0; i < s.length; i++) {
                    ps.setString(i + 1, "%" + s[i] + "%");
                }
                n = s.length;
            }
            ps.setString(n + 1, "%" + type + "%");
            ps.setInt(n + 2, pagination.getOffset());
            ps.setInt(n + 3, pagination.getPageSize());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                NewsList.add(new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return NewsList;
    }

    public List<News> getThreeNews(int typeid) {
        List<News> NewsList = new ArrayList();
        String sql = "select top(3)* from News where news_type_id= ? and isDeleted=0\n"
                + "order by news_id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                NewsList.add(new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return NewsList;
    }
    public List<News> getThreeNewsRecent() {
        List<News> NewsList = new ArrayList();
        String sql = "select top(3)* from News where isDeleted=0\n"
                + "order by news_id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                NewsList.add(new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return NewsList;
    }
    public List<News> getThreeNewsHome(int typeid) {
        List<News> NewsList = new ArrayList();
        String sql = "select top(3)* from News where news_type_id != ? and isDeleted=0\n"
                + "order by news_id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                NewsList.add(new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return NewsList;
    }

    public void addNews(String title, String content, int brand_id, int news_type_id, int acc_id) {
        try {
            String sql = "insert into News(title, content, brand_id, news_type_id, CreatedDate, CreatedBy, news_img_id, isDeleted)"
                    + " values (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            if (brand_id != 0) {
                ps.setInt(3, brand_id);
            } else {
                ps.setString(3, null);
            }
            ps.setInt(4, news_type_id);
            ps.setDate(5, new java.sql.Date(new Date().getTime()));
            ps.setInt(6, acc_id);
            ps.setInt(7, getNewestImage());
            ps.setInt(8, 2);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addImage(String url) {
        try {
            String sql = "insert into News_img values (?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, url);
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public int getNewestImage() {
        try {
            String sql = "select top 1 img_id from News_img order by img_id desc";
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

    public int countNews(String search, String type) {
        String[] s = search.split("\\s+");
        String searchq = "( title like ?";
        if (!search.isEmpty()) {
            for (int i = 0; i < s.length - 1; i++) {
                searchq += " or title like ?";
            }
            searchq += ") and ";
        } else {
            searchq = "";
        }
        String sql = "select count(news_id) as totalRow from News where " + searchq + "news_type_id like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int n = 0;
            if (!search.isEmpty()) {
                for (int i = 0; i < s.length; i++) {
                    ps.setString(i + 1, "%" + s[i] + "%");
                }
                n = s.length;
            }
            ps.setString(n + 1, "%" + type + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public int countNews1(String search, String type) {
        String sql = "select count(news_id) as totalRow from News where title like ? and news_type_id like ? and isDeleted=0";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + type + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public void DelNewsById(int id, int status) {
        try {
            String sql = "Update News set isDeleted = ? where news_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public News getById(int id_news) {
        String sql = "select * from News where news_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id_news);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getNString(2);
                String content = rs.getString(3);
                int brand = rs.getInt(4);
                int newstype = rs.getInt(5);
                Date CreatedDate = rs.getDate(6);
                Date ModifiedDate = rs.getDate(7);
                int CreatedBy = rs.getInt(8);
                int ModifiedBy = rs.getInt(9);
                int img_id = rs.getInt(10);
                int isDel = rs.getInt(11);
                return new News(id, title, content, brand, newstype, CreatedDate, ModifiedDate, CreatedBy, ModifiedBy, img_id, isDel);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void UpdateNewsWithoutImg(String title, String content, int brand_id, int news_type_id, int acc_id, int id) {
        try {
            String sql = "update News set title = ?, content = ?, brand_id = ?, news_type_id = ?, ModifiedDate = ?, ModifiedBy = ? "
                    + "where news_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            if (brand_id != 0) {
                ps.setInt(3, brand_id);
            } else {
                ps.setString(3, null);
            }
            ps.setInt(4, news_type_id);
            ps.setDate(5, new java.sql.Date(new Date().getTime()));
            ps.setInt(6, acc_id);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void UpdateNews(String title, String content, int brand_id, int news_type_id, int acc_id, int id) {
        try {
            String sql = "update News set title = ?, content = ?, brand_id = ?, news_type_id = ?, ModifiedDate = ?, ModifiedBy = ?, news_img_id = ? "
                    + "where news_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            if (brand_id != 0) {
                ps.setInt(3, brand_id);
            } else {
                ps.setString(3, null);
            }
            ps.setInt(4, news_type_id);
            ps.setDate(5, new java.sql.Date(new Date().getTime()));
            ps.setInt(6, acc_id);
            ps.setInt(7, getNewestImage());
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
