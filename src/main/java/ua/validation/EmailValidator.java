package ua.validation;

import org.springframework.stereotype.Component;
import ua.repository.DriverRepository;
import ua.repository.UserRepository;
import ua.validation.annotation.UniqueEmail;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class EmailValidator implements ConstraintValidator<UniqueEmail, String> {


    private final UserRepository repository;

    public EmailValidator(UserRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(UniqueEmail constraintAnnotation) {
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        return repository.findByEmail(email.trim())==null;
    }

}
