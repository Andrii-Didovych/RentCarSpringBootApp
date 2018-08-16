package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.Brand;
import ua.entity.Car;
import ua.entity.City;
import ua.entity.Driver;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Integer> {

    @Query("select b.name from Brand b where b.id<>1")
    List<String> findAllBrands();

    @Query("select c.name from City c where c.id<>1")
    List<String> findAllCities();

    @Query("select c from City c where c.id =?1")
    City findCityById();

    @Query("select b from Brand b where b.id=1")
    Brand findBrandById();

    @Query("select d from Driver d join d.user u where  u.email = ?1")
    Driver findCarByUserEmail(String email);
}
