package ua.entity;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "city")
public class City extends AbstractEntityName {

    @OneToMany(mappedBy = "placeOfBirth")
    private List<Driver> drivers = new ArrayList<>();

    @OneToMany(mappedBy = "region")
    private List<Car> locationsCars = new ArrayList<>();

    @OneToMany(mappedBy = "goToRegion")
    private List<Car> directionCars = new ArrayList<>();

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

    public List<Car> getLocationsCars() {
        return locationsCars;
    }

    public void setLocationsCars(List<Car> locationsCars) {
        this.locationsCars = locationsCars;
    }

    public List<Car> getDirectionCars() {
        return directionCars;
    }

    public void setDirectionCars(List<Car> directionCars) {
        this.directionCars = directionCars;
    }
}
