package ua.validation;

import org.springframework.stereotype.Component;
import ua.converter.DateConverter;
import ua.validation.annotation.CorrectDateOfBirth;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

@Component
public class DateOfBirthValidator implements ConstraintValidator<CorrectDateOfBirth, String> {

    private final DateConverter converter;

    public DateOfBirthValidator(DateConverter converter) {
        this.converter = converter;
    }

    @Override
    public void initialize(CorrectDateOfBirth correctDateOfBirth) {

    }

    @Override
    public boolean isValid(String date, ConstraintValidatorContext context) {
        if(!date.isEmpty()){
        LocalDate enteredTime = converter.convertStringToLocalDate(date);
        return  (converter.periodOfTimeFromEnteredYear(enteredTime))>=18;}
        else return true;
    }


}


