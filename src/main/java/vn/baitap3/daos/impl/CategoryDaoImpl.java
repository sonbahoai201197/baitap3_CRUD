package vn.baitap3.daos.impl;

import java.util.ArrayList;
import java.util.List;

import vn.baitap3.daos.CategoryDao;
import vn.baitap3.models.Category;

public class CategoryDaoImpl implements CategoryDao {

    private static List<Category> categories = new ArrayList<>();

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
    public void update(Category category) {
        Category c = findById(category.getId());
        if (c != null) {
            c.setName(category.getName());
        }
    }

    @Override
    public void insert(Category category) {
        categories.add(category);
    }

    @Override
    public void delete(int id) {
        categories.removeIf(c -> c.getId() == id);
    }
}
