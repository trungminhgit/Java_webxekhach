/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.service;

import com.vexekhach.pojo.Evaluate;
import java.util.List;

/**
 *
 * @author ACER
 */
public interface EvaluateService {

    List<Evaluate> getEvaluates(int tripId);

    Evaluate addEvaluate(Evaluate evaluate,int tripId);
}
