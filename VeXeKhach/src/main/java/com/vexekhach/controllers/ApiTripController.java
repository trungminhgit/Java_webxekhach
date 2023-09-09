/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vexekhach.controllers;

import com.vexekhach.pojo.Evaluate;
import com.vexekhach.pojo.Trip;
import com.vexekhach.service.EvaluateService;
import com.vexekhach.service.RouteService;
import com.vexekhach.service.TripService;
import com.vexekhach.service.UserService;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@RestController
@RequestMapping("/api")
public class ApiTripController {

    @Autowired
    private TripService tripService;

    @Autowired
    private RouteService routeService;

    @Autowired
    private EvaluateService evaluateService;

    @Autowired
    private UserService userService;

    @DeleteMapping("/trips/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int tripId) {
        this.tripService.deleteTrip(tripId);
    }

    @RequestMapping("/trips/")
    @CrossOrigin
    public ResponseEntity<List<Trip>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.tripService.getTrips(params), HttpStatus.OK);
    }

    @RequestMapping(path = "/trips/{tripId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Trip> detailTrip(@PathVariable(value = "tripId") int tripId) {
        return new ResponseEntity<>(this.tripService.getTripById(tripId), HttpStatus.OK);
    }

    @PostMapping(path = "/trips", consumes = {
        MediaType.MULTIPART_FORM_DATA_VALUE,
        MediaType.APPLICATION_JSON_VALUE
    })
    @ResponseStatus(HttpStatus.CREATED)
    public void addTrip(@RequestParam Map<String, String> params, @RequestPart MultipartFile[] file) {
        Trip t = new Trip();
        t.setTripName(params.get("tripName"));
        t.setDeparturePlace(params.get("departurePlace"));
        t.setPrice(Long.parseLong(params.get("pricce")));
        t.setSeats(Integer.parseInt(params.get("seates")));
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            java.util.Date date = sdf.parse(params.get("startTime"));
            Time startTime = new Time(date.getTime());
            t.setStartTime(startTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        t.setVehicleName(params.get("vehicleName"));
        t.setDriverId(this.userService.getUserById(Integer.parseInt(params.get("driverId"))));
        t.setRouteId(this.routeService.getRouteById(Integer.parseInt(params.get("routeId"))));
        if (file.length > 0) {
            t.setFile(file[0]);
        }
        this.tripService.addOrUpdateTrip(t);
    }

    @GetMapping("/trips/{tripId}/evaluates/")
    @CrossOrigin
    public ResponseEntity<List<Evaluate>> listEvalates(@PathVariable(value = "tripId") int tripId) {
        return new ResponseEntity<>(this.evaluateService.getEvaluates(tripId), HttpStatus.OK);
    }

    @PostMapping(path = "/trips/{tripId}/evaluates/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Evaluate> addEvaluate(@RequestBody Evaluate evaluate,@PathVariable(value = "tripId") int tripId) {
        Evaluate e = this.evaluateService.addEvaluate(evaluate,tripId);

        return new ResponseEntity<>(e, HttpStatus.CREATED);
    }
}
