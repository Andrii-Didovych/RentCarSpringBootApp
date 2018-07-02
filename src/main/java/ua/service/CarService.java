package ua.service;



import ua.model.request.CarRequest;

import java.util.List;

public interface CarService{

    List<String> findAllBrands();

    List<String> findAllCities();

    void updateCar(CarRequest carRequest, String email);
}
