package vn.baitap3.services;

import vn.baitap3.models.User;

public interface UserService {
    boolean register(String username, String password, String email, String fullname, String phone);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    User login(String username, String password);
}