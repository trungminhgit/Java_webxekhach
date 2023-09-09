/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author ACER
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@PropertySource("classpath:configs.properties")
@ComponentScan(basePackages = {
    "com.vexekhach.controllers",
    "com.vexekhach.repository",
    "com.vexekhach.service"
})
@Order(2)
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private Environment env;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    /**
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");

        http.formLogin().defaultSuccessUrl("/")
                .failureUrl("/login?error");

        http.logout().logoutSuccessUrl("/login");

        http.exceptionHandling()
                .accessDeniedPage("/login?accessDenied");

        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/register").permitAll()
                .antMatchers("/trips").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/trips/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/routes").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/routes/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/routesAdmin").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/usersAdmin").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/users").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/users/**").access("hasRole('ROLE_ADMIN')");

        http.csrf().disable();
    }

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary cloudinary;
        cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dchkh7d18",
                "api_key", "894713387132774",
                "api_secret", "W4kybsCw_SFDKj0rESDLiDlgh1Y",
                "secure", true));
        return cloudinary;
    }

    @Bean
    public SimpleDateFormat simpleDateFormat() {
        return new SimpleDateFormat("yyyy-MM-dd");
    }
}
