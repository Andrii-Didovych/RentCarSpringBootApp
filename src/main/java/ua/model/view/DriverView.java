package ua.model.view;

import ua.converter.DateConverterImpl;

import java.time.LocalDate;

public class DriverView {

    private Integer id;

    private String name;

    private String surname;

    private String phone;

    private String photo;

    private Integer age;

    private Integer experience;

    private Integer countOfTrips;

    private String placeOfBirth;

    private LocalDate dateOfBirth;

    private LocalDate experienceBegan;

    public DriverView(Integer id, String name, String surname, String phone, String photo,
                      Integer countOfTrips, String placeOfBirth, LocalDate dateOfBirth,
                      LocalDate experienceBegan) {
        DateConverterImpl converter = new DateConverterImpl();
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.photo = photo;
        this.age = converter.periodOfTimeFromEnteredYear(dateOfBirth);
        this.experience = converter.periodOfTimeFromEnteredYear(experienceBegan);
        this.countOfTrips = countOfTrips;
        this.placeOfBirth = placeOfBirth;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public Integer getCountOfTrips() {
        return countOfTrips;
    }

    public void setCountOfTrips(Integer countOfTrips) {
        this.countOfTrips = countOfTrips;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public LocalDate getExperienceBegan() {
        return experienceBegan;
    }

    public void setExperienceBegan(LocalDate experienceBegan) {
        this.experienceBegan = experienceBegan;
    }
}
