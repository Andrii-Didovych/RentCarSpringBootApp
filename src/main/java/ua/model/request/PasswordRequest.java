package ua.model.request;

import ua.validation.annotation.RepeatPassword;

import javax.validation.constraints.Size;

@RepeatPassword(message = "Passwords are not the same!")
public class PasswordRequest {

    private Integer id;

    @Size(min = 2, max = 30, message = "Size of password should be within 3 and 30!")
    private String password;

    @Size(min = 2, max = 30, message = "Size of password should be within 3 and 30!")
    private String repeatPassword;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
