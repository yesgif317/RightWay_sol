package Project.Dao;

import Project.Dto.ProjectVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ProjectDaoImpl implements ProjectDao{

    @Inject
    private SqlSession sqlSession;

    private static final String Namespace = "com.mark.mappers.ProjectMapper";

    @Override
    public List<ProjectVO> selectProject() {
        return sqlSession.selectList(Namespace + ".selectProject");
    }

    @Override
    public String insertProject(ProjectVO projectVo) {
        return sqlSession.insert(Namespace + ".insertProject",projectVo)+"";
    }

    @Override
    public String updateProject(ProjectVO projectVo) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updateProject",projectVo)+"";
    }

    @Override
    public ProjectVO viewProject(int prj_num) {

        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace+".viewProject",prj_num);
    }

    public int delete(int prj_num) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".delete",prj_num);
    }
}
