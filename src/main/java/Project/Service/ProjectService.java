package Project.Service;
import Project.Dto.ProjectVO;

import java.util.List;

public interface ProjectService {
    //사용자의 프로젝트 가져오기
    List<ProjectVO> selectAll();

    //프로젝트 추가(Insert)
    String insertProject(ProjectVO customerVO);
}
