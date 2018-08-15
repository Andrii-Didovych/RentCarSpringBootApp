package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.model.request.DriverRegistrationRequest;
import ua.service.UserService;

import javax.validation.Valid;

@Controller
@RequestMapping("/registration")
@SessionAttributes("driver")
public class DriverRegistrationController {

    private UserService service;

    public DriverRegistrationController(UserService service) {
        this.service = service;
    }

    @ModelAttribute("driver")
    public DriverRegistrationRequest getForm() {
        return new DriverRegistrationRequest();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("cities", service.findAllCities());
        model.addAttribute("numberOfUser", service.numberOfUsers());
        return "registration";
    }

    @PostMapping
    public String save(@ModelAttribute("driver") @Valid DriverRegistrationRequest request, BindingResult bindingResult, Model model) {
       if (bindingResult.hasErrors()) return show(model);
        service.save(request);
        return "redirect:/login";
    }
}
