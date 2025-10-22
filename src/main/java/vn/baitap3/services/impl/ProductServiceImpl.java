package vn.baitap3.services.impl;

import java.util.List;

import vn.baitap3.daos.ProductDao;
import vn.baitap3.daos.impl.ProductDaoImpl;
import vn.baitap3.models.Product;
import vn.baitap3.services.ProductService;

public class ProductServiceImpl implements ProductService {
    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public List<Product> findByCategoryId(Long categoryId) {
        return productDao.findByCategoryId(categoryId);
    }

    @Override
    public Product findById(Long id) {
        return productDao.findById(id);
    }

    @Override
    public Product findByName(String name) {
        return productDao.findByName(name);
    }

    @Override
    public Long insert(Product product) {
        return productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delete(Long id) {
        productDao.delete(id);
    }

    @Override
    public Long count() {
        return productDao.count();
    }

    @Override
    public List<Product> findAll(int page, int pageSize) {
        return productDao.findAll(page, pageSize);
    }

    @Override
    public List<Product> findByCategoryId(Long categoryId, int page, int pageSize) {
        return productDao.findByCategoryId(categoryId, page, pageSize);
    }

    @Override
    public boolean checkExistName(String name) {
        return productDao.findByName(name) != null;
    }
    
    @Override
    public Long countByCategoryId(Long categoryId) {
        return productDao.countByCategoryId(categoryId);
    }
    
    @Override
    public List<Product> findRelatedProducts(Long productId, Long categoryId, int limit) {
        return productDao.findRelatedProducts(productId, categoryId, limit);
    }
}