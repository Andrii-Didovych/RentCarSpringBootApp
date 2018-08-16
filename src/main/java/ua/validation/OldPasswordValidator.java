package ua.validation;

import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import ua.repository.DriverRepository;
import ua.repository.UserRepository;
import ua.validation.annotation.EqualOldPassword;
import ua.validation.annotation.UniquePhone;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.security.Principal;

@Component
public class OldPasswordValidator implements ConstraintValidator<EqualOldPassword, String> {


    private final UserRepository repository;

    private final PasswordEncoder encoder;

    public OldPasswordValidator(UserRepository repository, PasswordEncoder encoder) {
        this.repository = repository;
        this.encoder = encoder;
    }

    @Override
    public void initialize(EqualOldPassword constraintAnnotation) {
    }

    @Override
    public boolean isValid(String oldPassword, ConstraintValidatorContext context) {
        String currentUserName = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            currentUserName = authentication.getName();
        }
        return  encoder.matches(oldPassword, repository.findPasswordOfAuthorizedUser(currentUserName));
    }
}


