package vn.baitap3.daos.impl;

import java.sql.*;
import java.util.*;
import vn.baitap3.configs.DBContext;
import vn.baitap3.daos.CategoryDao;
import vn.baitap3.models.Category;

public class CategoryDaoImpl extends DBContext implements CategoryDao {

    @Override
    public void insert(Category category) {
        // ✅ thêm price vào SQL
        String sql = "INSERT INTO category(cate_name, icons, price) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCateName());
            ps.setString(2, category.getIcons());
            ps.setDouble(3, category.getPrice());  // đúng vị trí thứ 3
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Category category) {
        // ✅ thêm price vào SQL
        String sql = "UPDATE category SET cate_name = ?, icons = ?, price = ? WHERE cate_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCateName());
            ps.setString(2, category.getIcons());
            ps.setDouble(3, category.getPrice());   // giá trị price
            ps.setInt(4, category.getCateId());     // id ở cuối
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM category WHERE cate_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public Category get(int id) {
        String sql = "SELECT * FROM category WHERE cate_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(
                    rs.getInt("cate_id"),
                    rs.getString("cate_name"),
                    rs.getString("icons"),
                    rs.getDouble("price")
                );
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Category(
                    rs.getInt("cate_id"),
                    rs.getString("cate_name"),
                    rs.getString("icons"),
                    rs.getDouble("price")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
