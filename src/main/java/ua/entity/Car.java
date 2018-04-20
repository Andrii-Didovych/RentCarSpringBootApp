package ua.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "car")
public class Car extends AbstractEntity {

    private BigDecimal pricePerDay;

    private LocalDate yearOfManufacture;

    private LocalDate periodOfRentFrom;

    private LocalDate periodOfRentTo;

    //   Enum
    private Chauffeur chauffeur;

    @ManyToOne(fetch = FetchType.LAZY)
    private Brand brand;

    @ManyToOne(fetch = FetchType.LAZY)
    private Body body;

    @ManyToOne(fetch = FetchType.LAZY)
    private City region;

    @ManyToOne(fetch = FetchType.LAZY)
    private City goToRegion;

    @ManyToOne(fetch = FetchType.LAZY)
    private Engine engine;

    @ManyToOne(fetch = FetchType.LAZY)
    private Transmission transmission;

    @ManyToOne(fetch = FetchType.LAZY)
    private Drive drive;

    @ManyToOne(fetch = FetchType.LAZY)
    private Door numberOfDoors;

    @OneToOne
    private Driver driver;

    @ManyToMany(mappedBy = "cars")
    private List<Driver> drivers = new ArrayList<>();

    public BigDecimal getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(BigDecimal pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public LocalDate getYearOfManufacture() {
        return yearOfManufacture;
    }

    public void setYearOfManufacture(LocalDate yearOfManufacture) {
        this.yearOfManufacture = yearOfManufacture;
    }

    public LocalDate getPeriodOfRentFrom() {
        return periodOfRentFrom;
    }

    public void setPeriodOfRentFrom(LocalDate periodOfRentFrom) {
        this.periodOfRentFrom = periodOfRentFrom;
    }

    public LocalDate getPeriodOfRentTo() {
        return periodOfRentTo;
    }

    public void setPeriodOfRentTo(LocalDate periodOfRentTo) {
        this.periodOfRentTo = periodOfRentTo;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Body getBody() {
        return body;
    }

    public void setBody(Body body) {
        this.body = body;
    }

    public City getRegion() {
        return region;
    }

    public void setRegion(City region) {
        this.region = region;
    }

    public City getGoToRegion() {
        return goToRegion;
    }

    public void setGoToRegion(City goToRegion) {
        this.goToRegion = goToRegion;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public List<Driver> getDrivers() {
        return drivers;
    }

    public void setDrivers(List<Driver> drivers) {
        this.drivers = drivers;
    }

    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }

    public Engine getEngine() {
        return engine;
    }

    public void setEngine(Engine engine) {
        this.engine = engine;
    }

    public Transmission getTransmission() {
        return transmission;
    }

    public void setTransmission(Transmission transmission) {
        this.transmission = transmission;
    }

    public Door getNumberOfDoors() {
        return numberOfDoors;
    }

    public void setNumberOfDoors(Door numberOfDoors) {
        this.numberOfDoors = numberOfDoors;
    }

    public Drive getDrive() {
        return drive;
    }

    public void setDrive(Drive drive) {
        this.drive = drive;
    }
}
