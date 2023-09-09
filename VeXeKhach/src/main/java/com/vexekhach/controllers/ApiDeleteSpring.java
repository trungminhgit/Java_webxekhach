/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.service.RouteService;
import com.vexekhach.service.TripService;
import com.vexekhach.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ACER
 */
@RestController
public class ApiDeleteSpring {
    @Autowired
    private TripService tripService;
    
    @Autowired
    private RouteService routeService;
    
    @Autowired
    private UserService userService;
    
    @DeleteMapping("/users/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteUser(@PathVariable(value = "id") int userId) {
        this.userService.deleteUser(userId);
    }
    
    @DeleteMapping("/routes/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteRoute(@PathVariable(value = "id") int routeId) {
        this.routeService.deleteRoute(routeId);
    }
    
    @DeleteMapping("/trips/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTrip(@PathVariable(value = "id") int tripId) {
        this.tripService.deleteTrip(tripId);
    }
}
