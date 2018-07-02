package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.Driver;
import ua.model.view.CarView;
import ua.model.view.DriverView;

public interface DriverRepository extends JpaRepository<Driver,Integer> {

    Driver findByPhone(String phone);

    @Query("select new ua.model.view.DriverView(d.id, d.name, d.surname, d.phone, d.photoURL, " +
            "d.countOfTrips, p.name, d.dateOfBirth, d.experienceBegan) " +
            "from Driver  d join d.placeOfBirth p  join d.user u where u.email =?1")
    DriverView findAuthorizeDriverViewRepository(String email);

    @Query("select new ua.model.view.CarView(c.id, b.name, c.model, c.yearOfManufacture,\n" +
            "c.engine, c.transmission, c.drive, c.body, c.numberOfDoors) from Car c join c.brand b " +
            "join c.driver d join d.user u where u.email =?1")
    CarView findCarByDriversId(String email);

    @Query("select new ua.model.view.DriverView(d.id, d.name, d.surname, d.phone, " +
            "d.countOfTrips, p.name, d.dateOfBirth, d.experienceBegan) " +
            "from Driver  d join d.placeOfBirth p where d.id=?1")
    DriverView findPageOfDriverById(Integer id);

    @Query("select d from Driver d join d.user u where u.email = ?1")
    Driver findAuthorizeDriverByEmail(String email);
}
