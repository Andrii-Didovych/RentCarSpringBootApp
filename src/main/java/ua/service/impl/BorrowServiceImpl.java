package ua.service.impl;

import org.springframework.stereotype.Service;
import ua.converter.DateConverter;
import ua.entity.Driver;
import ua.entity.InfoAboutRent;
import ua.entity.enums.Status;
import ua.model.view.OrderView;
import ua.repository.RentRepository;
import ua.service.BorrowService;
import java.util.List;


@Service
public class BorrowServiceImpl implements BorrowService {

    private final RentRepository repository;

    public BorrowServiceImpl(RentRepository repository, DateConverter converter) {
        this.repository = repository;
    }

    @Override
    public List<OrderView> findAllFreeCars(Integer id) {
        return repository.findAllFreeCars(id, Status.ACTIVE);
    }

    @Override
    public void addCarToOrderList(Integer id, String email) {
        InfoAboutRent rent = repository.findOrderById(id);
        Driver driver = repository.findDriverByUserEmail(email);
        if (!rent.getDrivers().contains(driver))
            rent.getDrivers().add(driver);
        repository.save(rent);
    }

    @Override
    public void refuseOrder(Integer id, Integer infoAboutOrderId) {
        Driver driver = repository.findOneDriver(id);
        InfoAboutRent rent = repository.findParticularOrderById(infoAboutOrderId);
        rent.getDrivers().remove(driver);
        repository.save(rent);
    }

    @Override
    public void completeOrder(Integer infoAboutRentId) {
        InfoAboutRent rent = repository.findParticularOrderById(infoAboutRentId);
        if (rent.getStatus().equals(Status.RESERVED)) {
            rent.setStatus(Status.COMPLETED);
        }
        else rent.setStatus(Status.PASSIVE);
        repository.save(rent);
    }

    @Override
    public List<OrderView> findSelectedOrders(Integer id) {
        return repository.findOrdersByDriverId(id, Status.ACTIVE, Status.ACTIVE);
    }

    @Override
    public List<OrderView> findReservedOrder(Integer id) {
        return repository.findOrdersByDriverId(id, Status.RESERVED, Status.COMPLETED);
    }

    @Override
    public List<OrderView> findFinishedOrdersForBorrow(Integer id) {
        return repository.findOrdersByDriverId(id, Status.PASSIVE, Status.PASSIVE);
    }
}
