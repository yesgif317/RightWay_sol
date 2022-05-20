package Project.Service;

import Project.Dto.ProjectDetailVO;
import Project.Dto.ProjectVO;
import javafx.beans.binding.ObjectExpression;

import java.util.List;

public interface ProjectService {
    //사용자의 프로젝트 가져오기
    List<ProjectVO> selectProject();
    List<ProjectDetailVO> selectProject_detail(int prj_num);

    //프로젝트 번호 가져오기
    ProjectVO selectProjectNum(String prj_name);

    //프로젝트 추가(Insert)
    String insertProject(ProjectVO projectVO);
    String insertProject_detail(ProjectDetailVO projectVO);

    //사용자의 해당 프로젝트 리스트 불러오기
    List<ProjectVO> projectVOList(Object object);

    //프로젝트 번호 가져오기
    ProjectVO selectproject_list(String prj_name);

    ProjectVO selectproject_list2(Object object);

    //글 수정(Update)
    String updateProject(ProjectVO projectVO);

    //삭제
    int delete(int prj_num);
    int deleteAllProject_detail(int prj_num);
    int deleteProject_detail(ProjectDetailVO projectVO);

    //글 조회(View)
    ProjectVO viewProject(int prj_num);

    List<ProjectDetailVO> countcus(Object object);

    String selectFirstProjectName();
}
