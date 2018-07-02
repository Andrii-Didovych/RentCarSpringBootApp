package ua.entity;

import ua.entity.enums.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "car")
public class Car extends AbstractEntity {

    private String model;

    private LocalDate yearOfManufacture;

    @ManyToOne(fetch = FetchType.LAZY)
    private Brand brand;

    @OneToMany(mappedBy = "car")
    private List<InfoAboutRent> infoAboutRent = new ArrayList<>();

    @OneToOne
    private Driver driver;

    //enums
    private Body body;

    private Engine engine;

    private Transmission transmission;

    private Drive drive;

    private Door numberOfDoors;

    public List<InfoAboutRent> getInfoAboutRent() {
        return infoAboutRent;
    }

    public void setInfoAboutRent(List<InfoAboutRent> infoAboutRent) {
        this.infoAboutRent = infoAboutRent;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public LocalDate getYearOfManufacture() {
        return yearOfManufacture;
    }

    public void setYearOfManufacture(LocalDate yearOfManufacture) {
        this.yearOfManufacture = yearOfManufacture;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public Body getBody() {
        return body;
    }

    public void setBody(Body body) {
        this.body = body;
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
}
