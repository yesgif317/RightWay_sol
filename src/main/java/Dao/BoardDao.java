package Dao;

import java.util.List;

import  Dto.BoardVO;

public interface BoardDao {
    List<BoardVO> selectAll();

    //글 작성 Insert
    String insertBoard(BoardVO boardVO);

    //글 수정 Update
    String updateBoard(BoardVO boardVO);
}
