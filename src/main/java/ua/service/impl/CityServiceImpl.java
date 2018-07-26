package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.Brand;
import ua.entity.City;
import ua.filter.SimpleFilter;
import ua.repository.CityRepository;
import ua.repository.JpaNameRepository;
import ua.service.CityCervice;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Service
public class CityServiceImpl extends CrudServiceImpl<City,Integer> implements CityCervice{

    private CityRepository repository;

    @Autowired
    public CityServiceImpl(CityRepository repository) {
        super(repository);
        this.repository = repository;
    }

    @Override
    public Page<City> findAll(Pageable pageable, SimpleFilter filter) {
        return repository.findAll(filter(filter), pageable);
    }

    private Specification<City> filter(SimpleFilter filter) {
        return new Specification<City>() {
            @Override
            public Predicate toPredicate(Root<City> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                if (filter.getSearch().isEmpty())return null;
                return criteriaBuilder.like(root.get("name"), filter.getSearch()+"%");
            }
        };
    }
}
