package ua.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.Engine;
import ua.service.BodyService;
import ua.service.EngineService;

@Controller
@RequestMapping("/admin/engine")
@SessionAttributes("engine")
public class AdminEngineController {
    private final EngineService service;

    @Autowired
    public AdminEngineController(EngineService service) {
        this.service = service;
    }

    @ModelAttribute("engine")
    public Engine getForm() {
        return new Engine();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("engines", service.findAll());
        return "engine";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/admin/engine";
    }

    @PostMapping
    public String save(@ModelAttribute("engine") Engine engine, SessionStatus status) {
        service.save(engine);
        return cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("engine", service.findOne(id));
        return show(model);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/engine";
    }
}
