package ua.repository.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.support.PageableExecutionUtils;
import ua.converter.DateConverter;
import ua.entity.*;
import ua.entity.enums.*;
import ua.filter.CarFilter;
import ua.model.view.OrderView;
import ua.repository.BorrowRepository;
import ua.service.impl.MyGlobalVariable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.data.jpa.repository.query.QueryUtils.toOrders;

//@Repository
public class BorrowRepositoryImpl2 implements BorrowRepository {

    @PersistenceContext
    private EntityManager em;

    private final DateConverter converter;

    public BorrowRepositoryImpl2(DateConverter converter) {
        this.converter = converter;
    }

    @Override
    public Page<OrderView> findAllFreeCars(Integer id, Pageable pageable, CarFilter filter) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<OrderView> cq = cb.createQuery(OrderView.class);
        Root<InfoAboutRent> root = cq.from(InfoAboutRent.class);
        Join<InfoAboutRent, Car> carJoin = root.join(InfoAboutRent_.car);
        Join<Car, Driver> driverJoin = carJoin.join(Car_.driver);
        Join<Car, Brand> brandJoin = carJoin.join(Car_.brand);
        Join<InfoAboutRent, City> cityJoin = root.join(InfoAboutRent_.region);
        cq.multiselect(root.get(InfoAboutRent_.id), driverJoin.get(Driver_.id), root.get(InfoAboutRent_.pricePerDay),root.get(InfoAboutRent_.periodOfRentFrom),root.get(InfoAboutRent_.periodOfRentTo),cityJoin.get(City_.name), root.get(InfoAboutRent_.chauffeur),root.get(InfoAboutRent_.status), driverJoin.get(Driver_.name), driverJoin.get(Driver_.surname),  brandJoin.get(Brand_.name), carJoin.get(Car_.model), driverJoin.get(Driver_.photoURL), carJoin.get(Car_.photoOfCar));
        PredicateBuilder builder = new PredicateBuilder(filter, root, cb, converter, carJoin);
        Predicate predicate = builder.toPredicate();
        if(predicate!=null) cq.where(predicate);
        cq.orderBy(toOrders(pageable.getSort(), root, cb));
        List<OrderView> content = em.createQuery(cq)
                .setFirstResult(pageable.getPageNumber())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
        CriteriaQuery<Long> cqCount = cb.createQuery(Long.class);
        Root<InfoAboutRent> rootCount = cqCount.from(InfoAboutRent.class);
        cqCount.select(cb.count(rootCount));
        PredicateBuilder countBuilder = new PredicateBuilder(filter, rootCount, cb, converter, carJoin);
        Predicate countPredicate = countBuilder.toPredicate();
        if(countPredicate!=null) cqCount.where(countPredicate);
        return PageableExecutionUtils.getPage(content, pageable, ()->em.createQuery(cqCount).getSingleResult());
    }


private static class PredicateBuilder{
        final CarFilter filter;

        final Root<InfoAboutRent> root;

        final CriteriaBuilder cb;

        final List<Predicate> predicates = new ArrayList<>();

        final  DateConverter converter;

        final Join<InfoAboutRent, Car> carJoin;

    public PredicateBuilder(CarFilter filter, Root<InfoAboutRent> root, CriteriaBuilder cb, DateConverter converter, Join<InfoAboutRent, Car> carJoin) {
        this.filter = filter;
        this.root = root;
        this.cb = cb;
        this.converter = converter;
        this.carJoin = root.join(InfoAboutRent_.car);
    }

    void filterByMinPrice() {
        if (!filter.getMinPrice().isEmpty()) {
            predicates.add(cb.ge(root.get(InfoAboutRent_.pricePerDay), new BigDecimal(filter.getMinPrice())));
        }
    }

    void filterByMaxPrice() {
        if (!filter.getMaxPrice().isEmpty()) {
            predicates.add(cb.le(root.get(InfoAboutRent_.pricePerDay), new BigDecimal(filter.getMaxPrice())));
        }
    }

    void findByCity() {
        List<String>  regionIds = filter.getRegion();
        regionIds.remove(MyGlobalVariable.NOT_SELECTED);
        if (!regionIds.isEmpty()) {
            Join<InfoAboutRent, City> cityJoin = root.join(InfoAboutRent_.region);
            predicates.add(cityJoin.get(City_.name).in(regionIds));
        }
    }

    void findBrands() {
        List<String>  filterBrand = filter.getBrand();
        filterBrand.remove(MyGlobalVariable.NOT_SELECTED);
        if (!filterBrand.isEmpty()) {
            Join<Car, Brand> brandJoin = carJoin.join(Car_.brand);
            predicates.add(brandJoin.get(Brand_.name).in(filterBrand));
        }
    }

    void filterByModel() {
        if(!filter.getModel().isEmpty()) {
            predicates.add(cb.like(carJoin.get(Car_.model), new String(filter.getModel())+"%"));
        }
    }

    void findPeriodFrom(){
        if (!filter.getPeriodOfRentFrom().isEmpty()) {
            LocalDate date = converter.convertStringToLocalDate(filter.getPeriodOfRentFrom());
            predicates.add(cb.greaterThanOrEqualTo(root.get(InfoAboutRent_.periodOfRentFrom), date));
        }
    }

    void findPeriodTo(){
        if (!filter.getPeriodOfRentTo().isEmpty()) {
            LocalDate date = converter.convertStringToLocalDate(filter.getPeriodOfRentTo());
            predicates.add(cb.lessThanOrEqualTo(root.get(InfoAboutRent_.periodOfRentTo), date));
        }
    }

    void findChauffeurs() {
        if (filter.getChauffeur()!=null && filter.getChauffeur()!=Chauffeur.Missing) {
            predicates.add(root.get(InfoAboutRent_.chauffeur).in(filter.getChauffeur()));
        }
    }
    void findBodies() {
        if (filter.getBody()!=null && filter.getBody()!= Body.Missing) {
            predicates.add(carJoin.get(Car_.body).in(filter.getBody()));
        }
    }

    void findDoors() {
        if (filter.getDoor()!=null && filter.getDoor()!= Door.Missing) {
            predicates.add(carJoin.get(Car_.numberOfDoors).in(filter.getDoor()));
        }
    }

    void findDrives() {
        if (filter.getDrive()!=null && filter.getDrive()!= Drive.Missing) {
            predicates.add(carJoin.get(Car_.drive).in(filter.getDrive()));
        }
    }

    void findEngines() {
        if (filter.getEngine()!=null && filter.getEngine()!= Engine.Missing) {
            predicates.add(carJoin.get(Car_.engine).in(filter.getEngine()));
        }
    }

    void findTransmissions() {
        if (filter.getTransmission()!=null && filter.getTransmission()!= Transmission.Missing) {
            predicates.add(carJoin.get(Car_.transmission).in(filter.getTransmission()));
        }
    }

    Predicate toPredicate() {
        filterByMinPrice();
        filterByMaxPrice();
        findByCity();
        findBrands();
        filterByModel();
        findPeriodFrom();
        findPeriodTo();
        findChauffeurs();
        findBodies();
        findDoors();
        findEngines();
        findDrives();
        findTransmissions();
        return predicates.isEmpty()?null:cb.and(predicates.stream().toArray(Predicate[]::new));
    }
}
}

