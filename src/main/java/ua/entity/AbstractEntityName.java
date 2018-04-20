package ua.entity;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class AbstractEntityName extends AbstractEntity {

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
