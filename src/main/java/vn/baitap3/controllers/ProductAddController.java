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

@WebServlet("/admin/product/add")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ProductAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categories", categoryService.getAll());
        req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        // Lấy các tham số từ form
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String categoryIdStr = req.getParameter("categoryId");
        String statusStr = req.getParameter("status");
        
        // Validate dữ liệu
        if (name == null || name.isEmpty() || priceStr == null || priceStr.isEmpty() 
            || categoryIdStr == null || categoryIdStr.isEmpty()) {
            req.setAttribute("alert", "Vui lòng điền đầy đủ thông tin!");
            req.setAttribute("categories", categoryService.getAll());
            req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
            return;
        }
        
        // Kiểm tra tên sản phẩm đã tồn tại chưa
        if (productService.checkExistName(name)) {
            req.setAttribute("alert", "Tên sản phẩm đã tồn tại!");
            req.setAttribute("categories", categoryService.getAll());
            req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
            return;
        }
        
        try {
            // Parse dữ liệu
            double price = Double.parseDouble(priceStr);
            int categoryId = Integer.parseInt(categoryIdStr);
            int status = statusStr != null && statusStr.equals("1") ? 1 : 0;
            
            // Upload file
            Part filePart = req.getPart("image");
            String fileName = "";
            if (filePart != null && filePart.getSize() > 0) {
                // Kiểm tra định dạng file
                String contentType = filePart.getContentType();
                if (!Constant.isImageFile(contentType)) {
                    req.setAttribute("alert", "Chỉ chấp nhận file ảnh (jpg, png, gif)!");
                    req.setAttribute("categories", categoryService.getAll());
                    req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
                    return;
                }
                
                // Kiểm tra kích thước file
                if (filePart.getSize() > Constant.MAX_FILE_SIZE) {
                    req.setAttribute("alert", "Kích thước file không được vượt quá 10MB!");
                    req.setAttribute("categories", categoryService.getAll());
                    req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
                    return;
                }
                
                // Tạo thư mục nếu chưa tồn tại
                String uploadPath = getServletContext().getRealPath("") + File.separator + Constant.UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                
                // Tạo tên file mới và lưu file
                fileName = Constant.generateFileName(getFileName(filePart));
                filePart.write(uploadPath + File.separator + fileName);
            }
            
            // Tạo đối tượng Product
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setCategoryId((long) categoryId);
            product.setImage(fileName);
            product.setStatus(status);
            
            // Lưu vào database
            Long newId = productService.insert(product);
            if (newId != null) {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?message=add_success");
            } else {
                throw new Exception("Không thể thêm sản phẩm");
            }
            
        } catch (NumberFormatException e) {
            req.setAttribute("alert", "Dữ liệu không hợp lệ!");
            req.setAttribute("categories", categoryService.getAll());
            req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("alert", "Có lỗi xảy ra: " + e.getMessage());
            req.setAttribute("categories", categoryService.getAll());
            req.getRequestDispatcher("/views/admin/add-product.jsp").forward(req, resp);
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