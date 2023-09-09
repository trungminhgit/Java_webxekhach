/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.components.JwtService;
import com.vexekhach.pojo.User;
import com.vexekhach.service.RouteService;
import com.vexekhach.service.UserService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtService jwtService;

    @DeleteMapping("/users/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int userId) {
        this.userService.deleteUser(userId);
    }

    @PostMapping("/login/")
    @CrossOrigin
    public ResponseEntity<String> login(@RequestBody User user) {
        if (this.userService.authUser(user.getUserName(), user.getPassword()) == true) {
            String token = this.jwtService.generateTokenLogin(user.getUserName());

            return new ResponseEntity<>(token, HttpStatus.OK);
        }

        return new ResponseEntity<>("error", HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/register/",
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @CrossOrigin
    public ResponseEntity<?> addUser(@RequestParam Map<String, String> params, @RequestPart MultipartFile avatar) {
        if (this.userService.getUserByUsername(params.get("userName"))==null) {
            User user = this.userService.addUser(params, avatar);
            return new ResponseEntity<>(user, HttpStatus.CREATED);
        }
        return  new ResponseEntity<>("Tên đăng nhập đã tồn tại.",HttpStatus.BAD_REQUEST);
    }

    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<User> detailUser(Principal user) {
        User u = this.userService.getUserByUsername(user.getName());
        return new ResponseEntity<>(u, HttpStatus.OK);
    }
}
