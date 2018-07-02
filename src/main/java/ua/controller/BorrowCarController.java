package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.enums.Chauffeur;
import ua.model.request.LendCarRequest;
import ua.service.RentService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/borrow")
public class BorrowCarController {

    private RentService service;

    public BorrowCarController(RentService service) {
        this.service = service;
    }


    @GetMapping
    public String show(Model model, Principal principal) {
        model.addAttribute("freeCars", service.findAllFreeCars(principal.getName()));
        model.addAttribute("selectedOrders", service.findSelectedOrders(principal.getName()));
        model.addAttribute("reservedOrder", service.findReservedOrder(principal.getName()));
        model.addAttribute("finishedOrders", service.findFinishedOrdersForBorrow(principal.getName()));
        return "borrow";
    }

    @GetMapping("/choose/{id}")
    public String choose(@PathVariable Integer id, Principal principal, Model model){
        service.addCarToOrderList(id, principal.getName());
        return "redirect:/borrow";
    }

    @GetMapping("/delete/{driverId}/{infoAboutRentId}")
    public String refuseOrder(@PathVariable Integer driverId, @PathVariable Integer infoAboutRentId) {
        service.refuseOrder(driverId, infoAboutRentId);
        return "redirect:/borrow";
    }

    @GetMapping("/complete/{infoAboutRentId}")
    public String completeOrder(@PathVariable Integer infoAboutRentId){
        service.completeOrder(infoAboutRentId);
        return "redirect:/borrow";
    }


}
