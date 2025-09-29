package vn.baitap3.controllers;

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

        // ✅ Xử lý price an toàn
        double price = 0;
        String priceStr = req.getParameter("price");
        if (priceStr != null && !priceStr.trim().isEmpty()) {
            try {
                price = Double.parseDouble(priceStr.trim());
            } catch (NumberFormatException e) {
                price = 0;
            }
        }

        Part part = req.getPart("icon");
        String fileName = null;
        if (part != null && part.getSize() > 0) {
            String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
            fileName = System.currentTimeMillis() + ext;
            part.write(Constant.DIR + "\\category\\" + fileName);
        }

        Category cate = new Category();
        cate.setCateName(cateName);
        cate.setPrice(price);
        cate.setIcons(fileName != null ? "category/" + fileName : null);

        cateService.insert(cate);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
