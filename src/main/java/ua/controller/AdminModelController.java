package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.model.request.ModelRequest;
import ua.service.ModelService;

@Controller
@RequestMapping("/admin/model")
@SessionAttributes("model")
public class AdminModelController {

    private final ModelService modelService;

    public AdminModelController(ModelService modelService) {
        this.modelService = modelService;
    }

    @ModelAttribute("model")
    public ModelRequest getForm() {
        return new ModelRequest();
    }

    @GetMapping
    public String show(Model model) {
        model.addAttribute("models", modelService.findAllModelView());
        model.addAttribute("brands", modelService.findAllBrand());
        return "model";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        modelService.delete(id);
        return "redirect:/admin/model";
    }

    @PostMapping
    public String save(@ModelAttribute("model") ModelRequest request, SessionStatus status) {
        modelService.save(request);
        return cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("model", modelService.findOne(id));
        return show(model);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status) {
        status.setComplete();
        return "redirect:/admin/model";
    }
}
