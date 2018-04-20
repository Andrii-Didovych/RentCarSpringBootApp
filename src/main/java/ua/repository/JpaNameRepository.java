package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;
import ua.entity.AbstractEntityName;

import java.io.Serializable;

@NoRepositoryBean
public interface JpaNameRepository<T extends AbstractEntityName, ID extends Serializable> extends JpaRepository<T, ID>{

    T findByName(String s);

    boolean existsByName(String s);

}
