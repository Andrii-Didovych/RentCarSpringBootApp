package ua.converter;

import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class DateConverterImpl implements DateConverter {

    public LocalDate convertStringToLocalDate(String date){
        String arr[] =  date.split("-");
        int year = Integer.valueOf(arr[0]);
        int month = Integer.valueOf(arr[1]);
        int day = Integer.valueOf(arr[2]);
        return LocalDate.of(year, month,day);
    }

    public Integer periodOfTimeFromEnteredYear(LocalDate date) {
        LocalDate dateNow = LocalDate.now();
        int difference = dateNow.getYear()- date.getYear();
        if(difference>0&&!date.equals(LocalDate.of(1111,11,11))){
            if ((dateNow.getDayOfYear() - date.getDayOfYear())  < -1) {
                return difference - 1;
            } else {
                return difference;
            }
        }else return 0;
    }
}
