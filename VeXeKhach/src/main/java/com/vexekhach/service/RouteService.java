/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.service;

import com.vexekhach.pojo.Route;
import java.util.List;

/**
 *
 * @author ACER
 */
public interface RouteService {

    List<Route> getRoutes();

    boolean addOrUpdateRoute(Route route);

    Route getRouteById(int routeId);

    boolean deleteRoute(int routeId);
}
