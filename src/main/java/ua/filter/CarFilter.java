package ua.filter;

import ua.entity.enums.*;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class CarFilter {

    private static final Pattern INT_PATTERN = Pattern.compile("^([0-9]{1,10})$");

    private static final Pattern DECIMAL_PATTERN = Pattern.compile("^([0-9]{1,18}\\.[0-9]{0,2})|([0-9]{1,18}\\,[0-9]{0,2})|([0-9]{1,18})$");

    private String minPrice="";

    private String maxPrice="";

    private String periodOfRentFrom="";

    private String periodOfRentTo="";

    private List<String> region= new ArrayList<>();

    private List<String> brand = new ArrayList<>();

    private String model="";

    private Chauffeur chauffeur;

    private Body body;

    private Door door;

    private Drive drive;

    private Engine engine;

    private Transmission transmission;

    public List<String> getBrand() {
        return brand;
    }

    public void setBrand(List<String> brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Door getDoor() {
        return door;
    }

    public void setDoor(Door door) {
        this.door = door;
    }

    public Drive getDrive() {
        return drive;
    }

    public void setDrive(Drive drive) {
        this.drive = drive;
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

    public Body getBody() {
        return body;
    }

    public void setBody(Body body) {
        this.body = body;
    }

    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }


    public String getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(String minPrice) {
        if(DECIMAL_PATTERN.matcher(minPrice).matches())
        this.minPrice = minPrice;
    }

    public String getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(String maxPrice) {
        if(DECIMAL_PATTERN.matcher(maxPrice).matches())
        this.maxPrice = maxPrice;
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

    public List<String> getRegion() {
        return region;
    }

    public void setRegion(List<String> region) {
        this.region = region;
    }
}
