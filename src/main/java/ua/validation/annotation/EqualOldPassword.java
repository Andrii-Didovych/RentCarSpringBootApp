package ua.validation.annotation;

import ua.validation.OldPasswordValidator;
import ua.validation.PhoneValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@Constraint(validatedBy = OldPasswordValidator.class)
public @interface EqualOldPassword {

    String message() default "Old password is wrong!";

    Class<?>[] groups() default {};

    Class<? extends Payload> [] payload() default {};

}
