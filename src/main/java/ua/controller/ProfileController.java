package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.service.DriverService;

import java.security.Principal;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final DriverService service;

    public ProfileController(DriverService service) {
        this.service = service;
    }

    @GetMapping
    public String show(Model model, Principal principal) {
        model.addAttribute("driver", service.findAuthorizedDriverView(principal.getName()));
        model.addAttribute("driversCar", service.findDriversCar(principal.getName()));
        return "profile";
    }

}
