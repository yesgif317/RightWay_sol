package Project.Service;

import Project.Dto.ProjectVO;

import java.util.List;

public interface ProjectService {
    //사용자의 프로젝트 가져오기
    List<ProjectVO> selectProject();

    //프로젝트 추가(Insert)
    String insertProject(ProjectVO projectVO);

    //사용자의 해당 프로젝트 리스트 불러오기
    List<ProjectVO> projectVOList(Object object);

    //글 수정(Update)
    String updateProject(ProjectVO projectVO);

    //삭제
    int delete(int prj_num);

    //글 조회(View)
    ProjectVO viewProject(int prj_num);
}
