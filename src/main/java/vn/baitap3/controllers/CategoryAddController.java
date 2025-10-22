package vn.baitap3.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.impl.CategoryServiceImpl;
import vn.baitap3.utils.Constant;

@WebServlet(urlPatterns = {"/admin/category/add"})
@MultipartConfig
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String cateName = req.getParameter("name");


        Part filePart = req.getPart("icon");
        String fileName = null;
        
        if (filePart != null && filePart.getSize() > 0) {
            // Kiểm tra định dạng file
            String contentType = filePart.getContentType();
            if (!Constant.isImageFile(contentType)) {
                req.setAttribute("error", "Chỉ chấp nhận file ảnh (jpg, png, gif)!");
                req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
                return;
            }
            
            // Kiểm tra kích thước file
            if (filePart.getSize() > Constant.MAX_FILE_SIZE) {
                req.setAttribute("error", "Kích thước file không được vượt quá 10MB!");
                req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
                return;
            }
            
            // Tạo thư mục nếu chưa tồn tại
            String uploadPath = getServletContext().getRealPath("") + File.separator + Constant.UPLOAD_CATEGORY_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            // Tạo tên file mới và lưu file
            fileName = Constant.generateFileName(filePart.getSubmittedFileName());
            filePart.write(uploadPath + File.separator + fileName);
        }

        Category cate = new Category();
        cate.setCateName(cateName);
        cate.setIcons(fileName);

        cateService.insert(cate);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
