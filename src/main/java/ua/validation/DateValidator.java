package ua.validation;

import org.springframework.stereotype.Component;
import ua.converter.DateConverter;
import ua.validation.annotation.CorrectDate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

@Component
public class DateValidator implements ConstraintValidator<CorrectDate, String> {

    private final DateConverter converter;

    public DateValidator(DateConverter converter) {
        this.converter = converter;
    }

    @Override
    public void initialize(CorrectDate correctDate) {

    }

    @Override
    public boolean isValid(String date, ConstraintValidatorContext context) {
        if(!date.isEmpty()) {
            LocalDate enteredTime = converter.convertStringToLocalDate(date);
            return enteredTime.compareTo(LocalDate.now()) <= 0;
        }else return true;
    }
}


