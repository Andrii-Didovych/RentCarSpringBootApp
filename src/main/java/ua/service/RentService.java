package ua.service;

import ua.model.request.LendCarRequest;
import ua.model.view.DriverView;
import ua.model.view.OrderView;

import java.util.List;

public interface RentService {

//    Lend
    void lendCar(LendCarRequest carRequest, String name);

    List<String> findAllCities();

    List<OrderView> findFinishedOrders(String email);

    OrderView findParticularOrder(String email);

    List<DriverView> findAllClients(Integer id);

    List<DriverView> findReservedOrder(Integer id);

    void refuseOrder(Integer id, Integer infoAboutOrderId);

    void confirmOrder(Integer driverId, Integer infoAboutRentId);

    String deleteOrder(Integer infoAboutRentId);

    void completeOrder(Integer infoAboutRentId);
}
