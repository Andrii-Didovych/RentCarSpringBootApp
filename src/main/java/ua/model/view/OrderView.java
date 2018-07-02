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
