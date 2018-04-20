package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.model.request.ModelRequest;
import ua.service.DriverService;
import ua.service.ModelService;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final DriverService service;

    public ProfileController(DriverService service) {
        this.service = service;
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("driver", service.findAuthorizedUser());
        model.addAttribute("cities", service.findAllCities());
        return "profile";
    }

}
