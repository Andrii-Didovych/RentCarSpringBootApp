package ua.service;

import ua.model.view.OrderView;

import java.util.List;

public interface BorrowService {

    void addCarToOrderList(Integer id, String email);

    List<OrderView> findAllFreeCars(Integer id);

    List<OrderView> findSelectedOrders(Integer id);

    List<OrderView> findReservedOrder(Integer id);

    void completeOrder(Integer infoAboutRentId);

    List<OrderView> findFinishedOrdersForBorrow(Integer id);

    void refuseOrder(Integer id, Integer infoAboutOrderId);
}
