package Re_Comment.Dao;

import Re_Comment.Dto.Re_CommentVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.test.context.jdbc.Sql;

import javax.inject.Inject;
import java.util.List;

public class Re_CommentDaoImpl implements Re_CommentDao{

    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.Re_commentMapper";

    @Override
    public List<Re_CommentVO> selectAll() {
        return sqlSession.selectList(Namespace+"selectAll");
    }

    @Override
    public String insertRe_comment(Re_CommentVO re_commentVO) {
        return sqlSession.insert(Namespace+"insertRe_Comment",re_commentVO)+"";
    }
}
