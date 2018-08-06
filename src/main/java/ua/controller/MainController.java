package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.service.DriverService;

import java.security.Principal;

@Controller
public class MainController {

    private final DriverService driverService;

    public MainController(DriverService driverService) {
        this.driverService = driverService;
    }

    @GetMapping("/")
    public String index(Model model, Principal principal){
        if (principal!=null)
        model.addAttribute("idOfAuthorizedDriver", driverService.findIdOfDriverByEmail(principal.getName()));
        return "index";
    }
}
