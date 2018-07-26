package ua.entity;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "city",  indexes = @Index(columnList = "name"))
public class City extends AbstractEntityName {

    @OneToMany(mappedBy = "placeOfBirth")
    private List<Driver> drivers = new ArrayList<>();

    @OneToMany(mappedBy = "region")
    private List<InfoAboutRent> locationsCars = new ArrayList<>();

    public City() {
    }

    public City(String name) {
        super(name);
    }

    public List<Driver> getDrivers() {
        return drivers;
    }

    public void setDrivers(List<Driver> drivers) {
        this.drivers = drivers;
    }

    public List<InfoAboutRent> getLocationsCars() {
        return locationsCars;
    }

    public void setLocationsCars(List<InfoAboutRent> locationsCars) {
        this.locationsCars = locationsCars;
    }

}
