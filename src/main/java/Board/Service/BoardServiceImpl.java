package Board.Service;

import Board.Dao.BoardDao;
import Board.Dto.BoardVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Inject
    private BoardDao dao;

    // 게시판 글 전체 가져오기
    @Override
    public List<BoardVO> selectAll() {
        return dao.selectAll();
    }

    // 게시판 글 작성
    @Override
    public String insertBoard(BoardVO boardVO){
        return dao.insertBoard(boardVO);
    }

    // 게시판 글 작성
    @Override
    public String updateBoard(BoardVO boardVO){
        return dao.updateBoard(boardVO);
    }

    @Override
    public BoardVO viewBoard(int num){
        return dao.viewBoard(num);
    }
    @Override
    public int delete(int num) { return
        dao.delete(num);
    }
}