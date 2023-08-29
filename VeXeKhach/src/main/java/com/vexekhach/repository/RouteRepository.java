/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.repository;

import java.util.List;
import com.vexekhach.pojo.Route;

/**
 *
 * @author ACER
 */
public interface RouteRepository {

    List<Route> getRoutes();

    boolean addOrUpdateRoute(Route route);

    Route getRouteById(int routeId);

    boolean deleteRoute(int routeId);
}
