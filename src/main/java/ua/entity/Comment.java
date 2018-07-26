package ua.entity;

import org.hibernate.validator.constraints.NotEmpty;
import ua.validation.annotation.CorrectComment;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Entity
@Table(name = "comment")
public class Comment extends AbstractEntity {

    @CorrectComment(message = "You typed too long word!")
    @Size(max = 200, message = "Comment should not contain more than 200 character!")
    @NotEmpty(message = "field cannot be empty!")
    private String text;

    private LocalDate date;

    @ManyToOne(fetch = FetchType.LAZY)
    private Driver receiver;

    @ManyToOne(fetch = FetchType.LAZY)
    private Driver sender;

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

    public Driver getReceiver() {
        return receiver;
    }

    public void setReceiver(Driver receiver) {
        this.receiver = receiver;
    }

    public Driver getSender() {
        return sender;
    }

    public void setSender(Driver sender) {
        this.sender = sender;
    }
}
