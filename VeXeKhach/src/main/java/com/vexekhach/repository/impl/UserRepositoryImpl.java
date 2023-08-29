/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.repository.impl;

import com.vexekhach.pojo.User;
import com.vexekhach.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ACER
 */
@Repository
@PropertySource("classpath:configs.properties")
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public User getUserByUsername(String userName) {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("From User Where userName =:userName");
        query.setParameter("userName", userName);

        try {
            return (User) query.getSingleResult();
        } catch (NoResultException e) {
            return null; // Trả về null nếu không tìm thấy kết quả
        }
    }

    @Override
    public List<User> getUsers() {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("From User");
        return query.getResultList();
    }

    @Override
    public int countUsers() {
        Session s = this.factory.getObject().getCurrentSession();
        org.hibernate.query.Query query = s.createQuery("Select Count(*) From User ");
        return Integer.parseInt(query.getSingleResult().toString());
    }

    @Override
    public User addUser(User user) {
//        User u = this.getUserByUsername(user.getUserName());
        Session s = this.factory.getObject().getCurrentSession();
        s.save(user);
        return user;
    }

    @Override
    public boolean updateUser(User user) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (user.getId() != null) {
                s.update(user);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public User getUserById(int userId) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(User.class, userId);
    }

    @Override
    public boolean deleteUser(int userId) {
        try {
            Session s = this.factory.getObject().getCurrentSession();
            User user = this.getUserById(userId);
            s.delete(user);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getUsersByParam(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder cri = s.getCriteriaBuilder();
        CriteriaQuery<User> u = cri.createQuery(User.class);
        Root rUser = u.from(User.class);
        u.select(rUser);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(cri.like(rUser.get("firstName"), String.format("%%%s%%", kw)));
            }

            String roleId = params.get("roleId");
            if (roleId != null && !roleId.isEmpty()) {
                predicates.add(cri.equal(rUser.get("roleId"), Integer.parseInt(roleId)));
            }
            u.where(predicates.toArray(Predicate[]::new));
        }
        u.orderBy(cri.desc(rUser.get("id")));

        org.hibernate.query.Query query = s.createQuery(u);

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
    public boolean authUser(String username, String password) {
        User user = this.getUserByUsername(username);
        return this.passwordEncoder.matches(password, user.getPassword());
    }

}
