package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.service.DriverService;
import ua.service.RentService;

import java.security.Principal;

@Controller
@RequestMapping("/driver")
public class PageOfDriverController {

    private final DriverService service;

    public PageOfDriverController(DriverService service) {
        this.service = service;
    }

    @GetMapping("/{id}")
    public String show(@PathVariable Integer id, Model model) {
        model.addAttribute("driverInfo", service.pageOfDriver(id));
        return "info-about-driver";
    }
}
