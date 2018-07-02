package ua.service;

import org.hibernate.criterion.Order;
import ua.model.request.LendCarRequest;
import ua.model.view.CarView;
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

    void deleteOrder(Integer infoAboutRentId);

//    Borrow
    void addCarToOrderList(Integer id, String email);

    List<OrderView> findAllFreeCars(String email);

    List<OrderView> findSelectedOrders(String name);

    List<OrderView> findReservedOrder(String name);

    void completeOrder(Integer infoAboutRentId);

    List<OrderView> findFinishedOrdersForBorrow(String name);
}
