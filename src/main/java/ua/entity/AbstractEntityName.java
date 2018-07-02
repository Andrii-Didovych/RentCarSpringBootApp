package ua.entity;

import org.hibernate.validator.constraints.NotBlank;
import ua.validation.annotation.UniqueBrand;
import ua.validation.annotation.UniqueCity;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class AbstractEntityName extends AbstractEntity {

    @UniqueCity(message = "This city has already created!")
    @UniqueBrand(message = "This brand has already created!")
    @NotBlank(message = "Field cannot be empty!")
    private String name;

    public AbstractEntityName() {
        super();
    }

    public AbstractEntityName(String name) {
        super();
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
