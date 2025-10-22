package vn.baitap3.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.baitap3.models.Category;
import vn.baitap3.models.Product;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.ProductService;
import vn.baitap3.services.impl.CategoryServiceImpl;
import vn.baitap3.services.impl.ProductServiceImpl;

@WebServlet("/product/detail/*")
public class ProductDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductService productService;
    private CategoryService categoryService;
    
    public void init() {
        productService = new ProductServiceImpl();
        categoryService = new CategoryServiceImpl();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Get product id from URL
            String pathInfo = request.getPathInfo();
            if (pathInfo == null || pathInfo.equals("/")) {
                response.sendRedirect(request.getContextPath() + "/product");
                return;
            }
            
            Long productId;
            try {
                productId = Long.parseLong(pathInfo.substring(1));
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/product");
                return;
            }
            
            // Get product details
            Product product = productService.findById(productId);
            if (product == null || product.getStatus() == 0) {
                response.sendRedirect(request.getContextPath() + "/product");
                return;
            }
            
            // Get categories for header menu
            List<Category> categories = categoryService.getAll();
            
            // Get related products (same category, exclude current product)
            List<Product> relatedProducts = productService.findRelatedProducts(productId, product.getCategoryId(), 4);
            
            request.setAttribute("product", product);
            request.setAttribute("categories", categories);
            request.setAttribute("relatedProducts", relatedProducts);
            
            request.getRequestDispatcher("/views/product-detail.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }
}