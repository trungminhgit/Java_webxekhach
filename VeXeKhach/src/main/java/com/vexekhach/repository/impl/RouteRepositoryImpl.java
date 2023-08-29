/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.repository.impl;

import com.vexekhach.pojo.Route;
import com.vexekhach.pojo.Trip;
import com.vexekhach.repository.RouteRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ACER
 */
@Repository
@Transactional
public class RouteRepositoryImpl implements RouteRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Route> getRoutes() {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("From Route");
        return query.getResultList();
    }

    @Override
    public boolean addOrUpdateRoute(Route route) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (route.getId() == null) {
                s.save(route);
            } else {
                s.update(route);
            }
            return true;
        } catch (HibernateException exception) {
            exception.printStackTrace();
            return false;
        }
    }

    @Override
    public Route getRouteById(int routeId) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Route.class, routeId);
    }

    @Override
    public boolean deleteRoute(int routeId) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Route route = this.getRouteById(routeId);
            s.delete(route);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
