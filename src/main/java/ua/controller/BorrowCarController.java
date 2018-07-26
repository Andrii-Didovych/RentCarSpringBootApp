package ua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.entity.enums.Chauffeur;
import ua.entity.enums.Status;
import ua.model.request.LendCarRequest;
import ua.model.view.OrderView;
import ua.service.BorrowService;
import ua.service.DriverService;
import ua.service.RentService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/borrow")
public class BorrowCarController {

    private BorrowService service;

    private DriverService driverService;

    public BorrowCarController(BorrowService service, DriverService driverService) {
        this.service = service;
        this.driverService = driverService;
    }

    @GetMapping
    public String show(Model model, Principal principal) {
        Integer idOfAuthorizedDriver = driverService.findIdOfDriverByEmail(principal.getName());
        model.addAttribute("idOfAuthorizedDriver", idOfAuthorizedDriver);
        model.addAttribute("freeCars", service.findAllFreeCars(idOfAuthorizedDriver));
        model.addAttribute("selectedOrders", service.findSelectedOrders(idOfAuthorizedDriver));
        List<OrderView> orderViews = service.findReservedOrder(idOfAuthorizedDriver);
        if(!orderViews.isEmpty()){
            OrderView order = orderViews.get(0);
            model.addAttribute("reservedOrder", orderViews);
            String message;
            if(order.getStatus().equals(Status.COMPLETED)){ message = "Wait for complete";}
            else message = "In the way";
            model.addAttribute("message", message);
        }
        model.addAttribute("finishedOrders", service.findFinishedOrdersForBorrow(idOfAuthorizedDriver));
        return "borrow";
    }

    @GetMapping("/choose/{id}")
    public String choose(@PathVariable Integer id, Principal principal){
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
