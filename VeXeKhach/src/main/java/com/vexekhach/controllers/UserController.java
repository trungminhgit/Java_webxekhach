/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.pojo.User;
import com.vexekhach.service.UserService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private Environment environment;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String addUser(@RequestParam Map<String, String> params, @RequestParam("avatar") MultipartFile avatar,Model model) {
        if (params != null) {
            User user = userService.addUser(params, avatar);
            if (user != null) {
                return "redirect:/"; // Chuyển hướng sau khi thêm thành công
            }else{
                model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
            }
        }
        return "register"; // Trả về trang register nếu có lỗi
    }

//    @RequestMapping("/usersAdmin")
//    public String listUser(Model model, @RequestParam Map<String, String> params) {
//        model.addAttribute("users", this.userService.getUsersByParam(params));
//
//        int pageSize = Integer.parseInt(this.environment.getProperty("PAGE_SIZE"));
//        int count = this.userService.countUsers();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
//
//        return "usersAdmin";
//    }
//    @PostMapping("/register")
//    public String add(@ModelAttribute(value = "user") @Valid User user, BindingResult rs) {
//        if (!rs.hasErrors()) {
//
//            if (this.userService.addUser(user) == true) {
//                return "redirect:/";
//            }
//        }
//        return "register";
//    }
}
