package vn.baitap3.services.impl;

import java.util.List;
import vn.baitap3.daos.CategoryDao;
import vn.baitap3.daos.impl.CategoryDaoImpl;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public Category findById(int id) {
        return categoryDao.findById(id);
    }

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }
}
