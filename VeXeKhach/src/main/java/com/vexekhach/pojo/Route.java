/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ACER
 */
@Entity
@Table(name = "route")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Route.findAll", query = "SELECT route FROM Route route"),
    @NamedQuery(name = "Route.findById", query = "SELECT route FROM Route route WHERE route.id =:id"),
    @NamedQuery(name = "Route.findByRouteName", query = "SELECT route FROM Route route WHERE route.routeName =:routeName")
})
public class Route implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;

    @Basic(optional = false)
    @Column(name = "route_name")
    @NotNull(message = "{route.name.notNullMsg}")
    private String routeName;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "routeId")
    @JsonIgnore
    private Set<Trip> setTrip;

    public Route() {

    }

    public Route(Integer id) {
        this.id = id;
    }

    public Route(Integer id, String routeName) {
        this.id = id;
        this.routeName = routeName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    @XmlTransient
    public Set<Trip> getSetTrip() {
        return setTrip;
    }

    public void setSetTrip(Set<Trip> setTrip) {
        this.setTrip = setTrip;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final Route other = (Route) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "Route{" + "id=" + id + '}';
    }

}
