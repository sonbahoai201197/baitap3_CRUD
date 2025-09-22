package vn.baitap3.controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = {"/admin/category/add"})
public class CategoryAddController extends HttpServlet {
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
        String name = req.getParameter("cate_name");
        String icons = req.getParameter("icons");

        Category c = new Category(name, icons);
        cateService.insert(c);

        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
