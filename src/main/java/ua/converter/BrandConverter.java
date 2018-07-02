package ua.converter;

import com.sun.istack.internal.Nullable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import ua.entity.Brand;
import ua.repository.BrandRepository;

@Component
public class BrandConverter implements Converter<String, Brand>{

    private BrandRepository repository;

    public BrandConverter(BrandRepository repository) {
        this.repository = repository;
    }

    @Nullable
    @Override
    public Brand convert(String s) {
        return repository.findByName(s);
    }
}
