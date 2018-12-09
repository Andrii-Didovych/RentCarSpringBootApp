package ua.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "driver")
public class Driver extends AbstractEntityName {

    private String surname;

    private String phone;

    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    @Transient
    private Integer age;

    @Column(name = "experience_began")
    private LocalDate experienceBegan;

    @Transient
    private Integer experience;

    @Column(name = "photo")
    private String photoURL;

    @Column(name = "count_of_trips")
    private Integer countOfTrips;

    @ManyToOne(fetch = FetchType.LAZY)
    private City placeOfBirth;

    @OneToOne(mappedBy = "driver", cascade = CascadeType.ALL)
    private Car car;

    @OneToMany(mappedBy = "receiver")
    private List<Comment> receivedComments = new ArrayList<>();

    @OneToMany(mappedBy = "sender")
    private List<Comment> sendedComments = new ArrayList<>();

    @OneToOne
    private User user;

    @ManyToMany
    @JoinTable(name = "driver_car", joinColumns = @JoinColumn(name = "driver_id"),
            inverseJoinColumns = @JoinColumn(name = "info_about_rent_id"))
    private List<InfoAboutRent> listOfInfoAboutCar = new ArrayList<>();

    public Driver() {
    }

    public List<Comment> getReceivedComments() {
        return receivedComments;
    }

    public void setReceivedComments(List<Comment> receivedComments) {
        this.receivedComments = receivedComments;
    }

    public List<Comment> getSendedComments() {
        return sendedComments;
    }

    public void setSendedComments(List<Comment> sendedComments) {
        this.sendedComments = sendedComments;
    }

    public List<InfoAboutRent> getListOfInfoAboutCar() {
        return listOfInfoAboutCar;
    }

    public void setListOfInfoAboutCar(List<InfoAboutRent> listOfInfoAboutCar) {
        this.listOfInfoAboutCar = listOfInfoAboutCar;
    }

    public Driver(String name) {
        super(name);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public LocalDate getExperienceBegan() {
        return experienceBegan;
    }

    public void setExperienceBegan(LocalDate experienceBegan) {
        this.experienceBegan = experienceBegan;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public String getPhotoURL() {
        return photoURL;
    }

    public void setPhotoURL(String photoURL) {
        this.photoURL = photoURL;
    }

    public Integer getCountOfTrips() {
        return countOfTrips;
    }

    public void setCountOfTrips(Integer countOfTrips) {
        this.countOfTrips = countOfTrips;
    }

    public City getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(City placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }
}
