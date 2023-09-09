/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.service.impl;

import com.vexekhach.pojo.Evaluate;
import com.vexekhach.pojo.Trip;
import com.vexekhach.pojo.User;
import com.vexekhach.repository.EvaluateRepository;
import com.vexekhach.repository.TripRepository;
import com.vexekhach.repository.UserRepository;
import com.vexekhach.service.EvaluateService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author ACER
 */
@Service
public class EvaluateServiceImpl implements EvaluateService {

    @Autowired
    private EvaluateRepository evaluateRepo;
    
    @Autowired
    private TripRepository tripRepo;

    @Autowired
    private UserRepository userRepo;

    @Override
    public List<Evaluate> getEvaluates(int tripId) {
        return this.evaluateRepo.getEvaluates(tripId);
    }

    @Override
    public Evaluate addEvaluate(Evaluate evaluate,int tripId) {

        evaluate.setCreatedDate(new Date());
        
        Trip trip = this.tripRepo.getTripById(tripId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = this.userRepo.getUserByUsername(authentication.getName());
        evaluate.setUserId(user);
        evaluate.setTripId(trip);
        evaluate.setId(null);
        return this.evaluateRepo.addEvaluate(evaluate);
    }

}
