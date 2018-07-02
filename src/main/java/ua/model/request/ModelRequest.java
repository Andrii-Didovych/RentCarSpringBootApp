package ua.model.request;

import org.hibernate.validator.constraints.NotBlank;
import ua.entity.Brand;


public class ModelRequest {
    private Integer id;

    @NotBlank(message = "Field cannot be empty!")
    private String name;

    private Brand brand;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }
}
