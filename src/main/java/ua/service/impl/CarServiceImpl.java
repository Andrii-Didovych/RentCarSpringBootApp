package ua.service.impl;

import org.springframework.stereotype.Service;
import ua.converter.DateConverter;
import ua.entity.Brand;
import ua.entity.Car;
import ua.entity.Driver;
import ua.entity.InfoAboutRent;
import ua.entity.enums.*;
import ua.model.request.CarRequest;
import ua.model.request.LendCarRequest;
import ua.repository.CarRepository;
import ua.service.CarService;

import java.time.LocalDate;
import java.util.List;

@Service
public class CarServiceImpl implements CarService{

    private final CarRepository repository;

    private final DateConverter converter;

    public CarServiceImpl(CarRepository repository, DateConverter converter) {
        this.converter = converter;
        this.repository = repository;
    }

    @Override
    public List<String> findAllBrands() {
        return repository.findAllBrands();
    }

    @Override
    public List<String> findAllCities() {
        return repository.findAllCities();
    }

    @Override
    public void updateCar(CarRequest carRequest, String email) {
        String notSelect = MyGlobalVariable.NOT_SELECTED;
        Driver driver = repository.findCarByUserEmail(email);
        Car car = driver.getCar();
        if (car==null) {
            car = new Car();
            car.setBrand(repository.findBrandById());
            car.setModel(notSelect);
            car.setDrive(Drive.Missing);
            car.setNumberOfDoors(Door.Missing);
            car.setTransmission(Transmission.Missing);
            car.setEngine(Engine.Missing);
            car.setBody(Body.Missing);
            car.setYearOfManufacture(LocalDate.of(1111,11,11));
            car.setPhotoOfCar(MyGlobalVariable.DEFAULT_PHOTO_OF_CAR);
        }else {
        if (!carRequest.getBrand().getName().equals(notSelect)) car.setBrand(carRequest.getBrand());
        if (!carRequest.getModel().isEmpty())car.setModel(carRequest.getModel());
        if (!carRequest.getYearOfManufacture().isEmpty())car.setYearOfManufacture(converter.convertStringToLocalDate(carRequest.getYearOfManufacture()));
        if (!carRequest.getBody().name().equals(notSelect))car.setBody(carRequest.getBody());
        if (!carRequest.getEngine().name().equals(notSelect))car.setEngine(carRequest.getEngine());
        if (!carRequest.getTransmission().name().equals(notSelect))car.setTransmission(carRequest.getTransmission());
        if (!carRequest.getDrive().name().equals(notSelect))car.setDrive(carRequest.getDrive());
        if (!carRequest.getNumberOfDoors().name().equals(notSelect))car.setNumberOfDoors(carRequest.getNumberOfDoors());}
            car.setDriver(driver);
            repository.save(car);
    }

}
