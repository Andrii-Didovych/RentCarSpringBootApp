package ua.entity;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "transmission")
public class Transmission extends AbstractEntityName{

    @OneToMany(mappedBy = "transmission")
    private List<Car> cars = new ArrayList<>();

    public Transmission() {
    }

    public Transmission(String name) {
        super(name);
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
