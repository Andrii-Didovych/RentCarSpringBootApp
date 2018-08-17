package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.Comment;
import ua.entity.Driver;
import ua.model.view.CarView;
import ua.model.view.CommentView;
import ua.model.view.DriverView;

import java.util.List;

public interface DriverRepository extends JpaRepository<Driver,Integer> {

    Driver findByPhone(String phone);

//    ???????????????????????/for file
    @Query("select d from Driver d join d.user u where u.email = ?1")
    Driver findAuthorizeDriverByEmail(String email);

    @Query("select d.id from Driver d join d.user u where u.email=?1")
    Integer findIdOfDriverByEmail(String name);

    @Query("select new ua.model.view.DriverView(d.id, d.name, d.surname, d.phone, d.photoURL," +
            "d.countOfTrips, p.name, d.dateOfBirth, d.experienceBegan) " +
            "from Driver  d join d.placeOfBirth p where d.id=?1")
    DriverView findDriverViewById(Integer id);

    @Query("select new ua.model.view.CarView(c.id, c.photoOfCar, b.name, c.model, c.yearOfManufacture,\n" +
            "c.engine, c.transmission, c.drive, c.body, c.numberOfDoors) from Car c join c.brand b " +
            "join c.driver d  where d.id =?1")
    CarView findCarViewByDriverId(Integer id);

    @Query("select new ua.model.view.CommentView(c.text, c.date, r.id, s.id, s.name, s.surname, s.photoURL)" +
            "from Comment c join c.sender s join c.receiver r where r.id=?1 order by c desc")
    List<CommentView> findCommentsOfDriver(Integer id);
}
