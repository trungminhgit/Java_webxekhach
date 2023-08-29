/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vexekhach.pojo.Trip;
import com.vexekhach.repository.TripRepository;
import com.vexekhach.service.TripService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ACER
 */
@Service
public class TripServiceImpl implements TripService {

    @Autowired
    private TripRepository tripRepo;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Trip> getTrips(Map<String, String> prams) {
        return this.tripRepo.getTrips(prams);
    }

    @Override
    public int countTrip() {
        return this.tripRepo.countTrip();
    }

    @Override
    public boolean addOrUpdateTrip(Trip trip) {
        if (!trip.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(trip.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                trip.setVehicleImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(TripServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.tripRepo.addOrUpdateTrip(trip);
    }

    @Override
    public Trip getTripById(int tripId) {
        return this.tripRepo.getTripById(tripId);
    }

    @Override
    public boolean deleteTrip(int tripId) {
        return this.tripRepo.deleteTrip(tripId);
    }

}
