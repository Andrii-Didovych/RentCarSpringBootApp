package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.enums.*;
import ua.model.request.CarRequest;
import ua.model.request.FileRequest;
import ua.model.request.MainInfoRequest;
import ua.model.request.PasswordRequest;
import ua.service.CarService;
import ua.service.FileWriter;
import ua.service.UserService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/profile/edit")
public class EditProfileController {

    private UserService service;

    private CarService carService;

    private FileWriter fileWriter;

    public EditProfileController(UserService service, CarService carService, FileWriter fileWriter) {
        this.service = service;
        this.carService = carService;
        this.fileWriter = fileWriter;
    }

    @ModelAttribute("user")
    public PasswordRequest getForm() {
        return new PasswordRequest();
    }

    @ModelAttribute("driver")
    public MainInfoRequest getFormInfo() {
        return new MainInfoRequest();
    }

    @ModelAttribute("car")
    public CarRequest getFormCar() {
        return new CarRequest();
    }

    @ModelAttribute("fileRequest")
    public FileRequest getFormFile(){
        return new FileRequest();
    }


    @GetMapping
    public String show(Model model, @ModelAttribute("fileRequest") FileRequest fileRequest) {
        model.addAttribute("cities", carService.findAllCities());
        model.addAttribute("brands", carService.findAllBrands());
        model.addAttribute("bodies", Body.values());
        model.addAttribute("engines", Engine.values());
        model.addAttribute("transmissions", Transmission.values());
        model.addAttribute("drives", Drive.values());
        model.addAttribute("doors", Door.values());
        return "edit";
    }

    @PostMapping("/picture")
    public String saveFile(@ModelAttribute("fileRequest") FileRequest fileRequest, Principal principal) {
        fileWriter.write(fileRequest.getFile(), principal.getName());
        return "redirect:/profile/edit";
    }

    @PostMapping("/car")
    public String updateCar(@ModelAttribute("car") @Valid CarRequest carRequest, BindingResult bindingResult, Principal principal, Model model, @ModelAttribute("fileRequest") FileRequest fileRequest) {
        if (bindingResult.hasErrors())return show( model, fileRequest);
        carService.updateCar(carRequest, principal.getName());
        return "redirect:/profile/edit";
    }

    @PostMapping("/info")
    public String changeMainInfo(@ModelAttribute("driver") @Valid MainInfoRequest mainInfoRequest, BindingResult bindingResult, Principal principal, Model model, @ModelAttribute("fileRequest") FileRequest fileRequest) {
        if (bindingResult.hasErrors())return show(model, fileRequest);
        service.changeMainInfo(mainInfoRequest, principal.getName());
        return "redirect:/profile/edit";
    }

    @PostMapping
    public String changePassword(@ModelAttribute("user") @Valid PasswordRequest request, BindingResult bindingResult, Principal principal, Model model, @ModelAttribute("fileRequest") FileRequest fileRequest) {
       if (bindingResult.hasErrors()) return show(model, fileRequest);
        service.changePassword(request, principal.getName());
        return "redirect:/profile/edit";
    }
}
