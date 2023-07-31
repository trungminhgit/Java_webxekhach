/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.pojo;

import java.io.Serializable;
import java.sql.Time;
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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@Entity
@Table(name = "trip")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trip.findAll",query = "SELECT t FROM Trip t"),
    @NamedQuery(name = "Trip.findById",query = "SELECT t FROM Trip t WHERE t.id = :id"),
    @NamedQuery(name = "Trip.findByTripName",query = "SELECT t FROM Trip t WHERE t.tripName = :tripName"),
    @NamedQuery(name = "Trip.findByDeparturePlace",query = "SELECT t FROM Trip t WHERE t.departurePlace =:departurePlace"),
    @NamedQuery(name = "Trip.findByPrice",query = "SELECT t FROM Trip t WHERE t.price = :price"),
    @NamedQuery(name = "Trip.findBySeats",query = "SELECT t FROM Trip t WHERE t.seats = :seats"),
    @NamedQuery(name = "Trip.findByStartTime",query = "SELECT t FROM Trip t WHERE t.startTime = :startTime"),
    @NamedQuery(name = "Trip.findByVehicleName",query = "SELECT t FROM Trip t WHERE t.vehicleName = :vehicleName"),
    @NamedQuery(name = "Trip.findByVehicleImage",query = "SELECT t FROM Trip t WHERE t.vehicleImage = :vehicleImage")
})
public class Trip implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;

    @Basic(optional = false)
    @Column(name = "trip_name")
    @NotNull
    @Size(min = 5, max = 50)
    private String tripName;

    @Basic(optional = false)
    @Column(name = "departure_place")
    @NotNull
    @Size(min = 5, max = 50)
    private String departurePlace;

    @Basic(optional = false)
    @Column(name = "price")
    @NotNull
    private Long price;

    @Column(name = "seats")
    private Integer seats;

    @Column(name = "start_time")
    @Temporal(TemporalType.TIME)
    private Time startTime;

    @Column(name = "vehicle_name")
    private String vehicleName;

    @Column(name = "vehicle_image")
    private String vehicleImage;

    private Integer driverId;
    
    @JoinColumn(name = "route_id",referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Route routeId;

    @Transient
    private MultipartFile file;

    public Trip() {

    }

    public Trip(Integer id) {
        this.id = id;
    }

    public Trip(Integer id, String tripName) {
        this.id = id;
        this.tripName = tripName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTripName() {
        return tripName;
    }

    public void setTripName(String tripName) {
        this.tripName = tripName;
    }

    public String getDeparturePlace() {
        return departurePlace;
    }

    public void setDeparturePlace(String departurePlace) {
        this.departurePlace = departurePlace;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Integer getSeats() {
        return seats;
    }

    public void setSeats(Integer seats) {
        this.seats = seats;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public String getVehicleImage() {
        return vehicleImage;
    }

    public void setVehicleImage(String vehicleImage) {
        this.vehicleImage = vehicleImage;
    }

    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
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
        hash = 83 * hash + Objects.hashCode(this.id);
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
        final Trip other = (Trip) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "Trip{" + "id=" + id + '}';
    }

}
