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

    //전체 유저 가져오기
    public List<ProjectVO> selectAll(){return dao.selectAll();}

    //회원가입(Insert)
    public String insertProject(ProjectVO projectVO){return dao.insertProject(projectVO);}
}
