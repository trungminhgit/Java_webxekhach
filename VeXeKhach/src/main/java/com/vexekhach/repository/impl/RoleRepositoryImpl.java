/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.repository.impl;

import com.vexekhach.pojo.Role;
import com.vexekhach.repository.RoleRepository;
import java.util.List;
import javax.persistence.Query;
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
public class RoleRepositoryImpl implements RoleRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public Role getRoleById(int roleId) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Role.class, roleId);
    }

    @Override
    public List<Role> getRoles() {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("From Role");
        return query.getResultList();
    }

}
