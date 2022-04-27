package File.Service;

import File.Dao.FileDao;
import File.Dto.FileVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.File;

@Service
public class FileServiceImpl implements FileService{
    @Inject
    private FileDao dao;

    @Override
    public void insertFile(MultipartFile[] uploadFile, int pro_num,int cate){
        System.out.println("service.insertFile....");

        String uploadFolder = "C:\\upload";

        if(uploadFile == null)
            System.out.println("uploadFile = NULL");

        for(MultipartFile multipartFile : uploadFile) {
            System.out.println("---------------------------------");
            System.out.println("Upload File Name :"+multipartFile.getOriginalFilename());
            System.out.println("Upload File Size : " + multipartFile.getSize());

            String uploadFileName = multipartFile.getOriginalFilename();
            FileVO fileVO = new FileVO(pro_num,cate,uploadFileName);

            //IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            System.out.println("only file name : " + uploadFileName);

            //DB에 정보 저장

            File saveFile = new File(uploadFolder, uploadFileName);
            //file 정보 저장
            try {
                multipartFile.transferTo(saveFile);
                dao.insertFile(fileVO);
            }catch (Exception e) {
                System.out.println(e.getMessage());
            }//end catch
        }//end for
    }
}
