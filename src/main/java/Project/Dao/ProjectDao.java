package Project.Dao;

import Project.Dto.ProjectVO;

import java.util.List;

public interface ProjectDao {
    //사용자의 프로젝트 목록 가져오도록 바꿀거
    List<ProjectVO> selectProject();

    //프로젝트 추가
    String insertProject(ProjectVO projectVo);

    //사용자의 해당 프로젝트 리스트 불러오기
    List<ProjectVO> projectVOList(Object object);
    //글 수정 Update
    String updateProject(ProjectVO projectVo);

    //글 조회 Update
    ProjectVO viewProject(int prj_num);

    int delete(int prj_num);

}
