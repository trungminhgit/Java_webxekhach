/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.repository.impl;

import com.vexekhach.pojo.Evaluate;
import com.vexekhach.repository.EvaluateRepository;
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
public class EvaluateReporitoryImpl implements EvaluateRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Evaluate> getEvaluates(int tripId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Evaluate Where tripId.id=:id");
        q.setParameter("id", tripId);

        return q.getResultList();
    }

    @Override
    public Evaluate addEvaluate(Evaluate evaluate) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(evaluate);
            return evaluate;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return null;
        }
    }

}
