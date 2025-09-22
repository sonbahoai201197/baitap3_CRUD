package vn.baitap3.services.impl;

import java.util.ArrayList;
import java.util.List;

import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {

    // ⚠️ Tạm thời dùng List giả lập DB
    private static List<Category> categories = new ArrayList<>();

    static {
        categories.add(new Category(1, "Laptop", "Danh mục Laptop"));
        categories.add(new Category(2, "Điện thoại", "Danh mục Điện thoại"));
    }

    @Override
    public List<Category> findAll() {
        return categories;
    }

    @Override
    public Category findById(int id) {
        return categories.stream()
                .filter(c -> c.getId() == id)
                .findFirst()
                .orElse(null);
    }

    @Override
    public void insert(Category category) {
        categories.add(category);
    }

    @Override
    public void update(Category category) {
        Category old = findById(category.getId());
        if (old != null) {
            old.setName(category.getName());
            old.setDescription(category.getDescription());
        }
    }

    @Override
    public void delete(int id) {
        categories.removeIf(c -> c.getId() == id);
    }
}
