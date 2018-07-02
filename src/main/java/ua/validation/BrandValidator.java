package ua.validation;

import org.springframework.stereotype.Component;
import ua.repository.BrandRepository;
import ua.service.impl.MyGlobalVariable;
import ua.validation.annotation.UniqueBrand;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class BrandValidator implements ConstraintValidator<UniqueBrand, String> {

    private final BrandRepository repository;

    public BrandValidator(BrandRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(UniqueBrand constraintAnnotation) {
    }

    @Override
    public boolean isValid(String name, ConstraintValidatorContext context) {
        return repository.findByName(name.trim())==null;
    }

}
