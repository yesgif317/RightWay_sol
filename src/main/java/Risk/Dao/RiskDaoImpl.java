package Risk.Dao;

import Risk.Dto.RiskVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class RiskDaoImpl implements RiskDao {

    @Inject
    private SqlSession sqlSession;

    private static final String Namespace = "com.mark.mappers.RiskMapper";

    // 게시판 전체 글 조회
    @Override
    public List<RiskVO> selectIssue(Object object) {
        //Ibatis Select 사용법
        return sqlSession.selectList(Namespace + ".selectIssue", object);
    }

    @Override
    public List<RiskVO> selectDanger(Object object) {
        //Ibatis Select 사용법
        return sqlSession.selectList(Namespace + ".selectDanger", object);
    }
    @Override
    public List<RiskVO> selectallrisk() {
        //Ibatis Select 사용법
        return sqlSession.selectList(Namespace + ".selectallrisk");
    }
    // 게시판 글 작성
    @Override
    public String insertRisk(RiskVO RiskVO) {

        //Ibatis Insert 사용법
        return sqlSession.insert(Namespace + ".insertRisk", RiskVO) + "";
    }

    @Override
    public String updateRisk(RiskVO RiskVO) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace + ".updateRisk", RiskVO) + "";
    }

    @Override
    public RiskVO viewRisk(int post_num) {

        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace + ".viewRisk", post_num);
    }

    public int delete(int post_num) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace + ".delete", post_num);
    }


}
