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
public class FileWriterImpl implements FileWriter {

    private final DriverRepository repository;

    public FileWriterImpl(DriverRepository repository) {
        this.repository = repository;
    }

    @Value("${file.path}")
    private String path;

    @Override
    public String write(MultipartFile file, String email) {
        String filename = file.getOriginalFilename();
        System.out.println(filename+"-------------");
        String [] split = filename.split("\\*.\\*");
        String expansion = split[split.length-1];
        System.out.println(expansion+"-expansion----------- ");
        String newName = UUID.randomUUID().toString().concat(".").concat(expansion);
        File oldFile =new File(path, file.getOriginalFilename());
        File newFile =new File(path, newName);
        if(oldFile.renameTo(newFile)){
            System.out.println("Rename succesful");
        }else{
            System.out.println("Rename failed");
        }

        try {
            file.transferTo(newFile);
            Driver driver = repository.findAuthorizeDriverByEmail(email);
            driver.setPhotoURL(newName);
            repository.save(driver);
        } catch (IOException e) {
            return null;
        }
        return newFile.toString();
    }
}
