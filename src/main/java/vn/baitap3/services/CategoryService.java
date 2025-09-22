package vn.baitap3.services;

import java.util.List;
import vn.baitap3.models.Category;

public interface CategoryService {
    void insert(Category category);
    void update(Category category);
    void delete(int id);
    Category get(int id);
    List<Category> getAll();
}
