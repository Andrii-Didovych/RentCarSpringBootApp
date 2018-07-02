package ua.model.request;

import org.hibernate.validator.constraints.NotBlank;
import ua.entity.City;
import ua.entity.enums.*;
import ua.validation.annotation.AllFieldShouldBeFailed;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import java.math.BigDecimal;

@AllFieldShouldBeFailed(message = "Some of fields were not failed or date is wrong!")
public class LendCarRequest {

    @DecimalMin(value = "0.1", inclusive = true, message = "Price is less than allowed!")
    @DecimalMax(value = "9.9", inclusive = true, message = "Price is bigger than allowed!")
    private BigDecimal pricePerDay;

    @NotBlank(message = "Field cannot be empty!")
    private String periodOfRentFrom;

    @NotBlank(message = "Field cannot be empty!")
    private String periodOfRentTo;

    private City region;

    private Chauffeur chauffeur;

    public BigDecimal getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(BigDecimal pricePerDay) {
        this.pricePerDay = pricePerDay;
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
