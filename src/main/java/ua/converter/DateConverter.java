package ua.converter;

import java.time.LocalDate;

public interface DateConverter {

    LocalDate convertStringToLocalDate(String date);

    Integer periodOfTimeFromEnteredYear(LocalDate date);

}
