package ua.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.Transmission;
import ua.service.TransmissionServise;

@Controller
@RequestMapping("/admin/transmission")
@SessionAttributes("transmission")
public class AdminTransmissionController {
    private final TransmissionServise service;

    @Autowired
    public AdminTransmissionController(TransmissionServise service) {
        this.service = service;
    }

    @ModelAttribute("transmission")
    public Transmission getForm() {
        return new Transmission();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("transmissions", service.findAll());
        return "transmission";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/admin/transmission";
    }

    @PostMapping
    public String save(@ModelAttribute("transmission") Transmission transmission, SessionStatus status) {
        service.save(transmission);
        return cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("transmission", service.findOne(id));
        return show(model);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/transmission";
    }
}
