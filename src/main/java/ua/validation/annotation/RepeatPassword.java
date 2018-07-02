package ua.validation.annotation;

import ua.validation.ChangePasswordValidator;
import ua.validation.PasswordValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(  ElementType.TYPE)
@Constraint(validatedBy = {PasswordValidator.class, ChangePasswordValidator.class})
public @interface RepeatPassword {

    String message() default "Not unique";

    Class<?>[] groups() default {};

    Class<? extends Payload> [] payload() default {};

}
