package ua.validation;

import org.springframework.stereotype.Component;
import ua.repository.DriverRepository;
import ua.validation.annotation.UniquePhone;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class PhoneValidator implements ConstraintValidator<UniquePhone, String> {


    private final DriverRepository repository;

    public PhoneValidator(DriverRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(UniquePhone constraintAnnotation) {
    }

    @Override
    public boolean isValid(String phone, ConstraintValidatorContext context) {
        return  (phone.matches("\\+\\d{12}")&& repository.findByPhone(phone.trim())==null)&&!phone.isEmpty()||phone.isEmpty();
    }
}


