package File.Dao;

import File.Dto.FileVO;

import java.util.List;

public interface FileDao {
    void insertFile(FileVO fileVO);
    List<FileVO> viewFiles(int n);
    int deleteFile(FileVO fileVO);
    //normal 게시글 번호 얻기
    int selectSeq();
    //risk 게시글 번호 얻기
    int selectRiskSeq();
}
