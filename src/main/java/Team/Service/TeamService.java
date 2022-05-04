package Team.Service;

import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;

import java.util.List;

public interface TeamService {

    List<TeamVO> selectTeam();
    List<TeammemberVO> countmember();
    String insertTeam(TeamVO teamVO);

    //글 수정(Update)
    String updateTeam(TeamVO teamVO);

    int deleteTeam(int no);
    int deleteTeammember(int no);

    //글 조회(View)
    List<TeammemberVO> viewTeammember(int no);
    TeamVO viewTeam(int no);

}
