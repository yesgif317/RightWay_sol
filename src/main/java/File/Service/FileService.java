package File.Service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
    void insertFile(MultipartFile[] uploadFile, int project_num,int cate);

}
