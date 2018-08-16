package ua.validation;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import ua.repository.DriverRepository;
import ua.validation.annotation.CorrectFileSize;
import ua.validation.annotation.UniquePhone;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.io.File;

@Component
public class FileValidator implements ConstraintValidator<CorrectFileSize, MultipartFile> {


    @Override
    public void initialize(CorrectFileSize correctFileSize) {
    }

    @Override
    public boolean isValid(MultipartFile file, ConstraintValidatorContext constraintValidatorContext) {
        return file.getSize()<1048576;
    }
}


