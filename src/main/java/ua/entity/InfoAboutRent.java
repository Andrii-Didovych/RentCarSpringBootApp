package ua.entity;

import ua.entity.enums.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "info_about_rent")
public class InfoAboutRent extends AbstractEntity {

    @Column(name = "price_per_day")
    private BigDecimal pricePerDay;

    @Column(name = "period_of_rent_from")
    private LocalDate periodOfRentFrom;

    @Column(name = "period_of_rent_to")
    private LocalDate periodOfRentTo;

    @ManyToOne(fetch = FetchType.LAZY)
    private City region;

    @ManyToOne(fetch = FetchType.LAZY)
    private Car car;

    private Chauffeur chauffeur;

    private Status status;

    @ManyToMany
    @JoinTable(name = "driver_car", joinColumns = @JoinColumn(name = "info_about_rent_id"),
            inverseJoinColumns = @JoinColumn(name = "driver_id"))
    private List<Driver> drivers = new ArrayList<>();

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public List<Driver> getDrivers() {
        return drivers;
    }

    public void setDrivers(List<Driver> drivers) {
        this.drivers = drivers;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
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

    public City getRegion() {
        return region;
    }

    public void setRegion(City region) {
        this.region = region;
    }

    public Chauffeur getChauffeur() {
        return chauffeur;
    }

    public void setChauffeur(Chauffeur chauffeur) {
        this.chauffeur = chauffeur;
    }
}
