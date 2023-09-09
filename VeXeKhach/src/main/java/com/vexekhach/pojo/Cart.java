/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.pojo;

import java.util.Date;
import lombok.Data;

/**
 *
 * @author ACER
 */
@Data
public class Cart {
    private Integer id;
    private String name;
    private Long unitPrice;
    private Date startDate;
    private int seatNumber;
}
