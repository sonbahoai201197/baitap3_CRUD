package vn.baitap3.controllers;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.baitap3.models.Product;
import vn.baitap3.services.ProductService;
import vn.baitap3.services.impl.ProductServiceImpl;

@WebServlet("/admin/product/delete")
public class ProductDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        
        try {
            long id = Long.parseLong(idStr);
            Product product = productService.findById(id);
            
            if (product != null) {
                // Xóa file ảnh
                String fileName = product.getImage();
                if (fileName != null && !fileName.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                    File file = new File(uploadPath + File.separator + fileName);
                    if (file.exists()) {
                        file.delete();
                    }
                }
                
                // Xóa sản phẩm khỏi database
                productService.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=delete_success");
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=product_not_found");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=invalid_id");
        }
    }
}