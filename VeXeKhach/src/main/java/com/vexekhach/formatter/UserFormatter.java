/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.formatter;

import com.vexekhach.pojo.User;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ACER
 */
public class UserFormatter implements Formatter<User> {

    @Override
    public String print(User user, Locale locale) {
        return String.valueOf(user.getId());
    }

    @Override
    public User parse(String userId, Locale locale) throws ParseException {
        return new User(Integer.parseInt(userId));
    }

}
