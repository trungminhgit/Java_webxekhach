/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.pojo;

import java.io.Serializable;
import java.util.Objects;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll",query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById",query = "SELECT u FROM User u WHERE u.id =:id"),
    @NamedQuery(name = "User.findByUserName",query = "SELECT u FROM User u WHERE u.userName =:userName"),
    @NamedQuery(name = "User.findByPassword",query = "SELECT u FROM User u WHERE u.password =:password"),
    @NamedQuery(name = "User.findByFirstName",query = "SELECT u FROM User u WHERE u.firstName =: firstName"),
    @NamedQuery(name = "User.findByLastName",query = "SELECT u FROM User u WHERE u.lastName =:lastName"),
    @NamedQuery(name = "User.findByEmail",query = "SELECT u FROM User u WHERE u.email =:email"),
    @NamedQuery(name = "User.findByPhone",query = "SELECT u FROM User u WHERE u.phone =:phone"),
    @NamedQuery(name = "User.findByActive",query = "SELECT u FROM User u WHERE u.active =:active"),
    @NamedQuery(name = "User.findByAvatar",query = "SELECT u FROM User u WHERE u.avatar =:avatar"),
})
public class User implements Serializable{
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    
    @Column(name = "user_name")
    @Basic(optional = false)
    private String userName;
    
    @Column(name = "password")
    @Basic(optional = false)
    private String password;
    
    @Column(name = "first_name")
    @Basic(optional = false)
    private String firstName;
    
    @Column(name = "last_name")
    @Basic(optional = false)
    private String lastName;
    
    @Column(name = "email")
    @Basic(optional = false)
    private String email;
    
    @Column(name = "phone")
    @Basic(optional = false)
    private String phone;
    
    @Column(name = "active")
    private Boolean active;
    
    @Column(name = "avatar")
    private String avatar;
   
    @JoinColumn(name = "role_id",referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Role roleId;
    
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "driverId")
    private Set<Trip> setTrip;
    
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "userId")
    private Set<Ticket> setTicket;
    
    @Transient
    private MultipartFile file;

    public User(){
        
    }

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String userName, String password, String firstName, String lastName, String email, String phone, String avatar) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.avatar = avatar;
    }
    
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    @XmlTransient
    public Set<Trip> getSetTrip() {
        return setTrip;
    }

    public void setSetTrip(Set<Trip> setTrip) {
        this.setTrip = setTrip;
    }

    @XmlTransient
    public Set<Ticket> getSetTicket() {
        return setTicket;
    }

    public void setSetTicket(Set<Ticket> setTicket) {
        this.setTicket = setTicket;
    }
    
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + '}';
    }
    
    
    
}
