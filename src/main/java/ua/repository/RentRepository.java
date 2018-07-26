package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.Driver;
import ua.entity.InfoAboutRent;
import ua.entity.enums.Status;
import ua.model.view.CarView;
import ua.model.view.DriverView;
import ua.model.view.OrderView;

import java.util.List;

public interface RentRepository extends JpaRepository<InfoAboutRent,Integer> {

//    -------------------------query for LendController --------------------------------
    @Query("select d from Driver d join d.user u where  u.email = ?1")
    Driver findDriverByUserEmail(String email);

    //User can add only one active order, for next order user should finish previous
    @Query("select inf from InfoAboutRent inf join inf.car c join c.driver d join d.user u where u.email=?1 and inf.status=?2")
    InfoAboutRent checkIfOrderIsActive(String email, Status active);

    @Query("select c.name from City c")
    List<String> findAllCities();

    @Query("select new ua.model.view.OrderView(o.id, ds.id, o.pricePerDay, o.periodOfRentFrom, o.periodOfRentTo, r.name, o.chauffeur, o.status)" +
            "from InfoAboutRent o join o.drivers ds join o.region r join o.car c join c.driver d join d.user u where u.email=?1 and o.status = ?2 order by o desc")
    List<OrderView> findFinishedOrders(String email, Status passive);

    @Query("select new ua.model.view.OrderView(o.id, o.pricePerDay, o.periodOfRentFrom, o.periodOfRentTo, r.name, o.chauffeur, o.status)" +
            "from InfoAboutRent o join o.region r join o.car c join c.driver d join d.user u where u.email=?1 and (o.status =?2 or o.status =?3 or o.status =?4)")
    OrderView findParticularOrder(String email, Status active, Status reserved, Status completed);

    @Query("select new ua.model.view.DriverView(d.id, d.name, d.surname, d.phone, d.photoURL,  d.countOfTrips, p.name, d.dateOfBirth, d.experienceBegan)" +
            " from Driver d join d.placeOfBirth p join d.listOfInfoAboutCar inf where inf.id =?1 and inf.status =?2")
    List<DriverView> findAllClients(Integer id, Status active);

    @Query("select new ua.model.view.DriverView(d.id, d.name, d.surname, d.phone, d.photoURL, d.countOfTrips, p.name, d.dateOfBirth, d.experienceBegan)" +
            " from Driver d join d.placeOfBirth p join d.listOfInfoAboutCar inf where inf.id =?1 and (inf.status=?2 or inf.status = ?3)")
    List<DriverView> findReservedOrder(Integer id, Status reserved, Status completed);

    @Query("select d from Driver d where d.id=?1")
    Driver findOneDriver(Integer id);

    @Query("select o from InfoAboutRent o where o.id=?1")
    InfoAboutRent findParticularOrderById(Integer id);

//    -----------------------query for BorrowController---------------------
    @Query("select i from InfoAboutRent i where i.id=?1")
    InfoAboutRent findOrderById(Integer id);

    @Query("select new ua.model.view.OrderView(o.id, d.id, o.pricePerDay, o.periodOfRentFrom, o.periodOfRentTo, r.name, o.chauffeur, o.status, d.name, d.surname, b.name, c.model, d.photoURL, c.photoOfCar)" +
            "from InfoAboutRent o join o.region r join o.car c join c.brand b join c.driver d where d.id<> ?1 and o.status= ?2  order by o desc")
    List<OrderView> findAllFreeCars(Integer id, Status status);

    @Query("select new ua.model.view.OrderView(o.id, ds.id, o.pricePerDay, o.periodOfRentFrom, o.periodOfRentTo, r.name, o.chauffeur, o.status, d.name, d.surname, b.name, c.model, d.photoURL, c.photoOfCar)" +
            "from InfoAboutRent o join o.car c join c.brand b join c.driver d join o.drivers ds join o.region r where ds.id = ?1 and (o.status = ?2 or o.status=?3)  order by o desc")
    List<OrderView> findOrdersByDriverId(Integer id, Status active, Status completed);
}
