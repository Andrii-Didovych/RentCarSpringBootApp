package ua.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import ua.filter.CarFilter;
import ua.model.view.OrderView;

import java.util.List;

public interface BorrowService {

    void addCarToOrderList(Integer id, String email);

    Page<OrderView> findAllFreeCars(Integer id, Pageable pageable, CarFilter filter);

    List<OrderView> findSelectedOrders(Integer id);

    List<OrderView> findReservedOrder(Integer id);

    void completeOrder(Integer infoAboutRentId);

    List<OrderView> findFinishedOrdersForBorrow(Integer id);

    void refuseOrder(Integer id, Integer infoAboutOrderId);

    List<String> findAllCities();

    List<String> findAllBrands();
}
