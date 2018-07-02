package ua.model.view;

import ua.converter.DateConverterImpl;
import ua.entity.enums.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CarView {

    private Integer id;

    private String brand;

    private String model;

    private String yearOfManufacture;
    //   Enum
    private Engine engine;

    private Transmission transmission;

    private Drive drive;

    private Body body;

    private Door numberOfDoors;

    public CarView(Integer id, String brand, String model, LocalDate yearOfManufacture,
                   Engine engine, Transmission transmission, Drive drive, Body body, Door numberOfDoors) {
        DateConverterImpl converter = new DateConverterImpl();
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.yearOfManufacture = yearOfManufacture.format(DateTimeFormatter.ofPattern("yyyy"));
        this.engine = engine;
        this.transmission = transmission;
        this.drive = drive;
        this.body = body;
        this.numberOfDoors = numberOfDoors;
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

    public Body getBody() {
        return body;
    }

    public void setBody(Body body) {
        this.body = body;
    }

    public Door getNumberOfDoors() {
        return numberOfDoors;
    }

    public void setNumberOfDoors(Door numberOfDoors) {
        this.numberOfDoors = numberOfDoors;
    }

    public String getYearOfManufacture() {
        return yearOfManufacture;
    }

    public void setYearOfManufacture(String yearOfManufacture) {
        this.yearOfManufacture = yearOfManufacture;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Engine getEngine() {
        return engine;
    }

    public void setEngine(Engine engine) {
        this.engine = engine;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
