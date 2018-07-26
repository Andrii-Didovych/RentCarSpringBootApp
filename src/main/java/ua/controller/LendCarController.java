package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.InfoAboutRent;
import ua.entity.enums.Chauffeur;
import ua.entity.enums.Status;
import ua.model.request.CarRequest;
import ua.model.request.LendCarRequest;
import ua.model.view.OrderView;
import ua.service.BorrowService;
import ua.service.CarService;
import ua.service.DriverService;
import ua.service.RentService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/lend")
public class LendCarController {

    private RentService service;

    private DriverService driverService;

    public LendCarController(RentService service, DriverService driverService) {
        this.service = service;
        this.driverService = driverService;
    }

    @ModelAttribute("car")
    public LendCarRequest getForm() {
        return new LendCarRequest();
    }

    @GetMapping
    public String show(Model model, Principal principal) {
        model.addAttribute("idOfAuthorizedDriver", driverService.findIdOfDriverByEmail(principal.getName()));
        model.addAttribute("chauffeurs", Chauffeur.values());
        model.addAttribute("cities", service.findAllCities());
        model.addAttribute("finishedOrders", service.findFinishedOrders(principal.getName()));
        OrderView particularOrder = service.findParticularOrder(principal.getName());
        if(particularOrder!=null){
            model.addAttribute("particularOrder", particularOrder);
            model.addAttribute("clients", service.findAllClients(particularOrder.getId()));
            model.addAttribute("reservedOrder", service.findReservedOrder(particularOrder.getId()));
            String message;
            if(particularOrder.getStatus().equals(Status.COMPLETED)){ message = "Waiting for complete of client";}
            else message = "Trip is continuing";
            model.addAttribute("message", message);
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
