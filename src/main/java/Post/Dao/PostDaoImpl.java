package Post.Dao;

import Post.Dto.PostVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class PostDaoImpl implements PostDao{

    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.PostMapper";

    //전체 게시글
    @Override
    public List<PostVO> selectAll() {
        return sqlSession.selectList(Namespace+".selectPost");
    }
    //게시글 작성
    @Override
    public String insertPost(PostVO postVO) {
        return sqlSession.insert(Namespace+".insertPost",postVO)+"";
    }
}
