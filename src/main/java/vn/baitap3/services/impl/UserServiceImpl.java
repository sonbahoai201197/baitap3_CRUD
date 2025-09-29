package vn.baitap3.services.impl;

import java.util.Date;

import vn.baitap3.daos.UserDao;
import vn.baitap3.daos.impl.UserDaoImpl;
import vn.baitap3.models.User;
import vn.baitap3.services.UserService;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (dao.checkExistUsername(username) || dao.checkExistEmail(email) || dao.checkExistPhone(phone)) {
            return false;
        }
        Date now = new Date();
        User u = new User(email, username, password, fullname, phone);
        dao.insert(u);
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return dao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return dao.checkExistUsername(username);
    }

    @Override
    public User login(String usernameOrEmail, String password) {
        // thử tìm theo username
        User u = dao.findByUsername(usernameOrEmail);

        // nếu không có thì thử tiếp theo email
        if (u == null && dao instanceof UserDaoImpl) {
            u = ((UserDaoImpl) dao).findByEmail(usernameOrEmail);
        }

        // kiểm tra mật khẩu plain text
        if (u != null && u.getPassword().equals(password)) {
            return u;
        }
        return null;
    }
}
