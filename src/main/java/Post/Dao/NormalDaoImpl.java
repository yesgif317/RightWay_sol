package Post.Dao;

import Post.Dto.NormalVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class NormalDaoImpl implements NormalDao {

    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.PostMapper";

    //전체 게시글


    @Override
    public List<NormalVO> selectPost() {
        return sqlSession.selectList(Namespace+".selectPost");
    }
    //프로젝트
    @Override
    public List<NormalVO> selectPrj_num() {
        return sqlSession.selectList(Namespace+".selectPrj_num");
    }
    //게시글 작성
    @Override
    public String insertPost(NormalVO postVO) {
        return sqlSession.insert(Namespace+".insertPost",postVO)+"";
    }

    @Override
    public String updatePost(NormalVO postVO) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updatePost", postVO)+"";
    }

    @Override
    public NormalVO viewPost(int no) {
        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace+".viewPost",no);
    }

    public int deletePost(int no) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deletePost",no);
    }


}
