package ua.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ua.converter.DateConverter;
import ua.entity.Driver;
import ua.entity.User;
import ua.entity.enums.Role;
import ua.model.request.DriverRegistrationRequest;
import ua.model.request.MainInfoRequest;
import ua.model.request.PasswordRequest;
import ua.repository.UserRepository;
import ua.service.UserService;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl  implements UserService {

    private final  UserRepository repository;

    private final PasswordEncoder encoder;

    private final DateConverter converter;

    private final MailSender mailSender;

    @Value("${url.path}")
    private String urlPath;


    public UserServiceImpl(UserRepository repository, PasswordEncoder encoder, DateConverter converter, MailSender mailSender) {
        this.repository = repository;
        this.encoder = encoder;
        this.converter = converter;
        this.mailSender = mailSender;
    }

    public boolean addUser(DriverRegistrationRequest request) {
        User userFromDb = repository.findByEmail(request.getEmail());

        if (userFromDb != null) {
            return false;
        }

        User user = new User();
        user.setActive(false);
        user.setEmail(request.getEmail());
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(encoder.encode(request.getPassword()));
        if (repository.findAll().isEmpty())user.setRole(Role.ROLE_ADMIN);
        else user.setRole(Role.ROLE_DRIVER);

        Driver driver = new Driver();
        driver.setName(request.getName());
        driver.setSurname(request.getSurname());
        driver.setPhone(request.getPhone());
        driver.setCountOfTrips(0);
        driver.setDateOfBirth(LocalDate.of(1111,11,11));
        driver.setExperienceBegan(LocalDate.of(1111,11,11));
        driver.setPlaceOfBirth(repository.findCityByNameRepository(1));
        driver.setPhotoURL(MyGlobalVariable.DEFAULT_PHOTO_OF_DRIVER);
        user.setDriver(driver);
        driver.setUser(user);
        repository.save(user);

        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, " + user.getDriver().getName()+ "! \n" +
                            "Welcome to RentCar. Please, visit next link: " + urlPath+
                    user.getActivationCode()
            );
            System.out.printf(message + "   "+ user.getDriver().getName());
            mailSender.send(user.getEmail(), "Activation code", message);
        }

        return true;
    }

    @Override
    public boolean activateUser(String code) {
        User user = repository.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);
        repository.save(user);

        return true;
    }
    //    @Override
//    public void save(DriverRegistrationRequest request) {
//        User user = new User();
//        user.setEmail(request.getEmail());
//        user.setPassword(encoder.encode(request.getPassword()));
//        if (repository.findAll().isEmpty())user.setRole(Role.ROLE_ADMIN);
//        else user.setRole(Role.ROLE_DRIVER);
//        Driver driver = new Driver();
//        driver.setName(request.getName());
//        driver.setSurname(request.getSurname());
//        driver.setPhone(request.getPhone());
//        driver.setCountOfTrips(0);
//        driver.setDateOfBirth(LocalDate.of(1111,11,11));
//        driver.setExperienceBegan(LocalDate.of(1111,11,11));
//        driver.setPlaceOfBirth(repository.findCityByNameRepository(1));
//        driver.setPhotoURL(MyGlobalVariable.DEFAULT_PHOTO_OF_DRIVER);
//        user.setDriver(driver);
//        driver.setUser(user);
//        repository.save(user);
//    }

    @Override
    public List<String> findAllCities() {
        return repository.findAllCitiesRepository();
    }

    @Override
    public void changePassword(PasswordRequest request, String email) {
        User user = repository.findByEmail(email);
        user.setPassword(encoder.encode(request.getPassword()));
        repository.save(user);
    }

    @Override
    public void changeMainInfo(MainInfoRequest request, String email) {
        User user = repository.findByEmail(email);
        Driver driver = user.getDriver();
        if (!request.getName().isEmpty())driver.setName(request.getName());
        if (!request.getSurname().isEmpty())driver.setSurname(request.getSurname());
        if(!request.getPhone().isEmpty())driver.setPhone(request.getPhone());
        if (!request.getDateOfBirth().isEmpty())driver.setDateOfBirth(converter.convertStringToLocalDate(request.getDateOfBirth()));
        if (!request.getExperienceBegan().isEmpty())driver.setExperienceBegan(converter.convertStringToLocalDate(request.getExperienceBegan()));
        if (!request.getPlaceOfBirth().getName().equals(MyGlobalVariable.NOT_SELECTED))driver.setPlaceOfBirth(request.getPlaceOfBirth());
        repository.save(user);
    }

    @Override
    public Long numberOfUsers() {
        return repository.count();
    }

}
