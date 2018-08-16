package ua.controller;

import org.jets3t.service.S3ServiceException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.entity.enums.*;
import ua.model.request.*;
import ua.service.CarService;
import ua.service.DriverService;
import ua.service.FileWriter;
import ua.service.UserService;
import ua.service.impl.MyGlobalVariable;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/edit")
public class EditProfileController {

    private final UserService service;

    private final CarService carService;

    private final FileWriter fileWriter;

    private final DriverService driverService;

    public EditProfileController(UserService service, CarService carService, FileWriter fileWriter, DriverService driverService) {
        this.service = service;
        this.carService = carService;
        this.fileWriter = fileWriter;
        this.driverService = driverService;
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

    @ModelAttribute("fileRequestCar")
    public FileRequestCar fileRequestCar() {
        return new FileRequestCar();
    }


    @GetMapping
    public String show(Model model, @ModelAttribute("fileRequest") FileRequest fileRequest,@ModelAttribute("fileRequestCar") FileRequestCar fileRequestCar, Principal principal) {
        Integer id = driverService.findIdOfDriverByEmail(principal.getName());
        model.addAttribute("idOfAuthorizedDriver", id);
        model.addAttribute("missing", MyGlobalVariable.NOT_SELECTED);
        model.addAttribute("infoAboutDriver", driverService.findDriverViewById(id));
        model.addAttribute("infoAboutCar", driverService.findCarViewByDriverId(id));
        model.addAttribute("cities", carService.findAllCities());
        model.addAttribute("brands", carService.findAllBrands());
        model.addAttribute("bodies", Body.values());
        model.addAttribute("engines", Engine.values());
        model.addAttribute("transmissions", Transmission.values());
        model.addAttribute("drives", Drive.values());
        model.addAttribute("doors", Door.values());
        return "edit";
    }

    @PostMapping("/photo-of-driver")
    public String savePhotoOfDriver(@ModelAttribute("fileRequest") @Valid FileRequest fileRequest, BindingResult result, @ModelAttribute("fileRequestCar") FileRequestCar fileRequestCar,Model model, Principal principal) {
        if (result.hasErrors())return show(model, fileRequest, fileRequestCar, principal);
        try {
            if(!fileRequest.getFile().getOriginalFilename().isEmpty())
                fileWriter.writeToAmazonS3(fileRequest.getFile(), principal.getName(), MyGlobalVariable.DRIVERS_BUCKET);
        } catch (S3ServiceException e) {
            e.printStackTrace();
        }
        return "redirect:/edit";
    }

    @PostMapping("/photo-of-car")
    public String savePhotoOfCar(@ModelAttribute("fileRequestCar") @Valid FileRequestCar fileRequestCar, BindingResult result, @ModelAttribute("fileRequest") FileRequest fileRequest,Model model, Principal principal) {
        if (result.hasErrors()) return show(model,fileRequest, fileRequestCar, principal);
        try {
            if(!fileRequestCar.getFile().getOriginalFilename().isEmpty())
            fileWriter.writeToAmazonS3(fileRequestCar.getFile(), principal.getName(), MyGlobalVariable.CARS_BUCKET);
        } catch (S3ServiceException e) {
            e.printStackTrace();
        }
        return "redirect:/edit";
    }

    @PostMapping("/car")
    public String updateCar(@ModelAttribute("car") @Valid CarRequest carRequest, BindingResult bindingResult, Model model, @ModelAttribute("fileRequest") FileRequest fileRequest,@ModelAttribute("fileRequestCar") FileRequestCar fileRequestCar, Principal principal) {
        if (bindingResult.hasErrors())return show( model, fileRequest, fileRequestCar, principal);
        carService.updateCar(carRequest, principal.getName());
        return "redirect:/edit";
    }

    @PostMapping("/info")
    public String changeMainInfo(@ModelAttribute("driver") @Valid MainInfoRequest mainInfoRequest, BindingResult bindingResult,  Model model, @ModelAttribute("fileRequest") FileRequest fileRequest, @ModelAttribute("fileRequestCar") FileRequestCar fileRequestCar,Principal principal) {
        if (bindingResult.hasErrors())return show(model, fileRequest, fileRequestCar,principal);
        service.changeMainInfo(mainInfoRequest, principal.getName());
        return "redirect:/edit";
    }

    @PostMapping
    public String changePassword(@ModelAttribute("user") @Valid PasswordRequest request, BindingResult bindingResult, Model model, @ModelAttribute("fileRequest") FileRequest fileRequest,@ModelAttribute("fileRequestCar") FileRequestCar fileRequestCar, Principal principal) {
        if (bindingResult.hasErrors()) return show(model, fileRequest, fileRequestCar, principal);
        service.changePassword(request, principal.getName());
        return "redirect:/edit";
    }
}
