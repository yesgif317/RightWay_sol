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
    public List<NormalVO> selectAll() {
        return sqlSession.selectList(Namespace+".selectPost");
    }
    //게시글 작성
    @Override
    public String insertPost(NormalVO postVO) {
        return sqlSession.insert(Namespace+".insertPost",postVO)+"";
    }
}
