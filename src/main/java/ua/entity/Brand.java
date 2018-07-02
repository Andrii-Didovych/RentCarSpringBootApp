package ua.entity;


import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "brand")
public class Brand extends AbstractEntityName {

    @OneToMany(mappedBy = "brand")
    private List<Car> cars = new ArrayList<>();

    public Brand() {
    }

    public Brand(String name) {
        super(name);
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
