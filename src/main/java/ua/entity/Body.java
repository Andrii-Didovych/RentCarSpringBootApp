package ua.entity;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "body")
public class Body extends AbstractEntityName {

    public Body() {
    }

    public Body(String name) {
        super(name);
    }

    @OneToMany(mappedBy = "body")
    private List<Car> cars = new ArrayList<>();

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
