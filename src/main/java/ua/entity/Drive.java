package ua.entity;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "drive")
public class Drive extends AbstractEntityName {

    @OneToMany(mappedBy = "drive")
    private List<Car> cars = new ArrayList<>();

    public Drive() {
    }

    public Drive(String name) {
        super(name);
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
