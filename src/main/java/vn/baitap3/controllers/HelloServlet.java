package vn.baitap3.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.baitap3.models.User;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User u = (session != null) ? (User) session.getAttribute("account") : null; // ✅ dùng "account"

        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("user", u);
            req.getRequestDispatcher("/views/hello.jsp").forward(req, resp);
        }
    }
}
