package ua.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import ua.entity.City;
import ua.filter.SimpleFilter;

public interface CityCervice extends CrudService<City, Integer> {
    Page<City> findAll(Pageable pageable, SimpleFilter filter);
}
