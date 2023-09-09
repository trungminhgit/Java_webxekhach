/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.service.impl;

import com.vexekhach.pojo.Role;
import com.vexekhach.repository.RoleRepository;
import com.vexekhach.service.RoleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ACER
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepo;

    @Override
    public Role getRoleById(int roleId) {
        return this.roleRepo.getRoleById(roleId);
    }

    @Override
    public List<Role> getRoles() {
        return this.roleRepo.getRoles();
    }

}
