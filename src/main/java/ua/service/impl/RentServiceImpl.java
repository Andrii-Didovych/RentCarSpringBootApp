package ua.service.impl;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Service;
import ua.converter.DateConverter;
import ua.entity.Car;
import ua.entity.Driver;
import ua.entity.InfoAboutRent;
import ua.entity.enums.Status;
import ua.model.request.LendCarRequest;
import ua.model.view.DriverView;
import ua.model.view.OrderView;
import ua.repository.RentRepository;
import ua.service.RentService;

import java.util.Iterator;
import java.util.List;


@Service
public class RentServiceImpl implements RentService {

    private final RentRepository repository;

    private final DateConverter converter;

    public RentServiceImpl(RentRepository repository, DateConverter converter) {
        this.repository = repository;
        this.converter = converter;
    }

//--------------------for LendController-------------------------
    @Override
    public void lendCar(LendCarRequest request, String email) {
        Driver driver = repository.findDriverByUserEmail(email);
        Car car = driver.getCar();
        if (car != null && repository.checkIfOrderIsActive(email, Status.ACTIVE) == null) {
            InfoAboutRent aboutRent = new InfoAboutRent();
            aboutRent.setCar(car);
            aboutRent.setChauffeur(request.getChauffeur());
            aboutRent.setPeriodOfRentFrom(converter.convertStringToLocalDate(request.getPeriodOfRentFrom()));
            aboutRent.setPeriodOfRentTo(converter.convertStringToLocalDate(request.getPeriodOfRentTo()));
            aboutRent.setPricePerDay(request.getPricePerDay());
            aboutRent.setRegion(request.getRegion());
            aboutRent.setStatus(Status.ACTIVE);
            repository.save(aboutRent);
        }
    }


//*****************methods of 'show method'*****************
    @Override
    public List<String> findAllCities() {
        return repository.findAllCities();
    }

    @Override
    public List<OrderView> findFinishedOrders(String email) {
        return repository.findFinishedOrders(email, Status.PASSIVE);
    }

    @Override
    public OrderView findParticularOrder(String email) {
        return repository.findParticularOrder(email, Status.ACTIVE, Status.RESERVED, Status.COMPLETED);
    }

    @Override
    public List<DriverView> findAllClients(Integer id) {
        return repository.findAllClients(id, Status.ACTIVE);
    }

    @Override
    public List<DriverView> findReservedOrder(Integer id) {
        return repository.findReservedOrder(id, Status.RESERVED, Status.COMPLETED);
    }
//**************end of methods********************


// Method for refuse one's suggestion, delete from particular order one drivers via id
    @Override
    public void refuseOrder(Integer id, Integer infoAboutOrderId) {
        Driver driver = repository.findOneDriver(id);
        InfoAboutRent rent = repository.findParticularOrderById(infoAboutOrderId);
        rent.getDrivers().remove(driver);
        repository.save(rent);
    }

//    Confirm one order, delete other
    @Override
    public void confirmOrder(Integer driverId, Integer infoAboutRentId) {
        Driver driver = repository.findOneDriver(driverId);
        InfoAboutRent rent = repository.findParticularOrderById(infoAboutRentId);
        Iterator<Driver> iterator = rent.getDrivers().iterator();
        while (iterator.hasNext()) {
            Driver tmp = iterator.next();
            System.out.println(tmp.getName());
            if (tmp.getId() != driver.getId()) {
                iterator.remove();
            }
        }
        rent.setStatus(Status.RESERVED);
        repository.save(rent);
    }

//    delete own suggestion if it has not confirmed yet
    @Override
    public void deleteOrder(Integer infoAboutRentId) {
        InfoAboutRent rent = repository.findParticularOrderById(infoAboutRentId);
        if (rent.getStatus().equals(Status.ACTIVE))
            repository.delete(rent);
    }
//----------------------end methods of LendController-----------------------------------


//*******************For BorrowController******************
    @Override
    public void addCarToOrderList(Integer id, String email) {
        InfoAboutRent rent = repository.findOrderById(id);
        Driver driver = repository.findDriverByUserEmail(email);
        if (!rent.getDrivers().contains(driver))
            rent.getDrivers().add(driver);
        repository.save(rent);
    }

    @Override
    public List<OrderView> findAllFreeCars(String email) {
        return repository.findAllFreeCars(email, Status.ACTIVE);
    }

    @Override
    public List<OrderView> findSelectedOrders(String email) {
        return repository.findOrdersByDriverId(email, Status.ACTIVE, Status.ACTIVE);
    }

    @Override
    public List<OrderView> findReservedOrder(String email) {
        return repository.findOrdersByDriverId(email, Status.RESERVED, Status.COMPLETED);
    }

    @Override
    public List<OrderView> findFinishedOrdersForBorrow(String name) {
        return repository.findOrdersByDriverId(name, Status.PASSIVE, Status.PASSIVE);
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

    //************************end methods of BorrowController**************************
}