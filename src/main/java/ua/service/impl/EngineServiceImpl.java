package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.Engine;
import ua.entity.Transmission;
import ua.service.EngineService;
import ua.service.TransmissionServise;

@Service
public class EngineServiceImpl extends CrudServiceImpl<Engine, Integer> implements EngineService {
    @Autowired
    public EngineServiceImpl(JpaRepository<Engine, Integer> repository) {
        super(repository);
    }
}
