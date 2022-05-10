package Risk.Service;
import Risk.Dao.RiskDao;
import Risk.Dto.RiskVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
@Service
public class RiskServiceImpl implements RiskService {

    @Inject
    private RiskDao dao;

    @Override
    public List<RiskVO> selectIssue() {return dao.selectIssue();}
    @Override
    public List<RiskVO> selectDanger() {return dao.selectDanger();}

    @Override
    public String insertRisk(RiskVO riskVO) { return dao.insertRisk(riskVO);}

    @Override
    public String updateRisk(RiskVO riskVO){
        return dao.updateRisk(riskVO);
    }

    @Override
    public RiskVO viewRisk(int post_num){
        return dao.viewRisk(post_num);
    }

    @Override
    public int delete(int post_num) { return
            dao.delete(post_num);
    }
}
