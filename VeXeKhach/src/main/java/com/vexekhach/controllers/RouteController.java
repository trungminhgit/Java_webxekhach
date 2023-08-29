/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.pojo.Route;
import com.vexekhach.pojo.Trip;
import com.vexekhach.service.RouteService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ACER
 */
@Controller
public class RouteController {

    @Autowired
    private RouteService routeService;

    @RequestMapping("/routesAdmin")
    public String listRoute(Model model) {
        model.addAttribute("routes", this.routeService.getRoutes());
        return "routesAdmin";
    }

    @GetMapping("/routes")
    public String list(Model model) {
        model.addAttribute("route", new Route());
        return "routes";
    }

    @GetMapping("/routes/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("route", this.routeService.getRouteById(id));
        return "routes";
    }

    @PostMapping("/routes")
    public String add(@ModelAttribute(value = "route") @Valid Route r, BindingResult rs) {
        if (!rs.hasErrors()) {

            if (this.routeService.addOrUpdateRoute(r) == true) {
                return "redirect:/routesAdmin";
            }
        }
        return "routes";
    }

}
