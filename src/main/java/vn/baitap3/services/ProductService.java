package vn.baitap3.services;

import java.util.List;
import vn.baitap3.models.Product;

public interface ProductService {
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
    boolean checkExistName(String name);
    Long countByCategoryId(Long categoryId);
}
    List<Product> findRelatedProducts(Long productId, Long categoryId, int limit);
}