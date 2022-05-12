package Project.Service;
import Project.Dao.ProjectDao;
import Project.Dto.ProjectVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Inject
    private ProjectDao dao;

    @Override
    public List<ProjectVO> selectProject(){return dao.selectProject();}

    @Override
    public String insertProject(ProjectVO projectVO){return dao.insertProject(projectVO);}

    @Override
    public List<ProjectVO> projectVOList(Object object) {
        return dao.projectVOList(object);
    }

    @Override
    public String updateProject(ProjectVO projectVO){
        return dao.updateProject(projectVO);
    }

    @Override
    public ProjectVO viewProject(int prj_num){
        return dao.viewProject(prj_num);
    }

    @Override
    public int delete(int prj_num) { return
            dao.delete(prj_num);
    }
}
