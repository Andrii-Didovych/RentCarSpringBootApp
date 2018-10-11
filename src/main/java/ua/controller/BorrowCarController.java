package ua.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.controller.admin.BuildParam;
import ua.entity.enums.*;
import ua.filter.CarFilter;
import ua.filter.SimpleFilter;
import ua.model.view.OrderView;
import ua.service.BorrowService;
import ua.service.DriverService;
import ua.service.impl.MyGlobalVariable;

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

    @ModelAttribute("carFilter")
    public CarFilter getForm() {
        return new CarFilter();
    }

    @GetMapping
    public String show(Model model, Principal principal, @PageableDefault Pageable pageable, @ModelAttribute("carFilter") CarFilter filter) {
        Integer idOfAuthorizedDriver = driverService.findIdOfDriverByEmail(principal.getName());
        model.addAttribute("chauffeurs", Chauffeur.values());
        model.addAttribute("bodies", Body.values());
        model.addAttribute("doors", Door.values());
        model.addAttribute("drives", Drive.values());
        model.addAttribute("engines", Engine.values());
        model.addAttribute("transmissions", Transmission.values());
        model.addAttribute("missing", MyGlobalVariable.NOT_SELECTED);
        model.addAttribute("cities", service.findAllCities());
        model.addAttribute("brands", service.findAllBrands());
        model.addAttribute("idOfAuthorizedDriver", idOfAuthorizedDriver);
        model.addAttribute("freeCars", service.findAllFreeCars(idOfAuthorizedDriver, pageable, filter));
        model.addAttribute("selectedOrders", service.findSelectedOrders(idOfAuthorizedDriver));
        List<OrderView> orderViews = service.findReservedOrder(idOfAuthorizedDriver);
        String message="Wait for confirm";
        if(!orderViews.isEmpty()){
            OrderView order = orderViews.get(0);
            model.addAttribute("reservedOrder", orderViews);
            if(order.getStatus().equals(Status.COMPLETED)){ message = "Wait for complete";}
            else message = "In the way";
        }
        model.addAttribute("messageAboutTrip", message);
        model.addAttribute("finishedOrders", service.findFinishedOrdersForBorrow(idOfAuthorizedDriver));
        return "borrow";
    }

    @GetMapping("/choose/{id}")
    public String choose(Model model, @PathVariable Integer id, Principal principal, @PageableDefault Pageable pageable, @ModelAttribute("filter") CarFilter filter){
        model.addAttribute("myMessage", service.addCarToOrderList(id, principal.getName()));
        return show(model, principal, pageable, filter);
    }

    @GetMapping("/delete/{driverId}/{infoAboutRentId}")
    public String refuseOrder(@PathVariable Integer driverId, @PathVariable Integer infoAboutRentId, @PageableDefault Pageable pageable, @ModelAttribute("carFilter") CarFilter filter) {
        service.refuseOrder(driverId, infoAboutRentId);
        return "redirect:/borrow"+buildParams(pageable, filter);
    }

    @GetMapping("/complete/{infoAboutRentId}")
    public String completeOrder(@PathVariable Integer infoAboutRentId, @PageableDefault Pageable pageable, @ModelAttribute("carFilter") CarFilter filter, Principal principal){
        service.completeOrder(infoAboutRentId, principal.getName());
        return "redirect:/borrow" +buildParams(pageable, filter);
    }

    public String buildParams(Pageable pageable, CarFilter filter) {
        StringBuilder buffer = new StringBuilder();
        buffer.append("?page=");
        buffer.append(String.valueOf(pageable.getPageNumber() + 1));
        buffer.append("&size=");
        buffer.append(String.valueOf(pageable.getPageSize()));
        buffer.append("&search=");
        buffer.append(filter.getBrand());
        buffer.append(filter.getBody());
        buffer.append(filter.getChauffeur());
        buffer.append(filter.getDoor());
        buffer.append(filter.getDrive());
        buffer.append(filter.getEngine());
        buffer.append(filter.getTransmission());
        buffer.append(filter.getMaxPrice());
        buffer.append(filter.getMinPrice());
        buffer.append(filter.getModel());
        buffer.append(filter.getPeriodOfRentFrom());
        buffer.append(filter.getPeriodOfRentTo());
        buffer.append(filter.getRegion());
        return buffer.toString();
    }

}
