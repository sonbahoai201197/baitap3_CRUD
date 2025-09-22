package vn.baitap3.services.impl;

import java.util.List;
import vn.baitap3.daos.CategoryDao;
import vn.baitap3.daos.impl.CategoryDaoImpl;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao dao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) { dao.insert(category); }

    @Override
    public void update(Category category) { dao.update(category); }

    @Override
    public void delete(int id) { dao.delete(id); }

    @Override
    public Category get(int id) { return dao.get(id); }

    @Override
    public List<Category> getAll() { return dao.getAll(); }
}
