package ua.validation;

import org.springframework.stereotype.Component;
import ua.entity.City;
import ua.model.request.MainInfoRequest;
import ua.repository.CityRepository;
import ua.service.impl.MyGlobalVariable;
import ua.validation.annotation.NotSaveIfEnteredNothing;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class ChangeMainInfoValidator implements ConstraintValidator<NotSaveIfEnteredNothing, MainInfoRequest> {

    private CityRepository  repository;

    public ChangeMainInfoValidator(CityRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(NotSaveIfEnteredNothing notSaveIfEnteredNothing) {

    }

    @Override
    public boolean isValid(MainInfoRequest request, ConstraintValidatorContext constraintValidatorContext) {
        return !(request.getPlaceOfBirth().getName().equals(MyGlobalVariable.NOT_SELECTED)&&
                request.getName().isEmpty()&&
                request.getSurname().isEmpty()&&
                request.getPhone().isEmpty()&&
                request.getDateOfBirth().isEmpty()&&
                request.getExperienceBegan().isEmpty());
    }
}
