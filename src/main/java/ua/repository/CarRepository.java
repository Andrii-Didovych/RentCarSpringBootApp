package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.entity.Car;

public interface CarRepository extends JpaRepository<Car, Integer> {
}
