/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.repository;

import com.vexekhach.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ACER
 */
public interface UserRepository {

    User getUserByUsername(String userName);
    
    List<User> getUsersByParam(Map<String, String> params);

    List<User> getUsers();
    
    int countUsers();
    
    boolean authUser(String username, String password);

    User addUser(User user);
    
    boolean updateUser(User user);

    User getUserById(int userId);

    boolean deleteUser(int userId);
}
