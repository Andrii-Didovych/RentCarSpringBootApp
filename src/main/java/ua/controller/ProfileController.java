package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.Car;
import ua.entity.Comment;
import ua.model.view.CarView;
import ua.service.DriverService;
import ua.service.impl.MyGlobalVariable;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final DriverService service;

    public ProfileController(DriverService service) {
        this.service = service;
    }


    @ModelAttribute("comment")
    public Comment getForm() {
        return new Comment();
    }
    @GetMapping("/{id}")
    public String show(@PathVariable Integer id, Model model, Principal principal) {
        model.addAttribute("idOfAuthorizedDriver", service.findIdOfDriverByEmail(principal.getName()));
        model.addAttribute("driver", service.findDriverViewById(id));
        CarView car = service.findCarViewByDriverId(id);
        if (car==null) {
            model.addAttribute("photoOfCar", MyGlobalVariable.DEFAULT_PHOTO_OF_CAR);
            model.addAttribute("ifCarMissed", "Car had not been created yet");
        }
        else model.addAttribute("photoOfCar", car.getPhotoOfCar());
        model.addAttribute("driversCar", car);
        model.addAttribute("photoOfCarForComment", MyGlobalVariable.DEFAULT_PHOTO_OF_CAR);
        model.addAttribute("comments", service.findCommentsOfDriver(id));
        return "profile";
    }

    @PostMapping("/{receiverId}/{senderId}")
    public String postComment(Model model, Principal principal, @PathVariable Integer receiverId, @PathVariable Integer senderId, @ModelAttribute("comment") @Valid Comment comment, BindingResult bindingResult){
        if (bindingResult.hasErrors())return show(receiverId, model, principal);
        service.postComment(receiverId, senderId, comment.getText());
        return "redirect:/profile/{receiverId}";
    }
}
