package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.Comment;
import ua.service.DriverService;

import javax.validation.Valid;
import java.security.Principal;

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
        model.addAttribute("driversCar", service.findCarViewByDriverId(id));
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
