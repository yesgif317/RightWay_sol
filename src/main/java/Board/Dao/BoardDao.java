package Board.Dao;

import java.util.List;

import Board.Dto.BoardVO;

public interface BoardDao {
    List<BoardVO> selectAll();

    //글 작성 Insert
    String insertBoard(BoardVO boardVO);

    //글 수정 Update
    String updateBoard(BoardVO boardVO);

    //글 조회 Update
    BoardVO viewBoard(int no);

    int delete(int no);
}
