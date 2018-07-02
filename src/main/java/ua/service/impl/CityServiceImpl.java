package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.City;
import ua.repository.JpaNameRepository;
import ua.service.CityCervice;
@Service
public class CityServiceImpl extends CrudServiceImpl<City,Integer> implements CityCervice{

    @Autowired
    public CityServiceImpl(JpaNameRepository<City, Integer> repository) {
        super(repository);
    }
}
