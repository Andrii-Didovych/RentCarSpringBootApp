package ua.service.impl;

import org.springframework.stereotype.Service;
import ua.model.view.DriverView;
import ua.repository.DriverRepository;
import ua.service.DriverService;

import java.util.List;

@Service
public class DriverServiceImpl implements DriverService {

    private DriverRepository repository;

    public DriverServiceImpl(DriverRepository repository) {
        this.repository = repository;
    }

    @Override
    public DriverView findAuthorizedUser() {
        return repository.findAllDriverRepository();
    }

    @Override
    public List<String> findAllCities() {
        return repository.findAllCitiesRepository();
    }
}
