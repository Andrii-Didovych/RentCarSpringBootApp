package ua.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.Drive;
import ua.service.DoorService;
import ua.service.DriveService;

@Controller
@RequestMapping("/admin/drive")
@SessionAttributes("drive")
public class AdminDriveController {

    private final DriveService service;

    @Autowired
    public AdminDriveController(DriveService service) {
        this.service = service;
    }

    @ModelAttribute("drive")
    public Drive getForm() {
        return new Drive();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("drives", service.findAll());
        return "drive";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/admin/drive";
    }

    @PostMapping
    public String save(@ModelAttribute("drive") Drive drive, SessionStatus status) {
        service.save(drive);
        return cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("drive", service.findOne(id));
        return show(model);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/drive";
    }
}
