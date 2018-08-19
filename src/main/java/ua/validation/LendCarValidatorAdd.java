package ua.validation;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import ua.converter.DateConverter;
import ua.entity.enums.Chauffeur;
import ua.entity.enums.Status;
import ua.model.request.LendCarRequest;
import ua.repository.DriverRepository;
import ua.repository.RentRepository;
import ua.repository.UserRepository;
import ua.service.impl.MyGlobalVariable;
import ua.validation.annotation.AllFieldShouldBeFailed;
import ua.validation.annotation.CarNotCreatedOrderAlreadyAdded;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.constraints.Null;
import java.security.Principal;
import java.time.LocalDate;

@Component
public class LendCarValidatorAdd implements ConstraintValidator<CarNotCreatedOrderAlreadyAdded, LendCarRequest> {

    private final RentRepository repository;

    public LendCarValidatorAdd(RentRepository repository) {
        this.repository = repository;
    }

    @Override
    public void initialize(CarNotCreatedOrderAlreadyAdded notSaveIfEnteredNothing) {

    }

    @Override
    public boolean isValid(LendCarRequest request, ConstraintValidatorContext constraintValidatorContext) {
        String currentUserName = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            currentUserName = authentication.getName();
        }
        boolean isActive = repository.checkIfOrderIsActive(currentUserName, Status.ACTIVE) == null;
        boolean hasCar = repository.findDriverByUserEmail(currentUserName).getCar()!=null;
        return isActive&&hasCar;
    }
}
