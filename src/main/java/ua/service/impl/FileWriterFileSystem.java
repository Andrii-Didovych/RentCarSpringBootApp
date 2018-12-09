package ua.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ua.entity.Driver;
import ua.repository.DriverRepository;
import ua.service.FileWriter;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Service
public class FileWriterFileSystem implements FileWriter {

    @Value("${file.path}")
    private String uploadPath;

    private final DriverRepository repository;

    public FileWriterFileSystem(DriverRepository repository) {
        this.repository = repository;
    }

    @Override
    public void write(MultipartFile file, String email, String bucketName) throws IOException {
        Driver driver = repository.findAuthorizeDriverByEmail(email);
        String resultFilename = saveFile(file, uploadPath);
        if (bucketName.equals("driver")) {
            driver.setPhotoURL(resultFilename);
        }else {
            driver.getCar().setPhotoOfCar(resultFilename);
        }
        repository.save(driver);
    }

    private  String saveFile(MultipartFile file, String uploadPath) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            return resultFilename;
        }else return null;
    }
}
