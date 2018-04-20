package ua.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "door")
public class Door extends AbstractEntityName{

    @OneToMany(mappedBy = "numberOfDoors")
    private List<Car> cars = new ArrayList<>();

    public Door() {
    }

    public Door(String name) {
        super(name);
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
