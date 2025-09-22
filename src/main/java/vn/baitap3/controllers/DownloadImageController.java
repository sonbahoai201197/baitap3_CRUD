package vn.baitap3.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.baitap3.utils.Constant;

@WebServlet("/image")
public class DownloadImageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String fname = req.getParameter("fname");
        File file = new File(Constant.DIR + File.separator + fname);
        if (file.exists()) {
            resp.setContentType("image/jpeg");
            FileInputStream fis = new FileInputStream(file);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                resp.getOutputStream().write(buffer, 0, bytesRead);
            }
            fis.close();
        }
    }
}
