package ua.model.view;

import java.time.LocalDate;

public class CommentView {

    private String text;

    private LocalDate date;

    private Integer receiverId;

    private Integer senderId;

    private String name;

    private String surname;

    private String photoOfSender;

    private String photoOfSendersCar;

    public CommentView(String text, LocalDate date, Integer receiverId, Integer senderId, String name, String surname, String photoOfSender) {
        this.text = text;
        this.date = date;
        this.receiverId = receiverId;
        this.senderId = senderId;
        this.name = name;
        this.surname = surname;
        this.photoOfSender = photoOfSender;
    }

    public CommentView(String text, LocalDate date, Integer receiverId, Integer senderId, String name, String surname, String photoOfSender, String photoOfSendersCar) {
        this.text = text;
        this.date = date;
        this.receiverId = receiverId;
        this.senderId = senderId;
        this.name = name;
        this.surname = surname;
        this.photoOfSender = photoOfSender;
        this.photoOfSendersCar = photoOfSendersCar;
    }

    public String getPhotoOfSendersCar() {
        return photoOfSendersCar;
    }

    public void setPhotoOfSendersCar(String photoOfSendersCar) {
        this.photoOfSendersCar = photoOfSendersCar;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
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

    public String getPhotoOfSender() {
        return photoOfSender;
    }

    public void setPhotoOfSender(String photoOfSender) {
        this.photoOfSender = photoOfSender;
    }
}
