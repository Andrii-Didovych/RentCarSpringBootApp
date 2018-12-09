package ua.service;

import org.jets3t.service.S3ServiceException;
import org.springframework.web.multipart.MultipartFile;
import ua.model.request.FileRequestCar;

import java.io.IOException;

public interface FileWriter {
    void write(MultipartFile file, String email, String bucketName) throws S3ServiceException, IOException;
}

