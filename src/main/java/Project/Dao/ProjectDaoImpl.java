package Project.Dao;

import Project.Dto.ProjectVo;
import org.apache.ibatis.session.SqlSession;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;
import java.util.List;

public class ProjectDaoImpl implements ProjectDao{
    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.ProjectMapper";
    @Override
    public List<ProjectVo> selectAll() {
        return sqlSession.selectList(Namespace + "selectProject");
    }

    @Override
    public String insertProject(ProjectVo projectVo) {
        return sqlSession.insert(Namespace + "insertProject",projectVo)+"";
    }
}
