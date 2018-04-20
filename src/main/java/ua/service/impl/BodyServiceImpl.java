package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.Body;
import ua.service.BodyService;
@Service
public class BodyServiceImpl extends CrudServiceImpl<Body, Integer> implements BodyService{
    @Autowired
    public BodyServiceImpl(JpaRepository<Body, Integer> repository) {
        super(repository);
    }
}
