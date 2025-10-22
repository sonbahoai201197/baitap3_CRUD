package vn.baitap3.controllers;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.impl.CategoryServiceImpl;
import vn.baitap3.utils.Constant;

@WebServlet(urlPatterns = {"/admin/category/edit"})
@MultipartConfig
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category cate = cateService.get(id);
        req.setAttribute("category", cate);
        req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String cateName = req.getParameter("name");


        Part filePart = req.getPart("icon");
        String fileName = null;
        Category cate = cateService.get(id);
        cate.setCateName(cateName);

        if (filePart != null && filePart.getSize() > 0) {
            // Kiểm tra định dạng file
            String contentType = filePart.getContentType();
            if (!Constant.isImageFile(contentType)) {
                req.setAttribute("error", "Chỉ chấp nhận file ảnh (jpg, png, gif)!");
                req.setAttribute("category", cate);
                req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
                return;
            }
            
            // Kiểm tra kích thước file
            if (filePart.getSize() > Constant.MAX_FILE_SIZE) {
                req.setAttribute("error", "Kích thước file không được vượt quá 10MB!");
                req.setAttribute("category", cate);
                req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
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
            
            // Cập nhật đường dẫn ảnh mới
            cate.setIcons(fileName);
        }

        cateService.edit(cate);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
