/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.repository.impl;

import com.vexekhach.pojo.Cart;
import com.vexekhach.pojo.Ticket;
import com.vexekhach.pojo.User;
import com.vexekhach.repository.ReceiptRepository;
import com.vexekhach.repository.TripRepository;
import com.vexekhach.repository.UserRepository;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ACER
 */
@Repository
@Transactional
public class ReceiptRepositoryImpl implements ReceiptRepository {

    @Autowired
    private UserRepository userRepo;
    @Autowired
    private TripRepository tripRepo;
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public boolean addReceipt(Map<String, Cart> carts) {
        
        Session s = this.factory.getObject().getCurrentSession();
        
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User u = this.userRepo.getUserByUsername(authentication.getName());

            for (Cart c : carts.values()) {
                Ticket ticket = new Ticket();
                ticket.setTripId(this.tripRepo.getTripById(Integer.parseInt(c.getId().toString())));
                ticket.setUserId(u);
                ticket.setCreatedDate(new Date());
                ticket.setSeatNumber(c.getSeatNumber());
                ticket.setStartDay(c.getStartDate());
                ticket.setTicketPrice(c.getUnitPrice());
                ticket.setId(null);
                s.save(ticket);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
