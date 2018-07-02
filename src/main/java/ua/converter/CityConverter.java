package ua.converter;

import com.sun.istack.internal.Nullable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import ua.entity.City;
import ua.repository.CityRepository;

@Component
public class CityConverter implements Converter<String, City>{

    private CityRepository repository;

    public CityConverter(CityRepository repository) {
        this.repository = repository;
    }

    @Nullable
    @Override
    public City convert(String s) {
        return repository.findByName(s);
    }
}
