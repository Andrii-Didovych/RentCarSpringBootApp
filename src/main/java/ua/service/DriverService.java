package ua.service;

import ua.model.view.CarView;
import ua.model.view.DriverView;


public interface DriverService   {
    DriverView findAuthorizedDriverView(String email);

    CarView findDriversCar(String email);

    DriverView pageOfDriver(Integer id);
}
