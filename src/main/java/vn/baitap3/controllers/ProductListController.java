package vn.baitap3.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.baitap3.models.Product;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.ProductService;
import vn.baitap3.services.impl.CategoryServiceImpl;
import vn.baitap3.services.impl.ProductServiceImpl;

@WebServlet("/admin/product/list")
public class ProductListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tham số phân trang
        String pageStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("pageSize");
        
        int page = 1;
        int pageSize = 10;
        
        try {
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            if (pageSizeStr != null) {
                pageSize = Integer.parseInt(pageSizeStr);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        
        // Lấy danh sách sản phẩm theo trang
        List<Product> products = productService.findAll(page, pageSize);
        
        // Tính tổng số trang
        long total = productService.count();
        int totalPages = (int) Math.ceil((double) total / pageSize);
        
        // Set attribute
        req.setAttribute("products", products);
        req.setAttribute("categories", categoryService.getAll());
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("pageSize", pageSize);
        
        // Forward to view
        req.getRequestDispatcher("/views/admin/list-product.jsp").forward(req, resp);
    }
}