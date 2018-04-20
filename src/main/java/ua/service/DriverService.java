package ua.service;

import ua.model.view.DriverView;

import java.util.List;

public interface DriverService   {
    DriverView findAuthorizedUser();

    List<String> findAllCities();

}
