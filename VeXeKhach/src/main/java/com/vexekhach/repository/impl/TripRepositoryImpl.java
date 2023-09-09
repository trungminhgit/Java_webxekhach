/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.repository.impl;

import com.vexekhach.pojo.Trip;
import com.vexekhach.repository.TripRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ACER
 */
@Repository
@PropertySource("classpath:configs.properties")
@Transactional
public class TripRepositoryImpl implements TripRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<Trip> getTrips(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder cri = s.getCriteriaBuilder();
        CriteriaQuery<Trip> t = cri.createQuery(Trip.class);
        Root rTrip = t.from(Trip.class);
        t.select(rTrip);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(cri.like(rTrip.get("tripName"), String.format("%%%s%%", kw)));
            }
            String routeId = params.get("routeId");
            if (routeId != null && !routeId.isEmpty()) {
                predicates.add(cri.equal(rTrip.get("routeId"), Integer.parseInt(routeId)));
            }
            t.where(predicates.toArray(Predicate[]::new));
        }
        t.orderBy(cri.desc(rTrip.get("id")));

        Query query = s.createQuery(t);

        if (params != null) {
            String page = params.get("page");
            int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
            if (page != null) {
                query.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
                query.setMaxResults(pageSize);
            }
        }
        return query.getResultList();
    }

    @Override
    public int countTrip() {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("Select Count(*) From Trip ");
        return Integer.parseInt(query.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateTrip(Trip trip) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (trip.getId() == null) {
                s.save(trip);
            } else {
                s.update(trip);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Trip getTripById(int tripId) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Trip.class, tripId);
    }

    @Override
    public boolean deleteTrip(int tripId) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Trip trip = this.getTripById(tripId);
            s.delete(trip);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
