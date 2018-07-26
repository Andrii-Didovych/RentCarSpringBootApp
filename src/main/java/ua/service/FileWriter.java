package ua.service;

import org.jets3t.service.S3ServiceException;
import org.springframework.web.multipart.MultipartFile;

public interface FileWriter {
    void writeToAmazonS3(MultipartFile file, String email, String bucketName) throws S3ServiceException;
}
