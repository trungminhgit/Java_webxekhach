/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.pojo.Trip;
import com.vexekhach.service.TripService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author ACER
 */
@Controller
public class TripController {

    @Autowired
    private TripService tripService;

    @GetMapping("/trips")
    public String list(Model model) {
        model.addAttribute("trip", new Trip());
        return "trips";
    }

    @GetMapping("/trips/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("trip", this.tripService.getTripById(id));
        return "trips";
    }

    @PostMapping("/trips")
    public String add(@ModelAttribute(value = "trip") @Valid Trip t, BindingResult rs) {
        if (!rs.hasErrors()) {

            if (this.tripService.addOrUpdateTrip(t) == true) {
                return "redirect:/";
            }
        }
        return "trips";
    }
}
