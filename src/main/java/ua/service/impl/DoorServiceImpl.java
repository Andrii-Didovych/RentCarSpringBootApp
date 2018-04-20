package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.Door;
import ua.service.DoorService;

@Service
public class DoorServiceImpl extends CrudServiceImpl<Door,Integer> implements DoorService {
    @Autowired
    public DoorServiceImpl(JpaRepository<Door, Integer> repository) {
        super(repository);
    }
}
