package vn.baitap3.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.baitap3.models.User;

@WebServlet("/hello")  // URL để truy cập servlet này
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hàm GET mặc định khi người dùng truy cập /hello
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Lấy session hiện tại (nếu chưa có thì tạo mới = true)
        HttpSession session = req.getSession(false); // false = không tạo mới nếu chưa có

        // Kiểm tra user trong session (do LoginController set khi đăng nhập thành công)
        User u = (session != null) ? (User) session.getAttribute("user") : null;

        if (u == null) {
            // Nếu chưa login thì redirect về trang login
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            // Nếu đã login thì forward sang hello.jsp để hiển thị thông tin
            req.setAttribute("user", u); // đính kèm user để JSP dùng EL hiển thị
            req.getRequestDispatcher("/views/hello.jsp").forward(req, resp);
        }
    }
}