package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.service.UserService;

@Controller

public class LoginController {

    private final UserService service;

    public LoginController(UserService service) {
        this.service = service;
    }

    @GetMapping("/login")
    public String show(Model model) {
        model.addAttribute("numberOfUser", service.numberOfUsers());
        return "login";
    }
}
