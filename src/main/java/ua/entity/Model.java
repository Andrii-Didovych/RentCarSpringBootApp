package ua.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "model")
public class Model extends AbstractEntityName {

    @ManyToOne(fetch = FetchType.LAZY)
    private Brand brand;

    public Model() {
    }

    public Model(String name, Brand brand) {
        super(name);
        this.brand = brand;
    }

    public Model(String name) {
        super(name);
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }
}
