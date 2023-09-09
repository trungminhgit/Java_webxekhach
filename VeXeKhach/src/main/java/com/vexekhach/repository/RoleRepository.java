/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.repository;

import com.vexekhach.pojo.Role;
import java.util.List;

/**
 *
 * @author ACER
 */
public interface RoleRepository {

    Role getRoleById(int roleId);

    List<Role> getRoles();
}
