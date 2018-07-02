package ua.service.impl;

import java.io.Serializable;
import java.util.List;

import ua.entity.AbstractEntityName;
import ua.repository.JpaNameRepository;
import ua.service.CrudService;

public class CrudServiceImpl<T extends AbstractEntityName , ID extends Serializable> implements CrudService<T, ID>{

    private final JpaNameRepository repository;

    public CrudServiceImpl(JpaNameRepository repository) {
        this.repository = repository;
    }

    @Override
    public T findOne(ID id ) {
        return (T) repository.findOne(id);
    }

    @Override
    public List<T> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(T entity) {
        if (!repository.exists(1)){
            entity.setName(MyGlobalVariable.NOT_SELECTED);
//            repository.save(entity);
        }
//        else if (!entity.getName().equals(MyGlobalVariable.NOT_SELECTED)&&entity.getId()!=1)
        repository.save(entity);
    }

    @Override
    public void delete(ID id) {
        if (!id.equals(1))
        repository.delete(id);
    }
}