/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.service;

import com.vexekhach.pojo.Trip;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ACER
 */
public interface TripService {

    List<Trip> getTrips(Map<String, String> prams);

    int countTrip();

    boolean addOrUpdateTrip(Trip trip);

    Trip getTripById(int tripId);

    boolean deleteTrip(int tripId);
}
