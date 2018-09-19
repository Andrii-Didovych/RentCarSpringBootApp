package ua.service;

import ua.model.request.MainInfoRequest;
import ua.model.request.PasswordRequest;
import ua.model.request.DriverRegistrationRequest;

import java.util.List;

public interface UserService {

    List<String> findAllCities();

//    void save(DriverRegistrationRequest request);

    void changePassword(PasswordRequest request, String email);

    void changeMainInfo(MainInfoRequest mainInfoRequest, String email);

    Long numberOfUsers();

    boolean addUser(DriverRegistrationRequest request);

    boolean activateUser(String code);
}
