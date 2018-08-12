package ua.repository.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.support.PageableExecutionUtils;
import org.springframework.stereotype.Repository;
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
@Repository
public class BorrowRepositoryImpl implements BorrowRepository {

    @PersistenceContext
    private EntityManager em;

    private final DateConverter converter;

    public BorrowRepositoryImpl(DateConverter converter) {
        this.converter = converter;
    }

    @Override
    public Page<OrderView> findAllFreeCars(Integer id, Pageable pageable, CarFilter filter) {
        QueryCreator creator = new QueryCreator(filter, pageable.getSort(), em, converter, id);
        CriteriaQuery<OrderView> query = creator.getQuery(getIdsOfOrders(id));
        System.out.println(pageable.getPageNumber());
        System.out.println(pageable.getPageSize());
        List<OrderView> content = em.createQuery(query).setFirstResult(pageable.getPageNumber())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
        QueryCreator countCreator = new QueryCreator(filter, pageable.getSort(), em,converter, id);
        getIdsOfOrders(id);
        return PageableExecutionUtils.getPage(content, pageable, ()->em.createQuery(countCreator.getCountQuery(getIdsOfOrders(id))).getSingleResult());
    }

    private Driver getActiveDriver(Integer id){
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Driver> cq = cb.createQuery(Driver.class);
        Root<Driver> root = cq.from(Driver.class);
        return em.createQuery(cq.where(cb.equal(root.get(Driver_.id), id))).getSingleResult();
    }
    private List<Integer> getIdsOfOrders(Integer id){
        List<Integer> integers = new ArrayList<>();
        for (InfoAboutRent rent: getActiveDriver(id).getListOfInfoAboutCar()) {
            integers.add(rent.getId());
        }
        return integers;
    }


    private static class QueryCreator{

        private final CarFilter filter;

        private final Sort sort;

        private final CriteriaBuilder cb;

        private Root<InfoAboutRent> root;

        Join<InfoAboutRent, Car> carJoin;

        Join<Car, Driver> driverJoin;

        Join<Car, Brand> brandJoin;

        Join<InfoAboutRent, City> cityJoin;

        private final List<Specification<InfoAboutRent>> specifications = new ArrayList<>();

        private final DateConverter converter;

        private final Integer id;

        public QueryCreator(CarFilter filter, Sort sort, EntityManager em, DateConverter converter, Integer id) {
            this.filter = filter;
            this.sort = sort;
            cb = em.getCriteriaBuilder();
            this.converter = converter;
            this.id = id;
        }

        public CriteriaQuery<OrderView> getQuery(List<Integer> integers) {
            CriteriaQuery<OrderView> query = cb.createQuery(OrderView.class);
            createRoot(query);
            select(query);
            filter(integers);
            query.where(buildPredicates(query));
            return query;
        }

        public void where(List<Integer> integers){
            specifications.add((root, query, cb)->cb.and(
                    cb.equal(root.get(InfoAboutRent_.status), Status.ACTIVE),
                    cb.notEqual(driverJoin.get(Driver_.id),id),
                    cb.not(root.get(InfoAboutRent_.id).in(integers))
            ));
        }

        public CriteriaQuery<Long> getCountQuery(List<Integer> integers) {
            CriteriaQuery<Long> query = cb.createQuery(Long.class);
            createRoot(query);
            selectCount(query);
            filter(integers);
            query.where(buildPredicates(query));
            return query;
        }



        public void createRoot(CriteriaQuery<?> query) {
            root = query.from(InfoAboutRent.class);
            carJoin = root.join(InfoAboutRent_.car);
            driverJoin = carJoin.join(Car_.driver);
            brandJoin = carJoin.join(Car_.brand);
            cityJoin = root.join(InfoAboutRent_.region);
        }

        private void select(CriteriaQuery<OrderView> query) {
            query.multiselect(root.get(InfoAboutRent_.id),
                    driverJoin.get(Driver_.id),
                    root.get(InfoAboutRent_.pricePerDay),
                    root.get(InfoAboutRent_.periodOfRentFrom),
                    root.get(InfoAboutRent_.periodOfRentTo),
                    cityJoin.get(City_.name),
                    root.get(InfoAboutRent_.chauffeur),
                    root.get(InfoAboutRent_.status),
                    driverJoin.get(Driver_.name),
                    driverJoin.get(Driver_.surname),
                    brandJoin.get(Brand_.name),
                    carJoin.get(Car_.model),
                    driverJoin.get(Driver_.photoURL),
                    carJoin.get(Car_.photoOfCar));
        }

        private void selectCount(CriteriaQuery<Long> query) {
            query.select(cb.count(root));
        }

        private Predicate[] buildPredicates(CriteriaQuery<?> query) {
            return specifications.stream().map(spec->spec.toPredicate(root, query, cb)).toArray(Predicate[]::new);
        }
        private void filter(List<Integer> integers) {
            filterByMinMaxPrice();
            findBodies();
            findBrands();
            findByCity();
            findChauffeurs();
            findDoors();
            findDrives();
            findEngines();
            findPeriodFrom();
            findPeriodTo();
            findTransmissions();
            filterByModel();
            where(integers);
        }

        private void filterByMinMaxPrice() {
            if (!filter.getMinPrice().isEmpty()) {
                specifications.add((root, query, cb) -> cb.ge(root.get(InfoAboutRent_.pricePerDay), new BigDecimal(filter.getMinPrice())));
            }
            if (!filter.getMinPrice().isEmpty()) {
                specifications.add((root, query, cb) -> cb.le(root.get(InfoAboutRent_.pricePerDay), new BigDecimal(filter.getMaxPrice())));
            }
        }
        void findByCity() {
            List<String>  regionIds = filter.getRegion();
            regionIds.remove(MyGlobalVariable.NOT_SELECTED);
            if (!regionIds.isEmpty()) {
                Join<InfoAboutRent, City> cityJoin = root.join(InfoAboutRent_.region);
                specifications.add((root, query, cb)->cityJoin.get(City_.name).in(regionIds));
            }
        }

        void findBrands() {
            List<String>  filterBrand = filter.getBrand();
            filterBrand.remove(MyGlobalVariable.NOT_SELECTED);
            if (!filterBrand.isEmpty()) {
                Join<Car, Brand> brandJoin = carJoin.join(Car_.brand);
                specifications.add((root, query, cb)->brandJoin.get(Brand_.name).in(filterBrand));
            }
        }

        void filterByModel() {
            if(!filter.getModel().isEmpty()) {
                specifications.add((root, query, cb)->cb.like(carJoin.get(Car_.model), new String(filter.getModel())+"%"));
            }
        }

        void findPeriodFrom(){
            if (!filter.getPeriodOfRentFrom().isEmpty()) {
                LocalDate date = converter.convertStringToLocalDate(filter.getPeriodOfRentFrom());
                specifications.add((root, query, cb)->cb.greaterThanOrEqualTo(root.get(InfoAboutRent_.periodOfRentFrom), date));
            }
        }

        void findPeriodTo(){
            if (!filter.getPeriodOfRentTo().isEmpty()) {
                LocalDate date = converter.convertStringToLocalDate(filter.getPeriodOfRentTo());
                specifications.add((root, query, cb)->cb.lessThanOrEqualTo(root.get(InfoAboutRent_.periodOfRentTo), date));
            }
        }

        void findChauffeurs() {
            if (filter.getChauffeur()!=null && filter.getChauffeur()!= Chauffeur.Missing) {
                specifications.add((root, query, cb)->root.get(InfoAboutRent_.chauffeur).in(filter.getChauffeur()));
            }
        }
        void findBodies() {
            if (filter.getBody()!=null && filter.getBody()!= Body.Missing) {
                specifications.add((root, query, cb)->carJoin.get(Car_.body).in(filter.getBody()));
            }
        }

        void findDoors() {
            if (filter.getDoor()!=null && filter.getDoor()!= Door.Missing) {
                specifications.add((root, query, cb)->carJoin.get(Car_.numberOfDoors).in(filter.getDoor()));
            }
        }

        void findDrives() {
            if (filter.getDrive()!=null && filter.getDrive()!= Drive.Missing) {
                specifications.add((root, query, cb)->carJoin.get(Car_.drive).in(filter.getDrive()));
            }
        }

        void findEngines() {
            if (filter.getEngine()!=null && filter.getEngine()!= Engine.Missing) {
                specifications.add((root, query, cb)->carJoin.get(Car_.engine).in(filter.getEngine()));
            }
        }

        void findTransmissions() {
            if (filter.getTransmission()!=null && filter.getTransmission()!= Transmission.Missing) {
                specifications.add((root, query, cb)->carJoin.get(Car_.transmission).in(filter.getTransmission()));
            }
        }
    }
}