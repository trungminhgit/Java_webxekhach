/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vexekhach.pojo.User;
import com.vexekhach.repository.RoleRepository;
import com.vexekhach.repository.UserRepository;
import com.vexekhach.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user = this.userRepo.getUserByUsername(userName);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid user !!!");
        }
        String userRole = "ROLE_" + user.getRoleId().getRoleName();

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(userRole));

        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), authorities);
    }

    @Override
    public List<User> getUsers() {
        return this.userRepo.getUsers();
    }

    @Override
    public int countUsers() {
        return this.userRepo.countUsers();
    }

    @Override
    public User addUser(Map<String, String> params, MultipartFile avatar) {
        User user = new User();

        user.setLastName(params.get("lastName"));
        user.setFirstName(params.get("firstName"));
        user.setUserName(params.get("userName"));
        user.setPassword(this.passwordEncoder.encode(params.get("password")));
        user.setEmail(params.get("email"));
        user.setPhone(params.get("phone"));
        user.setRoleId(this.roleRepo.getRoleById(2));
        User checkUser = this.userRepo.getUserByUsername(user.getUserName());

        if (!avatar.isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(avatar.getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (checkUser != null) {
            return null;
        }

        this.userRepo.addUser(user);
        return user;
    }

    @Override
    public User getUserById(int userId) {
        return userRepo.getUserById(userId);
    }

    @Override
    public boolean deleteUser(int userId) {
        return this.userRepo.deleteUser(userId);
    }

    @Override
    public boolean updateUser(User user, String newPassword) {
        if (StringUtils.isNotEmpty(newPassword)) {
            String enPassword = passwordEncoder.encode(newPassword);
            user.setPassword(enPassword);
        }
        return this.userRepo.updateUser(user);
    }

    @Override
    public List<User> getUsersByParam(Map<String, String> params) {
        return this.userRepo.getUsersByParam(params);
    }

    @Override
    public User getUserByUsername(String userName) {
        return this.userRepo.getUserByUsername(userName);
    }

    @Override
    public boolean authUser(String username, String password) {
        return this.userRepo.authUser(username, password);
    }

}
