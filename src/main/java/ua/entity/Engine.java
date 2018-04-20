package ua.entity;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name ="engine" )
public class Engine extends AbstractEntityName {

    @OneToMany(mappedBy = "engine")
    private List<Car> cars = new ArrayList<>();

    public Engine() {
    }

    public Engine(String name) {
        super(name);
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
