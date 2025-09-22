package vn.baitap3.daos;

import vn.baitap3.models.User;

public interface UserDao {
    boolean insert(User user);
    User getByUsername(String username);
    User getByEmail(String email);
}
