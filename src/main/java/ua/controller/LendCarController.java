package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.InfoAboutRent;
import ua.entity.enums.Chauffeur;
import ua.model.request.CarRequest;
import ua.model.request.LendCarRequest;
import ua.model.view.OrderView;
import ua.service.CarService;
import ua.service.RentService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/lend")
public class LendCarController {

    private RentService service;

    public LendCarController( RentService service) {
        this.service = service;
    }


    @ModelAttribute("car")
    public LendCarRequest getForm() {
        return new LendCarRequest();
    }

    @GetMapping
    public String show(Model model, Principal principal) {
        model.addAttribute("chauffeurs", Chauffeur.values());
        model.addAttribute("cities", service.findAllCities());
        model.addAttribute("finishedOrders", service.findFinishedOrders(principal.getName()));
        OrderView particularOrder = service.findParticularOrder(principal.getName());
        if(particularOrder!=null){
            model.addAttribute("particularOrder", particularOrder);
            model.addAttribute("clients", service.findAllClients(particularOrder.getId()));
            model.addAttribute("reservedOrder", service.findReservedOrder(particularOrder.getId()));
        }
        return "lend";
    }

    @PostMapping
    public String lendCar(@ModelAttribute("car") @Valid LendCarRequest carRequest, BindingResult bindingResult, Principal principal, Model model) {
        if (bindingResult.hasErrors())return show(model, principal);
        service.lendCar(carRequest, principal.getName());
        return "redirect:/lend";
    }

    @GetMapping("/refuse/{driverId}/{infoAboutRentId}")
    public String refuseOrder(@PathVariable Integer driverId, @PathVariable Integer infoAboutRentId) {
        service.refuseOrder(driverId, infoAboutRentId);
        return "redirect:/lend";
    }

    @GetMapping("/confirm/{driverId}/{infoAboutRentId}")
    public String confirmOrder(@PathVariable Integer driverId, @PathVariable Integer infoAboutRentId) {
        service.confirmOrder(driverId, infoAboutRentId);
        return "redirect:/lend";
    }

    @GetMapping("/delete/{infoAboutRentId}")
    public String deleteOrder(@PathVariable Integer infoAboutRentId) {
        service.deleteOrder(infoAboutRentId);
        return "redirect:/lend";
    }

    @GetMapping("/complete/{infoAboutRentId}")
    public String completeOrder(@PathVariable Integer infoAboutRentId){
        service.completeOrder(infoAboutRentId);
        return "redirect:/lend";
    }
}
