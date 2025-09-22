package vn.baitap3.controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = {"/admin/category/edit"})
public class CategoryEditController extends HttpServlet {
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category cate = cateService.get(id);
        req.setAttribute("cate", cate);
        req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("cate_id"));
        String name = req.getParameter("cate_name");
        String icons = req.getParameter("icons");

        Category c = new Category(id, name, icons);
        cateService.update(c);

        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
