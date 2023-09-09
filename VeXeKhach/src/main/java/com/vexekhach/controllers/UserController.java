/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.pojo.Trip;
import com.vexekhach.pojo.User;
import com.vexekhach.service.RoleService;
import com.vexekhach.service.UserService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@Controller
@ControllerAdvice
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private Environment environment;

    @ModelAttribute
    public void commonAttri(Model model) {
        model.addAttribute("roles", this.roleService.getRoles());
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @GetMapping("/users")
    public String list(Model model) {
        model.addAttribute("user", new User());
        return "users";
    }

    @PostMapping("/register")
    public String addUser(@ModelAttribute(value = "user") @Valid User u, BindingResult rs, @RequestParam Map<String, String> params, @RequestParam("file") MultipartFile file, Model model) {
        if (!rs.hasErrors()) {
            if (params != null) {
                User user = userService.addUser(params, file);
                if (user != null) {
                    model.addAttribute("success", "Đăng kí thành công.");
                    return "redirect:/";
                } else {
                    model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
                }
            }
        }
        return "register";
    }

    @RequestMapping("/usersAdmin")
    public String userAdmin(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("users", this.userService.getUsersByParam(params));

        int pageSize = Integer.parseInt(this.environment.getProperty("PAGE_SIZE"));
        int count = this.userService.countUsers();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "usersAdmin";
    }

    @GetMapping("/users/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "users";
    }

    @PostMapping("/users")
    public String updateUser(@ModelAttribute(value = "user") @Valid User u, BindingResult rs, @RequestParam("password") String password) {
        if (!rs.hasErrors()) {

            if (this.userService.updateUser(u, password) == true) {
                return "redirect:/usersAdmin";
            }
        }
        return "users";
    }
}
