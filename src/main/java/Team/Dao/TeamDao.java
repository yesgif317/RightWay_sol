package Team.Dao;

import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;

import java.util.List;

public interface TeamDao {
    //글 목록
    List<TeamVO> selectTeam();

    List<TeammemberVO> countmember();
    //글 입력
    String insertTeam(TeamVO teamVO);

    //글 수정 Update
    String updateTeam(TeamVO teamVO);

    //글 조회
    List<TeammemberVO> viewTeammember(int no);

    TeamVO viewTeam(int no);
    //팀 삭제
    int deleteTeam(int no);
    //팀멤버 삭제
    int deleteTeammember(int no);

}
