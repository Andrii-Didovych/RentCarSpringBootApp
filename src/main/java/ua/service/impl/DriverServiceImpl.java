package ua.service.impl;

import org.springframework.stereotype.Service;
import ua.model.view.CarView;
import ua.model.view.DriverView;
import ua.repository.DriverRepository;
import ua.service.DriverService;

@Service
public class DriverServiceImpl implements DriverService {

    private final DriverRepository repository;

    private  Integer id;

    public DriverServiceImpl(DriverRepository repository) {
        this.repository = repository;
    }

    @Override
    public DriverView findAuthorizedDriverView(String email) {
        DriverView view= repository.findAuthorizeDriverViewRepository(email);
        id = view.getId();
        return view;
    }

    @Override
    public DriverView pageOfDriver(Integer id) {
        return repository.findPageOfDriverById(id);
    }

    @Override
    public CarView findDriversCar(String email) {
        return repository.findCarByDriversId(email);
    }
}
