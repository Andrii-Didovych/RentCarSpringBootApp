package ua.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.service.CrudService;


public class CrudServiceImpl<T, ID extends Serializable> implements CrudService<T, ID>{

    private final JpaRepository<T, ID> repository;

    public CrudServiceImpl(JpaRepository<T, ID> repository) {
        this.repository = repository;
    }

    @Override
    public T findOne(ID id ) {
        List<ID> ids = new ArrayList<>();
        ids.add(id);
        List<T> ts = repository.findAllById(ids);
        T t = ts.get(0);
        return t;
    }

    @Override
    public List<T> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(T entity) {
        repository.save(entity);
    }

    @Override
    public void delete(ID id) {
        repository.deleteById(id);
    }
}