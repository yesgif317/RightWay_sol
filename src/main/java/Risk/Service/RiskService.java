package Risk.Service;

import Risk.Dto.RiskVO;

import java.util.List;

public interface RiskService {
    //목록 조회
    List<RiskVO> selectIssue(Object object);
    List<RiskVO> selectDanger(Object object);
    List<RiskVO> selectallrisk();
    //등록
    String insertRisk(RiskVO riskVO);
    //글 수정(Update)
    String updateRisk(RiskVO riskVO);
    //삭제
    int delete(int post_num);
    //글 조회(View)
    RiskVO viewRisk(int post_num);
}
