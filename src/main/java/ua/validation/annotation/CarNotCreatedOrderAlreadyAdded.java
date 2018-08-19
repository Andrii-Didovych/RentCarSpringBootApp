package ua.validation.annotation;

import ua.validation.LendCarValidator;
import ua.validation.LendCarValidatorAdd;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Constraint(validatedBy = LendCarValidatorAdd.class)
public @interface CarNotCreatedOrderAlreadyAdded {

    String message() default "Not unique";

    Class<?>[] groups() default {};

    Class<? extends Payload> [] payload() default {};

}
