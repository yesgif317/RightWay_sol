package Team.Dao;

import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;

import java.util.List;

public interface TeamDao {
    //글 목록
    List<TeamVO> selectTeam();
    //글 입력
    String insertTeam(TeamVO teamVO);
    //글 수정 Update
    String updateTeam(TeamVO teamVO);
    //글 조회
    TeamVO viewTeam(int no);
    //팀 삭제
    int deleteTeam(int no);
    //팀 삭제
    int deletemember(int no);
    //팀원 조회
    List<TeammemberVO> viewTeammember(int no);

    //팀원 추가
    String insertTeammember(TeammemberVO teammemberVO);

    //팀원 수 세기
    List<TeammemberVO> countmember();
    //팀멤버 삭제
    int deleteTeammember(TeammemberVO teammemberVO);
}
