package ua.validation.annotation;

import ua.validation.PhoneValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@Constraint(validatedBy = PhoneValidator.class)
public @interface UniquePhone {

    String message() default "This number has already created!";

    Class<?>[] groups() default {};

    Class<? extends Payload> [] payload() default {};

}
