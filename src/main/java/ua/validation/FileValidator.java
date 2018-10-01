package ua.validation;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import ua.repository.CarRepository;
import ua.validation.annotation.CorrectFileSize;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

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
        return file.getSize()<1048576;
    }
}


