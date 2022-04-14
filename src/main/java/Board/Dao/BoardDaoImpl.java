package Board.Dao;

import javax.inject.Inject;

import java.util.List;

import Board.Dto.BoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements  BoardDao {

    @Inject
    private SqlSession sqlSession;

    private  static final String Namespace = "com.mark.mappers.BoardMapper";

    // 게시판 전체 글 조회
    @Override
    public List<BoardVO> selectAll() {
        //Ibatis Select 사용법
        return sqlSession.selectList(Namespace+".selectBoard");
    }

    // 게시판 글 작성
    @Override
    public String insertBoard(BoardVO boardVO) {

        //Ibatis Insert 사용법
        return sqlSession.insert(Namespace+".insertBoard", boardVO)+"";
    }

    @Override
    public String updateBoard(BoardVO boardVO) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updateBoard", boardVO)+"";
    }
}
