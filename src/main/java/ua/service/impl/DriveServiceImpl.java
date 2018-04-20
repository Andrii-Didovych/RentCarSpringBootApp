package ua.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import ua.entity.Drive;
import ua.service.DriveService;

@Service
public class DriveServiceImpl extends CrudServiceImpl<Drive, Integer> implements DriveService {

    @Autowired
    public DriveServiceImpl(JpaRepository<Drive, Integer> repository) {
        super(repository);
    }
}
