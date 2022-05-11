package Team.Dao;

import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class TeamDaoImpl implements TeamDao {
    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.TeamMapper";
    //전체 게시글
    @Override
    public List<TeamVO> selectTeam() {
        return sqlSession.selectList(Namespace+".selectTeam");
    }
    //전체 게시글
    @Override
    public List<TeammemberVO> countmember() {
        return sqlSession.selectList(Namespace+".countmember");
    }
    //게시글 작성
    @Override
    public String insertTeam(TeamVO teamVO) {
        return sqlSession.insert(Namespace+".insertTeam",teamVO)+"";
    }
    @Override
    public String insertTeammember(TeammemberVO teammemberVO) {
        return sqlSession.insert(Namespace+".insertTeammember",teammemberVO)+"";
    }
    @Override
    public String updateTeam(TeamVO teamVO) {
        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updateTeam", teamVO)+"";
    }
    @Override
    public List<TeammemberVO> viewTeammember(int no) {
        //Ibatis Update 사용법
        return sqlSession.selectList(Namespace+".viewTeammember",no);
    }
    @Override
    public TeamVO viewTeam(int no) {
        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace+".viewTeam", no);
    }

    public int deleteTeam(int no) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteTeam",no);
    }
    public int deletemember(int no) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deletemember",no);
    }
    public int deleteTeammember(TeammemberVO teammemberVO) {
        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteTeammember",teammemberVO);
    }


}
