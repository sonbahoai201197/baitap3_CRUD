package vn.baitap3.daos;

import vn.baitap3.models.User;

public interface UserDao {
    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    User findByUsername(String username);
}