package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.Driver;
import ua.model.view.DriverView;

import java.util.List;

public interface DriverRepository extends JpaRepository<Driver,Integer> {

    @Query("select c from City c")
    List<String> findAllCitiesRepository();

    @Query("select new ua.model.view.DriverView(d.id, d.name, d.surname, d.phone, d.age, d.experience, " +
            "d.countOfTrips, c.name) from Driver  d join d.placeOfBirth c where d.id =1")
    DriverView findAllDriverRepository();
}
