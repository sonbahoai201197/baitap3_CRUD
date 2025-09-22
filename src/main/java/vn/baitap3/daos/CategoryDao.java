package vn.baitap3.daos;

import java.util.List;
import vn.baitap3.models.Category;

public interface CategoryDao {
    void insert(Category category);
    void update(Category category);
    void delete(int id);
    Category get(int id);
    List<Category> getAll();
}
