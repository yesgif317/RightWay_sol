package Project.Service;

import Customer.Service.CustomerService;
import Project.Dao.ProjectDao;
import Project.Dto.ProjectVo;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
@Service
public class ProjectServiceImpl implements ProjectService {

    @Inject
    private ProjectDao dao;

    //전체 유저 가져오기
    public List<ProjectVo> selectAll(){return dao.selectAll();}

    //회원가입(Insert)
    public String insertProject(ProjectVo projectVO){return dao.insertProject(projectVO);}
}
