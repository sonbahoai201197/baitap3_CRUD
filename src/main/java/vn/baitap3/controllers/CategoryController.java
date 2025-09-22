package vn.baitap3.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.baitap3.models.Category;
import vn.baitap3.services.CategoryService;
import vn.baitap3.services.impl.CategoryServiceImpl;

@WebServlet("/category")
public class CategoryController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> list = categoryService.findAll();
        req.setAttribute("listCategory", list);
        req.getRequestDispatcher("/views/category-list.jsp").forward(req, resp);
    }
}