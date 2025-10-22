package vn.baitap3.controllers;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.baitap3.models.Product;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.ProductService;
import vn.baitap3.services.impl.CategoryServiceImpl;
import vn.baitap3.services.impl.ProductServiceImpl;

@WebServlet("/admin/product/edit")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 100
)
public class ProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        
        try {
            long id = Long.parseLong(idStr);
            Product product = productService.findById(id);
            
            if (product != null) {
                req.setAttribute("product", product);
                req.setAttribute("categories", categoryService.getAll());
                req.getRequestDispatcher("/views/admin/edit-product.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=product_not_found");
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=invalid_id");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String categoryIdStr = req.getParameter("categoryId");
        String statusStr = req.getParameter("status");
        
        try {
            long id = Long.parseLong(idStr);
            Product oldProduct = productService.findById(id);
            
            if (oldProduct == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=product_not_found");
                return;
            }
            
            // Validate dữ liệu
            if (name == null || name.isEmpty() || priceStr == null || priceStr.isEmpty() 
                || categoryIdStr == null || categoryIdStr.isEmpty()) {
                req.setAttribute("alert", "Vui lòng điền đầy đủ thông tin!");
                req.setAttribute("product", oldProduct);
                req.setAttribute("categories", categoryService.getAll());
                req.getRequestDispatcher("/views/admin/edit-product.jsp").forward(req, resp);
                return;
            }
            
            // Kiểm tra tên sản phẩm đã tồn tại chưa (trừ sản phẩm hiện tại)
            Product existingProduct = productService.findByName(name);
            if (existingProduct != null && !existingProduct.getId().equals(id)) {
                req.setAttribute("alert", "Tên sản phẩm đã tồn tại!");
                req.setAttribute("product", oldProduct);
                req.setAttribute("categories", categoryService.getAll());
                req.getRequestDispatcher("/views/admin/edit-product.jsp").forward(req, resp);
                return;
            }
            
            // Parse dữ liệu
            double price = Double.parseDouble(priceStr);
            int categoryId = Integer.parseInt(categoryIdStr);
            int status = statusStr != null && statusStr.equals("1") ? 1 : 0;
            
            // Upload file mới (nếu có)
            Part filePart = req.getPart("image");
            String fileName = oldProduct.getImage(); // Giữ lại tên file cũ nếu không upload file mới
            
            if (filePart != null && filePart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                // Xóa file cũ
                if (fileName != null && !fileName.isEmpty()) {
                    File oldFile = new File(uploadPath + File.separator + fileName);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
                
                // Upload file mới
                fileName = System.currentTimeMillis() + "_" + getFileName(filePart);
                filePart.write(uploadPath + File.separator + fileName);
            }
            
            // Cập nhật sản phẩm
            Product product = new Product();
            product.setId(id);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setCategoryId((long) categoryId);
            product.setImage(fileName);
            product.setStatus(status);
            
            productService.update(product);
            resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=edit_success");
            
        } catch (NumberFormatException e) {
            req.setAttribute("alert", "Dữ liệu không hợp lệ!");
            req.setAttribute("product", productService.findById(Long.parseLong(idStr)));
            req.setAttribute("categories", categoryService.getAll());
            req.getRequestDispatcher("/views/admin/edit-product.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("alert", "Có lỗi xảy ra: " + e.getMessage());
            req.setAttribute("product", productService.findById(Long.parseLong(idStr)));
            req.setAttribute("categories", categoryService.getAll());
            req.getRequestDispatcher("/views/admin/edit-product.jsp").forward(req, resp);
        }
    }
    
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}