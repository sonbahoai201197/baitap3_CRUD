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
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    public static final String COOKIE_REMEMBER = "username";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check if user is already logged in
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            User user = (User) session.getAttribute("account");
            // Redirect based on role
            if (user.getRoleid() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
            return;
        }

        // Check remember cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (COOKIE_REMEMBER.equals(cookie.getName())) {
                    req.setAttribute("username", cookie.getValue());
                    req.setAttribute("remember", "on");
                    break;
                }
            }
        }
        
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String usernameOrEmail = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        if (usernameOrEmail == null || usernameOrEmail.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("alert", "Tài khoản hoặc mật khẩu không được để trống");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        User user = userService.login(usernameOrEmail, password);
        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);

            if ("on".equals(remember)) {
                Cookie cookie = new Cookie(COOKIE_REMEMBER, usernameOrEmail);
                cookie.setMaxAge(30 * 60);
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
            }

            // Redirect based on role
            if (user.getRoleid() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute("alert", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
