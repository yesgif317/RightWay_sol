package File.Dao;

import File.Dto.FileVO;

import java.util.List;

public interface FileDao {
    void insertFile(FileVO fileVO);
    List<FileVO> viewFiles(int n);

    int selectSeq();
}
