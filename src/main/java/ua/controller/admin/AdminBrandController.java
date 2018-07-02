package ua.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.Brand;
import ua.service.BrandService;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/brand")
@SessionAttributes("brand")
public class AdminBrandController {

    private final BrandService service;

    @Autowired
    public AdminBrandController(BrandService service) {
        this.service = service;
    }

    @ModelAttribute("brand")
    public Brand getForm(){
        return new Brand();
    }

    @GetMapping
    public String show(Model model){
        model.addAttribute("brands", service.findAll());
        return "brand";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        service.delete(id);
        return "redirect:/admin/brand";
    }

    @PostMapping
    public String save(@ModelAttribute("brand") @Valid Brand brand, BindingResult bindingResult, SessionStatus status, Model model){
        if (bindingResult.hasErrors()) return show(model);
        service.save(brand);
        return cancel(status);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
        model.addAttribute("brand", service.findOne(id));
        return show(model);
    }

    @GetMapping("cancel")
    public String cancel(SessionStatus  status){
        status.setComplete();
        return "redirect:/admin/brand";
    }
}
