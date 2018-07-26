package ua.controller.admin;

import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import ua.entity.City;
import ua.filter.SimpleFilter;
import ua.service.CityCervice;
import ua.service.DriverService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/admin/city")
@SessionAttributes("city")
public class AdminCityController {

    private final CityCervice service;

    private final DriverService driverService;

    private BuildParam param = new BuildParam();

    public AdminCityController(CityCervice service, DriverService driverService) {
        this.service = service;
        this.driverService = driverService;
    }

    @ModelAttribute("city")
    public City getForm() {
        return new City();
    }

    @ModelAttribute("filter")
    public SimpleFilter getFilter(){
        return new SimpleFilter();
    }

    @GetMapping
    public String show(Model model, @PageableDefault Pageable pageable, @ModelAttribute("filter") SimpleFilter filter, Principal principal) {
        model.addAttribute("idOfAuthorizedDriver", driverService.findIdOfDriverByEmail(principal.getName()));
        model.addAttribute("cities", service.findAll(pageable, filter));
        return "city";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id, @PageableDefault Pageable pageable, @ModelAttribute("filter") SimpleFilter filter) {
        service.delete(id);
        return "redirect:/admin/city"+ param.buildParams(pageable, filter);
    }

    @PostMapping
    public String save(@ModelAttribute("city") @Valid  City city, BindingResult bindingResult, Model model, SessionStatus status, @PageableDefault Pageable pageable, @ModelAttribute("filter") SimpleFilter filter, Principal principal) {
       if (bindingResult.hasErrors()) return show(model, pageable, filter, principal);
        service.save(city);
        return  cancel(status, pageable, filter);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model, @PageableDefault Pageable pageable, @ModelAttribute("filter") SimpleFilter filter, Principal principal) {
        model.addAttribute("city", service.findOne(id));
        return show(model, pageable, filter, principal);
    }

    @GetMapping("/cancel")
    public String cancel(SessionStatus status, @PageableDefault Pageable pageable, @ModelAttribute("filter") SimpleFilter filter) {
        status.setComplete();
        return "redirect:/admin/city"+param.buildParams(pageable, filter);
    }


}
