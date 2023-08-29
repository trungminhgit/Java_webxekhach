/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.service.RouteService;
import com.vexekhach.service.TripService;
import com.vexekhach.service.UserService;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ACER
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class IndexController {

    @Autowired
    private TripService tripService;
    @Autowired
    private RouteService routeService;
    @Autowired
    private UserService userService;
    @Autowired
    private Environment environment;

    @ModelAttribute
    public void commonAttri(Model model) {
        model.addAttribute("routes", this.routeService.getRoutes());
        model.addAttribute("users",this.userService.getUsers());
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("trips", this.tripService.getTrips(params));

        int pageSize = Integer.parseInt(this.environment.getProperty("PAGE_SIZE"));
        int count = this.tripService.countTrip();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "index";
    }
}
