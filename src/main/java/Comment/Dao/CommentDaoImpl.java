package Comment.Dao;

import Comment.Dto.CommentVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class CommentDaoImpl implements CommentDao{

    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.CommentMapper";

    @Override
    public List<CommentVO> selectCommentAll() {
        return sqlSession.selectList(Namespace +".selectCommentAll");
    }
    @Override
    public List<CommentVO> selectCommentbyPost(int no) {
        return sqlSession.selectList(Namespace +".selectCommentbyPost",no);
    }
    //댓글추가
    @Override
    public void insertComment(CommentVO commentVO) {
        //public String insertComment(CommentVO commentVO) {
        sqlSession.insert(Namespace+".insertComment",commentVO);

        //return sqlSession.insert(Namespace+".insertComment", commentVO)+"";
    }

    @Override
    public String updateComment(CommentVO commentVO) {
        return sqlSession.update(Namespace+".updateComment",commentVO)+"";
    }


    public int deleteComment(int no) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteComment",no);
    }
    public int deleteCommentbyPost(int no) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteCommentbyPost",no);
    }
    public int countComment(int post_num) {
        return sqlSession.selectOne(Namespace+".countComment", post_num);
    }


    /*
    public CommentVO countComment(int post_num) {
        return sqlSession.selectOne(Namespace+".countComment");
    }
    */

    @Override
    public List<CommentVO> selectComment_fromNew(Object object) {
        return sqlSession.selectList(Namespace +".selectComment_fromNew",object);
    }
    @Override
    public List<CommentVO> selectReComment_fromNew(Object object) {
        return sqlSession.selectList(Namespace +".selectReComment_fromNew",object);
    }

}
