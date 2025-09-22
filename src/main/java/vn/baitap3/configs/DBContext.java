package vn.baitap3.configs;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * DBContext - quản lý kết nối MySQL.
 * CHỈNH: DB_URL, USER, PASS theo XAMPP của bạn.
 */
public class DBContext {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/baitap3?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = ""; // nếu bạn có password thì điền vào

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL driver
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("✅ Kết nối MySQL thành công!");
        } catch (Exception e) {
            System.out.println("❌ Kết nối MySQL thất bại!");
            e.printStackTrace();
        }
        return conn;
    }

    // Test nhanh: Run As -> Java Application
    public static void main(String[] args) {
        Connection c = getConnection();
        if (c != null) {
            try { c.close(); System.out.println("Đóng connection."); } catch (Exception e) {}
        }
    }
}
