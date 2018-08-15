package ua.model.request;

import org.hibernate.validator.constraints.NotBlank;
import ua.entity.City;
import ua.validation.annotation.RepeatPassword;
import ua.validation.annotation.UniqueEmail;
import ua.validation.annotation.UniquePhone;

import javax.validation.constraints.Size;
@RepeatPassword(message = "Passwords are not the same!")
public class DriverRegistrationRequest {

    @UniqueEmail(message = "This email has already created!")
    @NotBlank(message = "Field cannot be empty!")
    private String email;

    @Size(min = 2, max = 30, message = "Password should be within 3 and 30!")
    private String password;

    @Size(min = 2, max = 30, message = "Password should be within 3 and 30!")
    private String repeatPassword;

    @NotBlank(message = "Field cannot be empty!")
    private String name;

    @NotBlank(message = "Field cannot be empty!")
    private String surname;

    @NotBlank(message = "Field cannot be empty!")
    @UniquePhone(message = "This phone has already created or has wrong format!")
    private String phone;

    private String dateOfBirth;

    private String experienceBegan;

    private City placeOfBirth;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepeatPassword() {
        return repeatPassword;
    }

    public void setRepeatPassword(String repeatPassword) {
        this.repeatPassword = repeatPassword;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDateOfBirth() {
         return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getExperienceBegan() {
        return experienceBegan;
    }

    public void setExperienceBegan(String experienceBegan) {
        this.experienceBegan = experienceBegan;
    }

    public City getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(City placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }
}
