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
    public String show(Model model, @RequestParam(required = true, defaultValue = "111@1") String email) {
        model.addAttribute("cities", service.findAllCities());
        model.addAttribute("numberOfUser", service.numberOfUsers());
        return "registration";
    }


    @PostMapping
    public String save(@RequestParam String email,@ModelAttribute("driver") @Valid DriverRegistrationRequest request, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) return show(model, email);
          if (!service.addUser(request)) {
            model.addAttribute("message", "User exists!");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = service.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated! Please login again. ");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }

}
