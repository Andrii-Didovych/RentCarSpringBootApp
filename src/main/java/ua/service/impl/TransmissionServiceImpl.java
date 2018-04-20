package ua.service.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.Transmission;
import ua.service.TransmissionServise;

@Service
public class TransmissionServiceImpl extends CrudServiceImpl<Transmission,Integer> implements TransmissionServise {
    public TransmissionServiceImpl(JpaRepository<Transmission, Integer> repository) {
        super(repository);
    }
}
