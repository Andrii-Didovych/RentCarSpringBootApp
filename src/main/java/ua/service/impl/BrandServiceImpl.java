package ua.service.impl;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ua.entity.Brand;
import ua.repository.JpaNameRepository;
import ua.service.BrandService;


@Service
@Component
public class BrandServiceImpl extends CrudServiceImpl<Brand,Integer> implements BrandService {


    public BrandServiceImpl(JpaNameRepository<Brand, Integer> repository) {
        super(repository);
    }
}
