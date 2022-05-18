package Team.Service;

import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;

import java.util.List;

public interface TeamService {
    //팀 목록 보기
    List<TeamVO> selectTeam(Object object);
    //팀원 수 세기
    List<TeammemberVO> countmember();
    //팀 등록하기
    String insertTeam(TeamVO teamVO);
    String insertTeammember(TeammemberVO teammemberVO);

    //팀 정보 수정(Update)
    String updateTeam(TeamVO teamVO);
    //팀 지우기
    int deleteTeam(int no);
    //팀 지우기
    int deletemember(int no);
    //팀원 지우기
    int deleteTeammember(TeammemberVO teammemberVO);

    //팀원 조회(View)
    List<TeammemberVO> viewTeammember(int no);
    //팀 상세 조회
    TeamVO viewTeam(int no);


}
