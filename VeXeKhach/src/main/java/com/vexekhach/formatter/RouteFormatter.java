/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.formatter;

import com.vexekhach.pojo.Route;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ACER
 */
public class RouteFormatter implements Formatter<Route> {

    @Override
    public String print(Route route, Locale locale) {
        return String.valueOf(route.getId());
    }

    @Override
    public Route parse(String routeId, Locale locale) throws ParseException {
        return new Route(Integer.parseInt(routeId));
    }

}
