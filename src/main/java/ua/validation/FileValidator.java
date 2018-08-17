package ua.validation;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import ua.entity.Car;
import ua.repository.CarRepository;
import ua.repository.DriverRepository;
import ua.validation.annotation.CorrectFileSize;
import ua.validation.annotation.UniquePhone;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.io.File;

@Component
public class FileValidator implements ConstraintValidator<CorrectFileSize, MultipartFile> {

    private final CarRepository repository;

    public FileValidator(CarRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(CorrectFileSize correctFileSize) {
    }

    @Override
    public boolean isValid(MultipartFile file, ConstraintValidatorContext constraintValidatorContext) {
        String currentUserName = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            currentUserName = authentication.getName();
        }
        Car car = repository.findCarByUserEmail(currentUserName).getCar();
        return car!=null&&file.getSize()<1048576;
    }
}


