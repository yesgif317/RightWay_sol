package Comment.Dao;

import Comment.Dto.CommentVO;
import org.apache.ibatis.session.SqlSession;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;
import java.util.List;

public class CommentDaoImpl implements CommentDao{

    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.Comment";

    @Override
    public List<CommentVO> selectAll() {
        return sqlSession.selectList(Namespace +".selectAll");
    }

    //댓글추가
    @Override
    public String insertComment(CommentVO commentVO) {
        return sqlSession.insert(Namespace+".insertComment",commentVO)+"";
    }
}
