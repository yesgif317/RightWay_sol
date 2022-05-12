package Team.Service;

import Team.Dao.TeamDao;
import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class TeamServiceImpl implements TeamService {

    @Inject
    private TeamDao dao;


    @Override
    public List<TeamVO> selectTeam() {
        return dao.selectTeam();
    }

    @Override
    public List<TeammemberVO> countmember() {
        return dao.countmember();
    }

    @Override
    public String insertTeam(TeamVO teamVO) {
        return dao.insertTeam(teamVO);
    }

    @Override
    public String updateTeam(TeamVO teamVO){
        return dao.updateTeam(teamVO);
    }

    @Override
    public List<TeammemberVO> viewTeammember(int no){
        return dao.viewTeammember(no);
    }
    @Override
    public TeamVO viewTeam(int no){
        return dao.viewTeam(no);
    }

    @Override
    public int deleteTeam(int no) { return dao.deleteTeam(no);}
    @Override
    public int deletemember(int no) { return dao.deletemember(no);}
    @Override
    public int deleteTeammember(TeammemberVO teammemberVO) { return dao.deleteTeammember(teammemberVO);}

    @Override
    public String insertTeammember(TeammemberVO teammemberVO) {
        return dao.insertTeammember(teammemberVO);
    }

}
