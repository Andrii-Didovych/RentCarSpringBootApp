package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.City;
import ua.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email);

    @Query("select c.name from City c")
    List<String> findAllCitiesRepository();

    @Query("select c from City c where c.id=?1")
    City findCityByNameRepository(int id);
}
