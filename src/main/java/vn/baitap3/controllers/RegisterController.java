package vn.baitap3.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.services.UserService;
import vn.baitap3.services.impl.UserServiceImpl;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        if (userService.checkExistEmail(email)) {
            req.setAttribute("error", "Email đã tồn tại");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        boolean ok = userService.register(email, username, password, fullname, phone);
        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("error", "Đăng ký thất bại");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}