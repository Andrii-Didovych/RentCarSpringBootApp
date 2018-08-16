package ua.model.request;

import org.springframework.web.multipart.MultipartFile;
import ua.validation.annotation.CorrectFileSize;

public class FileRequestCar {
    @CorrectFileSize
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
