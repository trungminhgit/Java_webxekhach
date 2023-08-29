/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.service.impl;

import com.vexekhach.pojo.Route;
import com.vexekhach.repository.RouteRepository;
import com.vexekhach.service.RouteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ACER
 */
@Service
public class RouteServiceImpl implements RouteService {

    @Autowired
    private RouteRepository routeRepo;

    @Override
    public List<Route> getRoutes() {
        return this.routeRepo.getRoutes();
    }

    @Override
    public boolean addOrUpdateRoute(Route route) {
        return this.routeRepo.addOrUpdateRoute(route);
    }

    @Override
    public Route getRouteById(int routeId) {
        return this.routeRepo.getRouteById(routeId);
    }

    @Override
    public boolean deleteRoute(int routeId) {
        return this.routeRepo.deleteRoute(routeId);
    }

}
