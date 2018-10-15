package ua.service.impl;

import org.jets3t.service.S3Service;
import org.jets3t.service.S3ServiceException;
import org.jets3t.service.ServiceException;
import org.jets3t.service.acl.AccessControlList;
import org.jets3t.service.acl.GroupGrantee;
import org.jets3t.service.acl.Permission;
import org.jets3t.service.impl.rest.httpclient.RestS3Service;
import org.jets3t.service.model.S3Bucket;
import org.jets3t.service.model.S3Object;
import org.jets3t.service.security.AWSCredentials;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ua.entity.Driver;
import ua.repository.DriverRepository;
import ua.service.FileWriter;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Service
public class FileWriterImpl implements FileWriter {

    private final DriverRepository repository;

    public FileWriterImpl(DriverRepository repository) {
        this.repository = repository;
    }

    @Override
    public void writeToAmazonS3(MultipartFile file, String email, String bucketName) throws S3ServiceException {
        AWSCredentials credentials = new AWSCredentials("AKIAJRJD4TFWEDOA45CA","5MFRYaMc8/EWXXCGkSkao5ULwi6bRGX6L8o0GO2M");
        S3Service s3 = new RestS3Service(credentials);
        S3Bucket imageBucket = s3.getBucket(bucketName);
        File newName = renameFile(file);
        S3Object imageObject = new S3Object(newName.getName());
        try {
            imageObject.setDataInputStream(new ByteArrayInputStream(file.getBytes()));
            imageObject.setContentLength(file.getBytes().length);
            AccessControlList list = new AccessControlList();
            list.setOwner(imageBucket.getOwner());
            list.grantPermission(GroupGrantee.ALL_USERS,Permission.PERMISSION_READ);
            imageObject.setAcl(list);

            Driver driver = repository.findAuthorizeDriverByEmail(email);
            String photo = determinatePhoto(driver, bucketName);
            if(!(photo.equals(MyGlobalVariable.DEFAULT_PHOTO_OF_DRIVER)||photo.equals(MyGlobalVariable.DEFAULT_PHOTO_OF_CAR)))
            s3.deleteObject(imageBucket.getName(), photo);
            s3.putObject(imageBucket, imageObject);
            savePhotoIntoDatabase(driver, bucketName, newName.getName());
        } catch (IOException | ServiceException e) {
            e.printStackTrace();
        }
    }

// In order to delete previous photo from correct bucket
    private String determinatePhoto(Driver driver, String bucketName){
        if (bucketName.equals(MyGlobalVariable.DRIVERS_BUCKET))return driver.getPhotoURL();
        else return driver.getCar().getPhotoOfCar();
    }

    private void savePhotoIntoDatabase(Driver driver, String bucketName, String newName){
        if (bucketName.equals(MyGlobalVariable.DRIVERS_BUCKET)){
            driver.setPhotoURL(newName);
        }else driver.getCar().setPhotoOfCar(newName);
        repository.save(driver);
    }

    private File renameFile(MultipartFile file) {
        String filename = file.getOriginalFilename();
        String[] split = filename.split("\\.");
        String expansion = split[split.length - 1];
        String newName = UUID.randomUUID().toString().concat(".").concat(expansion);
        File oldFile = new File( file.getOriginalFilename());
        File newFile = new File( newName);
        oldFile.renameTo(newFile);
        return newFile;
    }
}
