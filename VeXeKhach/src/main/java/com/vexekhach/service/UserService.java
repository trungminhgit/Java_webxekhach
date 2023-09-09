/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.service;

import com.vexekhach.pojo.User;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
public interface UserService extends UserDetailsService {

    List<User> getUsers();

    int countUsers();

    User getUserByUsername(String userName);

    User addUser(Map<String, String> params, MultipartFile avatar);

    List<User> getUsersByParam(Map<String, String> params);

    boolean authUser(String username, String password);

    boolean updateUser(User user, String newPassword);

    User getUserById(int userId);

    boolean deleteUser(int userId);
}
