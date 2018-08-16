package ua.model.request;

import ua.validation.annotation.EqualOldPassword;
import ua.validation.annotation.RepeatPassword;

import javax.validation.constraints.Size;

@RepeatPassword(message = "Passwords are not the same!")
public class PasswordRequest {

    private Integer id;

    @EqualOldPassword
    private String oldPassword;

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

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
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
