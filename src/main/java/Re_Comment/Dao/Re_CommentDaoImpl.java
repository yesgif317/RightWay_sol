package Re_Comment.Dao;

import Re_Comment.Dto.Re_CommentVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class Re_CommentDaoImpl implements Re_CommentDao {

    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.Re_CommentMapper";

    @Override
    public List<Re_CommentVO> selectRe_CommentAll() {
        return sqlSession.selectList(Namespace+".selectRe_CommentAll");
    }

    @Override
    public String insertRe_Comment(Re_CommentVO re_commentVO) {
        return sqlSession.insert(Namespace+".insertRe_Comment",re_commentVO)+"";
    }

    @Override
    public String updateRe_Comment(Re_CommentVO re_commentVO) {
        return sqlSession.update(Namespace+".updateRe_Comment",re_commentVO)+"";
    }

    public int deleteRe_Comment(int no) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteRe_Comment",no);
    }
    public int deleteRe_CommentAll(int no) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteRe_CommentAll",no);
    }
/*
    public int re_countComment(int post_num) {
        int count=0;
        count = sqlSession.selectOne(Namespace+".re_countComment", post_num);
        return count;
    }
 */
}
