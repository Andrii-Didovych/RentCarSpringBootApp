package ua.validation;

import org.springframework.stereotype.Component;
import ua.model.request.DriverRegistrationRequest;
import ua.validation.annotation.RepeatPassword;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class PasswordValidator implements ConstraintValidator<RepeatPassword, DriverRegistrationRequest> {

    @Override
    public void initialize(RepeatPassword repeatPassword) {

    }

    @Override
    public boolean isValid(DriverRegistrationRequest request, ConstraintValidatorContext constraintValidatorContext) {
           return request.getPassword().equals(request.getRepeatPassword());
    }
}
