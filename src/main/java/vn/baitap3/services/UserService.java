package vn.baitap3.services;

import vn.baitap3.models.User;

public interface UserService {
    boolean register(String email, String username, String password, String fullname, String phone);
    User login(String usernameOrEmail, String password);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
}
