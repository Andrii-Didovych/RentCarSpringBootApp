package ua.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.City;
import ua.service.BrandService;
import ua.service.CityCervice;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/city")
@SessionAttributes("city")
public class AdminCityController {

    private final CityCervice service;

    @Autowired
    public AdminCityController(CityCervice service) {
        this.service = service;
    }

    @ModelAttribute("city")
    public City getForm() {
        return new City();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("cities", service.findAll());
        return "city";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/admin/city";
    }

    @PostMapping
    public String save(@ModelAttribute("city") @Valid  City city, BindingResult bindingResult, Model model, SessionStatus status) {
       if (bindingResult.hasErrors()) return show(model);
        service.save(city);
        return  cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("city", service.findOne(id));
        return show(model);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/city";
    }
}
