package Project.Dao;

import Project.Dto.ProjectDetailVO;
import Project.Dto.ProjectVO;

import java.util.List;

public interface ProjectDao {
    //사용자의 프로젝트 목록 가져오도록 바꿀거
    List<ProjectVO> selectProject();
    List<ProjectDetailVO> selectProject_detail(int prj_no);

    ProjectVO selectProjectNum(String prj_name);

    //프로젝트 추가
    String insertProject(ProjectVO projectVo);
    String insertProject_detail(ProjectDetailVO projectDetailVO);

    //사용자의 해당 프로젝트 리스트 불러오기
    List<ProjectVO> projectVOList(Object object);
    //글 수정 Update
    String updateProject(ProjectVO projectVo);

    //글 조회 Update
    ProjectVO viewProject(int prj_num);

    int delete(int prj_num);
    int deleteAllProject_detail(int prj_num);
    int deleteProject_detail(ProjectDetailVO projectVO);
}
