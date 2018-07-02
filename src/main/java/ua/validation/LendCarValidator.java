package ua.validation;

import org.springframework.stereotype.Component;
import ua.converter.DateConverter;
import ua.entity.enums.Chauffeur;
import ua.model.request.LendCarRequest;
import ua.repository.RentRepository;
import ua.service.impl.MyGlobalVariable;
import ua.validation.annotation.AllFieldShouldBeFailed;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

@Component
public class LendCarValidator implements ConstraintValidator<AllFieldShouldBeFailed, LendCarRequest> {

    private  final DateConverter converter;

    public LendCarValidator(DateConverter converter) {
        this.converter = converter;
    }

    @Override
    public void initialize(AllFieldShouldBeFailed notSaveIfEnteredNothing) {

    }

    @Override
    public boolean isValid(LendCarRequest request, ConstraintValidatorContext constraintValidatorContext) {
        LocalDate dateNow = LocalDate.now();
        if (request.getChauffeur().equals(Chauffeur.Missing)) return false;
        if (request.getPricePerDay()==null) return false;
        if(request.getRegion().getName().equals(MyGlobalVariable.NOT_SELECTED)) return false;
        if (request.getPeriodOfRentFrom().isEmpty()) return  false;
        if(converter.convertStringToLocalDate(request.getPeriodOfRentFrom()).compareTo(dateNow)<0) return false;
        if(request.getPeriodOfRentTo().isEmpty()) return false;
        if(converter.convertStringToLocalDate(request.getPeriodOfRentTo()).compareTo(converter.convertStringToLocalDate(request.getPeriodOfRentFrom())) <=0) return false;
        else  return true;
    }
}
