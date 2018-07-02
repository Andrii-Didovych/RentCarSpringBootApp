package ua.validation;

import org.springframework.stereotype.Component;
import ua.model.request.CarRequest;
import ua.service.impl.MyGlobalVariable;
import ua.validation.annotation.NotSaveIfEnteredNothing;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class UpdateCarValidator implements ConstraintValidator<NotSaveIfEnteredNothing, CarRequest> {


    @Override
    public void initialize(NotSaveIfEnteredNothing notSaveIfEnteredNothing) {

    }

    @Override
    public boolean isValid(CarRequest request, ConstraintValidatorContext constraintValidatorContext) {
        String noSelected = MyGlobalVariable.NOT_SELECTED;
        return!(  request.getYearOfManufacture().isEmpty()
                &&request.getBrand().getName().equals(noSelected)
                &&request.getModel().isEmpty()
                &&request.getBody().name().equals(noSelected)
                &&request.getDrive().name().equals(noSelected)
                &&request.getEngine().name().equals(noSelected)
                &&request.getTransmission().name().equals(noSelected)
                &&request.getNumberOfDoors().name().equals(noSelected));
    }
}
