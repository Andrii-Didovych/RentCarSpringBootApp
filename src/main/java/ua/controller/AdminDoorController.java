package ua.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.Door;
import ua.service.DoorService;

@Controller
@RequestMapping("/admin/door")
@SessionAttributes("door")
public class AdminDoorController {

    private final DoorService service;

    @Autowired
    public AdminDoorController(DoorService service) {
        this.service = service;
    }

    @ModelAttribute("door")
    public Door getForm() {
        return new Door();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("doors", service.findAll());
        return "door";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/admin/door";
    }

    @PostMapping
    public String save(@ModelAttribute("door") Door door, SessionStatus status) {
        service.save(door);
        return cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("door", service.findOne(id));
        return show(model);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/door";
    }
}
