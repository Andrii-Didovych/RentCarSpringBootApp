package ua.model.request;

import ua.entity.*;
import ua.entity.enums.*;
import ua.validation.annotation.CorrectDate;
import ua.validation.annotation.NotSaveIfEnteredNothing;

import java.math.BigDecimal;

@NotSaveIfEnteredNothing(message = "Any of fields was not failed!")
public class CarRequest {

    private BigDecimal pricePerDay;

    @CorrectDate(message = "Date was not entered correctly!")
    private String yearOfManufacture;

    private String periodOfRentFrom;

    private String periodOfRentTo;

    private Brand brand;

    private String model;

    private City region;

    private City goToRegion;

    private Engine engine;

    private Transmission transmission;

    private Drive drive;

    //   Enum
    private Chauffeur chauffeur;

    private Body body;

    private Door numberOfDoors;

    public Body getBody() {
        return body;
    }

    public void setBody(Body body) {
        this.body = body;
    }

    public BigDecimal getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(BigDecimal pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public String getYearOfManufacture() {
        return yearOfManufacture;
    }

    public void setYearOfManufacture(String yearOfManufacture) {
        this.yearOfManufacture = yearOfManufacture;
    }

    public String getPeriodOfRentFrom() {
        return periodOfRentFrom;
    }

    public void setPeriodOfRentFrom(String periodOfRentFrom) {
        this.periodOfRentFrom = periodOfRentFrom;
    }

    public String getPeriodOfRentTo() {
        return periodOfRentTo;
    }

    public void setPeriodOfRentTo(String periodOfRentTo) {
        this.periodOfRentTo = periodOfRentTo;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
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

    public Drive getDrive() {
        return drive;
    }

    public void setDrive(Drive drive) {
        this.drive = drive;
    }

    public Door getNumberOfDoors() {
        return numberOfDoors;
    }

    public void setNumberOfDoors(Door numberOfDoors) {
        this.numberOfDoors = numberOfDoors;
    }

    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }
}
