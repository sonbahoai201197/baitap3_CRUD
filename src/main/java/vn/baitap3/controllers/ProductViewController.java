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

@WebServlet("/product")
public class ProductViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 12; // Number of products per page
    
    private ProductService productService;
    private CategoryService categoryService;
    
    public void init() {
        productService = new ProductServiceImpl();
        categoryService = new CategoryServiceImpl();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Get current page
            int page = 1;
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                // Keep default page = 1
            }
            
            // Get category filter
            Long categoryId = null;
            try {
                categoryId = Long.parseLong(request.getParameter("categoryId"));
            } catch (NumberFormatException e) {
                // No category filter
            }
            
            // Get categories for filter dropdown
            List<Category> categories = categoryService.getAll();
            request.setAttribute("categories", categories);
            
            // Get total products and calculate total pages
            Long totalProducts;
            List<Product> products;
            
            if (categoryId != null) {
                totalProducts = productService.count(); // Need to add countByCategoryId method
                products = productService.findByCategoryId(categoryId, page, PAGE_SIZE);
            } else {
                totalProducts = productService.count();
                products = productService.findAll(page, PAGE_SIZE);
            }
            
            int totalPages = (int) Math.ceil(totalProducts * 1.0 / PAGE_SIZE);
            
            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            
            request.getRequestDispatcher("/views/product-list.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }
}