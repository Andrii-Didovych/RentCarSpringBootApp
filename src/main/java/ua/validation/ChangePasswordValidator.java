package ua.validation;

import org.springframework.stereotype.Component;
import ua.model.request.PasswordRequest;
import ua.repository.UserRepository;
import ua.service.UserService;
import ua.validation.annotation.RepeatPassword;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ChangePasswordValidator implements ConstraintValidator<RepeatPassword, PasswordRequest> {
    @Override
    public void initialize(RepeatPassword repeatPassword) {

    }

    @Override
    public boolean isValid(PasswordRequest request, ConstraintValidatorContext constraintValidatorContext) {
        return request.getPassword().equals(request.getRepeatPassword());
    }
}
