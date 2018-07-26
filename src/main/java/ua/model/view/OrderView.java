package ua.model.view;
import ua.entity.enums.Chauffeur;
import ua.entity.enums.Status;
import java.math.BigDecimal;
import java.time.LocalDate;

public class OrderView {

    private Integer id;

    private Integer driverId;

    private BigDecimal pricePerDay;

    private LocalDate periodOfRentFrom;

    private LocalDate periodOfRentTo;

    private String region;

    private Chauffeur chauffeur;

    private Status status;

//    fields from driver and car
    private String name;

    private String surname;

    private String brand;

    private String Model;

    private String photoOfDriver;

    private String photoOfCar;

    public OrderView(Integer id, Integer driverId, BigDecimal pricePerDay, LocalDate periodOfRentFrom, LocalDate periodOfRentTo, String region, Chauffeur chauffeur, Status status, String name, String surname, String brand, String model, String photoOfDriver, String photoOfCar) {
        this.id = id;
        this.driverId = driverId;
        this.pricePerDay = pricePerDay;
        this.periodOfRentFrom = periodOfRentFrom;
        this.periodOfRentTo = periodOfRentTo;
        this.region = region;
        this.chauffeur = chauffeur;
        this.status = status;
        this.name = name;
        this.surname = surname;
        this.brand = brand;
        Model = model;
        this.photoOfDriver = photoOfDriver;
        this.photoOfCar = photoOfCar;
    }

    public OrderView(Integer id, Integer driverId, BigDecimal pricePerDay, LocalDate periodOfRentFrom, LocalDate periodOfRentTo, String region, Chauffeur chauffeur, Status status) {
        this.id = id;
        this.driverId = driverId;
        this.pricePerDay = pricePerDay;
        this.periodOfRentFrom = periodOfRentFrom;
        this.periodOfRentTo = periodOfRentTo;
        this.region = region;
        this.chauffeur = chauffeur;
        this.status = status;
    }

    public OrderView(Integer id, BigDecimal pricePerDay, LocalDate periodOfRentFrom, LocalDate periodOfRentTo, String region, Chauffeur chauffeur, Status status) {
        this.id = id;
        this.pricePerDay = pricePerDay;
        this.periodOfRentFrom = periodOfRentFrom;
        this.periodOfRentTo = periodOfRentTo;
        this.region = region;
        this.chauffeur = chauffeur;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String model) {
        Model = model;
    }

    public String getPhotoOfDriver() {
        return photoOfDriver;
    }

    public void setPhotoOfDriver(String photoOfDriver) {
        this.photoOfDriver = photoOfDriver;
    }

    public String getPhotoOfCar() {
        return photoOfCar;
    }

    public void setPhotoOfCar(String photoOfCar) {
        this.photoOfCar = photoOfCar;
    }

    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(BigDecimal pricePerDay) {
        this.pricePerDay = pricePerDay;
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

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }


    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }
}
