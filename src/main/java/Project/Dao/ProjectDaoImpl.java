package Project.Dao;

import Project.Dto.ProjectVO;
import org.apache.ibatis.session.SqlSession;

import javax.inject.Inject;
import java.util.List;

public class ProjectDaoImpl implements ProjectDao{
    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.ProjectMapper";
    @Override
    public List<ProjectVO> selectAll() {
        return sqlSession.selectList(Namespace + "selectProject");
    }

    @Override
    public String insertProject(ProjectVO projectVo) {
        return sqlSession.insert(Namespace + "insertProject",projectVo)+"";
    }
}
