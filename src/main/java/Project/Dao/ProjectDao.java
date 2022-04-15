package Project.Dao;

import Project.Dto.ProjectVO;

import java.util.List;

public interface ProjectDao {
    //사용자의 프로젝트 목록 가져오도록 바꿀거
    List<ProjectVO> selectAll();

    //프로젝트 추가
    String insertProject(ProjectVO projectVo);

}
