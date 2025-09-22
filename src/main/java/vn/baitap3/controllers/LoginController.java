package vn.baitap3.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.models.User;
import vn.baitap3.services.UserService;
import vn.baitap3.services.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    public static final String COOKIE_REMEMBER = "username";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check cookie remember
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (COOKIE_REMEMBER.equals(c.getName())) {
                    // Có cookie -> set session và redirect waiting/home
                    HttpSession session = req.getSession(true);
                    session.setAttribute("account", userService.login(c.getValue(), "")); // lưu username (nên lưu user object properly)
                    resp.sendRedirect(req.getContextPath() + "/home");
                    return;
                }
            }
        }
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username"); // or email
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("alert", "Tài khoản hoặc mật khẩu không được rỗng");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        User user = userService.login(username, password);
        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);

            if ("on".equals(remember)) {
                Cookie cookie = new Cookie(COOKIE_REMEMBER, username);
                cookie.setMaxAge(30 * 60); // 30 phút
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
            }
            resp.sendRedirect(req.getContextPath() + "/home"); // or /waiting as slide
        } else {
            req.setAttribute("alert", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
