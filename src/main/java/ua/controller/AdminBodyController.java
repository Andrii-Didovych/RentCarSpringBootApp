package ua.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.Body;
import ua.service.BodyService;

@Controller
@RequestMapping("/admin/body")
@SessionAttributes("body")
public class AdminBodyController {
    private final BodyService service;

    @Autowired
    public AdminBodyController(BodyService service) {
        this.service = service;
    }

    @ModelAttribute("body")
    public Body getForm(){
        return new Body();
    }

    @GetMapping
    public String show(Model model){
        model.addAttribute("bodies", service.findAll());
        return "body";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        service.delete(id);
        return "redirect:/admin/body";
    }

    @PostMapping
    public String save(@ModelAttribute("body") Body body, SessionStatus status){
        service.save(body);
        return cencel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("body", service.findOne(id));
       return show(model);
    }

    @GetMapping("/cancel")
    public String cencel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/body";
    }
}
