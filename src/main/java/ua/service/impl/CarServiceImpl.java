package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.entity.Car;
import ua.repository.CarRepository;
import ua.service.CarService;
@Service
public class CarServiceImpl extends CrudServiceImpl<Car, Integer> implements CarService{

    @Autowired
    public CarServiceImpl(CarRepository repository) {
        super(repository);
    }
}
