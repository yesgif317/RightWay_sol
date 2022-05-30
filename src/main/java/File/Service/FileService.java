package File.Service;

import File.Dto.FileVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FileService {
    void insertFile(MultipartFile[] uploadFile, int project_num,int cate);
    List<FileVO> viewFiles(int n);
    int deleteFile(FileVO fileVO);
}
