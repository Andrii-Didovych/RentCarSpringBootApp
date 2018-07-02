package ua.validation;

import org.springframework.stereotype.Component;
import ua.repository.CityRepository;
import ua.service.impl.MyGlobalVariable;
import ua.validation.annotation.UniqueCity;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class CityValidator implements ConstraintValidator<UniqueCity, String> {


    private final CityRepository repository;

    public CityValidator(CityRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(UniqueCity constraintAnnotation) {
    }

    @Override
    public boolean isValid(String name, ConstraintValidatorContext context) {
        return repository.findByName(name.trim())==null;
    }

}
