package vn.baitap3.daos;

import java.util.List;
import vn.baitap3.models.Product;

public interface ProductDao {
    List<Product> findAll();
    List<Product> findByCategoryId(Long categoryId);
    Product findById(Long id);
    Product findByName(String name);
    Long insert(Product product);
    void update(Product product);
    void delete(Long id);
    Long count();
    List<Product> findAll(int page, int pageSize);
    List<Product> findByCategoryId(Long categoryId, int page, int pageSize);
    List<Product> findRelatedProducts(Long productId, Long categoryId, int limit);
    Long countByCategoryId(Long categoryId);
}