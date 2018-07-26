package ua.validation;

import org.springframework.stereotype.Component;
import ua.repository.DriverRepository;
import ua.validation.annotation.CorrectComment;
import ua.validation.annotation.UniquePhone;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class CommentValidator implements ConstraintValidator<CorrectComment, String> {


    private final DriverRepository repository;

    public CommentValidator(DriverRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(CorrectComment constraintAnnotation) {
    }

    @Override
    public boolean isValid(String comment, ConstraintValidatorContext context) {
        boolean isValid = true;
        String [] commentArray = comment.trim().split(" ");
        for (int i = 0; i <commentArray.length ; i++) {
            if (commentArray[i].length() > 45) isValid = false;
        }
        return isValid;
    }
}


