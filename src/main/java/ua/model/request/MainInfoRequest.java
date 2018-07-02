package ua.model.request;

import ua.entity.City;
import ua.validation.annotation.*;

@NotSaveIfEnteredNothing(message = "Any of fields was not filled!")
public class MainInfoRequest {

    private Integer id;

    private String email;

    private String name;

    private String surname;

    @UniquePhone
    private String phone;

    @CorrectDateOfBirth(message = "Age should be greater than 18!")
    private String dateOfBirth;

    @CorrectDate(message = "Date is not possible!")
    private String experienceBegan;

    private City placeOfBirth;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
