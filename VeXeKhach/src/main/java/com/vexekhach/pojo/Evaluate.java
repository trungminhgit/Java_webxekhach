/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ACER
 */
@Entity
@Table(name = "evaluate")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Evaluate.findAll", query = "SELECT e FROM Evaluate e"),
    @NamedQuery(name = "Evaluate.findById", query = "SELECT e FROM Evaluate e WHERE e.id =:id"),
    @NamedQuery(name = "Evaluate.findByDesciption", query = "SELECT e FROM Evaluate e WHERE e.desciption =:desciption"),
    @NamedQuery(name = "Evaluate.findByCreatedDate",query = "SELECT e FROM Evaluate e WHERE e.createdDate =:createdDate")
})
public class Evaluate implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;

    @Basic(optional = false)
    @Column(name = "desciption")
    private String desciption;

    @Basic(optional = false)
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @JoinColumn(name = "trip_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Trip tripId;

    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userId;

    public Evaluate() {

    }

    public Evaluate(Integer id) {
        this.id = id;
    }

    public Evaluate(Integer id, String desciption) {
        this.id = id;
        this.desciption = desciption;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Trip getTripId() {
        return tripId;
    }

    public void setTripId(Trip tripId) {
        this.tripId = tripId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        final Evaluate other = (Evaluate) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "Evaluate{" + "id=" + id + '}';
    }

}
