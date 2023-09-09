/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vexekhach.service;

import com.vexekhach.pojo.Cart;
import java.util.Map;

/**
 *
 * @author ACER
 */
public interface ReceiptService {

    boolean addReceipt(Map<String, Cart> carts);
}
